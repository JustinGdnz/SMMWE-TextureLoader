#include "pch.h"
#include "Memory.h"

// Cosas mayormente tecnicas, sacadas de GH :pray:

bool mem::Detour32(BYTE* src, BYTE* dst, const uintptr_t len)
{
	if (len < 5) return false;

	DWORD curProtection;
	VirtualProtect(src, len, PAGE_EXECUTE_READWRITE, &curProtection);

	uintptr_t relativeAddress = dst - src - 5;

	*src = 0xE9;
	*(uintptr_t*)(src + 1) = relativeAddress;

	VirtualProtect(src, len, curProtection, &curProtection);
	return true;
}

BYTE* mem::TrampHook32(BYTE* src, BYTE* dst, const uintptr_t len)
{
	if (len < 5) return 0;

	// Create Gateway
	BYTE* gateway = (BYTE*)VirtualAlloc(0, len, MEM_COMMIT | MEM_RESERVE, PAGE_EXECUTE_READWRITE);

	// Write stolen bytes to the gateway
	memcpy_s(gateway, len, src, len);

	// Get gateway to destination address
	uintptr_t gatewayRelativeAddr = src - gateway - 5;

	// Add jump to the opcode at the end of the gateway
	*(gateway + len) = 0xE9;

	// Write address of the gateway to the jump
	*(uintptr_t*)((uintptr_t)gateway + len + 1) = gatewayRelativeAddr;

	// Peform the detour
	Detour32(src, dst, len);

	return gateway;
}

char* mem::GetEnv(const char* pPath)
{
	char* env;
	size_t len;
	errno_t err = _dupenv_s(&env, &len, pPath);

	return env;
}

wchar_t* mem::GetEnvW(const wchar_t* pPath)
{
	wchar_t* env;
	size_t len;
	errno_t err = _wdupenv_s(&env, &len, pPath);

	return env;
}

std::string mem::to_utf8(const std::wstring& s)
{
	std::string utf8;
	int len = WideCharToMultiByte(CP_UTF8, 0, s.c_str(), s.length(), NULL, 0, NULL, NULL);
	if (len > 0)
	{
		utf8.resize(len);
		WideCharToMultiByte(CP_UTF8, 0, s.c_str(), s.length(), &utf8[0], len, NULL, NULL);
	}
	return utf8;
}

std::wstring mem::to_wide(const std::string& str)
{
	int count = MultiByteToWideChar(CP_UTF8, 0, str.c_str(), str.length(), NULL, 0);
	std::wstring wstr(count, 0);
	MultiByteToWideChar(CP_UTF8, 0, str.c_str(), str.length(), &wstr[0], count);
	return wstr;
}

bool mem::DejectTrampHook32(BYTE* gateway, const uintptr_t len)
{
	MEMORY_BASIC_INFORMATION mbi{ nullptr };
	if (!VirtualQuery(reinterpret_cast<LPCVOID>(gateway), &mbi, sizeof(mbi))) return false;
	if (mbi.State == MEM_FREE || mbi.Protect == PAGE_NOACCESS) return false;

	uintptr_t address = *(uintptr_t*)((uintptr_t)gateway + len + 1) + (uintptr_t)(gateway + len);

	DWORD oProtect{ 0 };
	if (VirtualProtect(reinterpret_cast<LPVOID>(address), len, PAGE_EXECUTE_READWRITE, &oProtect))
	{
		memset(reinterpret_cast<void*>(address), 0x90, len);
		memcpy_s(reinterpret_cast<void*>(address), len, reinterpret_cast<void*>(gateway), len);

		VirtualFree(gateway, 0, MEM_RELEASE);
		return true;
	}
	return false;
}