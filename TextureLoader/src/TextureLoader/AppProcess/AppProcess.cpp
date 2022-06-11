#include "pch.h"
#include "AppProcess.h"
#include <TlHelp32.h>
#include <Psapi.h>

int AppProcess::IGetProcessID()
{
	DWORD procID = 0;

	// Crea una lista con los procesos activos de windows
	HANDLE hSnap = CreateToolhelp32Snapshot(TH32CS_SNAPPROCESS, 0);

	// Comprueba si la lista no es invalida
	if (hSnap != INVALID_HANDLE_VALUE)
	{
		// Crea una entrada para nuestro proceso
		PROCESSENTRY32 procEntry;
		procEntry.dwSize = sizeof(procEntry);

		// Loop entre todos los procesos de la lista
		if (Process32First(hSnap, &procEntry))
		{
			do
			{
				// Si el nombre del proceso coincide con el nombre de nuestro programa se guardara la ID del proceso
				if (wcscmp(procEntry.szExeFile, m_ProcessName) == 0)
				{
					procID = procEntry.th32ProcessID;
					break;
				}
			} while (Process32Next(hSnap, &procEntry));
		}
	}

	CloseHandle(hSnap);
	return procID;
}

AppProcess::AppProcess(const wchar_t* name)
{
	m_ProcessName = name;
	m_ProcessID = 0;
	m_Process = INVALID_HANDLE_VALUE;
}

AppProcess::AppProcess(const wchar_t* name, int id)
{
	m_ProcessName = name;
	m_ProcessID = id;
	m_Process = INVALID_HANDLE_VALUE;
}

AppProcess::~AppProcess()
{
	CloseHandle(m_Process);
}

void AppProcess::AttachProcess()
{
	m_ProcessID = IGetProcessID();
	m_Process = OpenProcess(PROCESS_ALL_ACCESS, 0, m_ProcessID);
}

bool AppProcess::isValid()
{
	if (m_Process && m_Process != INVALID_HANDLE_VALUE) return true;
	return false;
}

bool AppProcess::isRunning()
{
	DWORD exitCodeOut;

	// Comprobar si nuestro proceso sigue ejecutando
	if (GetExitCodeProcess(m_Process, &exitCodeOut) != 0)
	{
		return exitCodeOut == STILL_ACTIVE;
	}
}

bool AppProcess::hasModule(const char* module_name)
{
	HMODULE hMods[1024];
	DWORD cbNeeded;
	unsigned int i;

	// Conseguir una lista de todos los modulos (aka Dlls) de nuestro proceso
	if (EnumProcessModules(m_Process, hMods, sizeof(hMods), &cbNeeded))
	{
		for (i = 0; i < (cbNeeded / sizeof(HMODULE)); i++)
		{
			wchar_t szModName[MAX_PATH];

			// Conseguir la ruta completa del modulo
			if (GetModuleFileNameEx(m_Process, hMods[i], szModName, sizeof(szModName) / sizeof(TCHAR)))
			{
				// Comprobar si el nombre del modulo coincide con el modulo que estamos buscando
				std::filesystem::path modulePath = szModName;
				if (_stricmp(modulePath.filename().string().c_str(), module_name) == 0)
				{
					return true;
				}
			}
		}
	}

	return false;
}

bool AppProcess::InjectDLL(const char* dllName)
{

	// Algunas weas que copypastee de internet :v
	char dllPath[MAX_PATH] = { 0 };
	GetFullPathNameA(dllName, MAX_PATH, dllPath, NULL);

	if (isValid())
	{
		LPVOID loc = VirtualAllocEx(m_Process, 0, strlen(dllPath) + 1, MEM_COMMIT | MEM_RESERVE, PAGE_READWRITE);
		WriteProcessMemory(m_Process, loc, dllPath, strlen(dllPath) + 1, 0);
		HANDLE hTread = CreateRemoteThread(m_Process, 0, 0, (LPTHREAD_START_ROUTINE)LoadLibraryA, loc, 0, 0);

		if (hTread)
		{
			CloseHandle(hTread);
		}
		return true;
	}

	return false;
}