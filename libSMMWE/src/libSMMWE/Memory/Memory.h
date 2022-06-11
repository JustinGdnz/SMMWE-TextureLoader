#pragma once
#include <Windows.h>

namespace mem
{
	// Module
	inline const uintptr_t gameBase = (uintptr_t)GetModuleHandle(NULL);

	// Environment
	char* GetEnv(const char* pPath);

	// Hook
	bool Detour32(BYTE* src, BYTE* dst, const uintptr_t len);
	BYTE* TrampHook32(BYTE* src, BYTE* dst, const uintptr_t len);
	bool DejectTrampHook32(BYTE* gateway, const uintptr_t len);

}