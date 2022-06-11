#pragma once
#include <Windows.h>

// Class wrapper para manipular los procesos de windows
class AppProcess
{
private:
	const wchar_t* m_ProcessName;												// Nombre de nuestro programa
	int m_ProcessID;															// ID del proceso de nuestro programa
	HANDLE m_Process;															// Proceso de nuestro programa
private:
	int IGetProcessID();
public:
	AppProcess(const wchar_t* name);
	AppProcess(const wchar_t* name, int id);
	~AppProcess();

	void AttachProcess();
	bool isValid();
	bool isRunning();
	bool hasModule(const char* module_name);
	bool InjectDLL(const char* dllName);
	//bool InjectHijackThreadDLL(const char dllName);
};