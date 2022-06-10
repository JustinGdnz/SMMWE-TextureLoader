// dllmain.cpp : Defines the entry point for the DLL application.
#define WIN32_LEAN_AND_MEAN             // Exclude rarely-used stuff from Windows headers
#include "pch.h"
#include "libSMMWE/Memory/Memory.h"
#include "libSMMWE/libSMMWE.h"

DWORD WINAPI ModThread(HMODULE hModule)
{
    // Registar algunas funciones provenientes del juego base
    SMMWE::RegisterMethods(mem::gameBase + 0xABDA40, mem::gameBase + 0xEEE090, mem::gameBase + 0xF06CE0, mem::gameBase + 0xEF1530, mem::gameBase + 0x1460);

    // "Robar" memoria de SMM:WE para "inyectar" nuevo codigo
    SMMWE::Hook();

    // Mantener activo el proceso hasta que se cargue la textura por completo
    while (SMMWE::running) {}
    SMMWE::RejectHook();

    // Exit
    FreeLibraryAndExitThread(hModule, 0);
}

BOOL APIENTRY DllMain( HMODULE hModule, DWORD  ul_reason_for_call, LPVOID lpReserved)
{
    switch (ul_reason_for_call)
    {
    case DLL_PROCESS_ATTACH:
        CloseHandle(CreateThread(nullptr, 0, (LPTHREAD_START_ROUTINE)ModThread, hModule, 0, nullptr));
    case DLL_THREAD_ATTACH:
    case DLL_THREAD_DETACH:
    case DLL_PROCESS_DETACH:
        break;
    }
    return TRUE;
}

