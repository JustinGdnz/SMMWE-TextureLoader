#pragma once
#include "GameMaker/GameMaker.h"
#include <iostream>
#include <atomic>

// Singleton para modificar la mayoria de cosas necesarias de SMM:WE
class SMMWE
{
private:
	static inline gml_ObjectScript oriPersistentStep;
	static inline _YYGML_CallLegacyFunction YYGML_CallLegacyFunction;
	static inline _Variable_GetValue_Direct Variable_GetValue_Direct;
	static inline _AllocString AllocString;
	static inline _DeAllocString DeAllocString;
public:
	static inline std::atomic<bool> running = {true};
public:
	SMMWE(const SMMWE&) = delete;
	static void __cdecl hkdPersistentStep(void* _pSelf, void* _pOther);
	static SMMWE& GetInstance();
	static void RegisterMethods(uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t arg4, uintptr_t arg5);

	static void Hook();
	static void RejectHook();
private:
	YYRValue SpriteReplace(void* _pSelf, void* _pOther, YYRValue ind, const char* fname, YYRValue imgnumb, YYRValue removeback, YYRValue smooth, YYRValue xorig, YYRValue yorig);
	YYRValue BackgroundReplace(void* _pSelf, void* _pOther, YYRValue ind, const char* fname, YYRValue removeback, YYRValue smooth);
	YYRValue GetAssetIndex(void* _pSelf, void* _pOther, const char* name);
	YYRValue GetSpriteXOrig(void* _pSelf, void* _pOther, YYRValue ind);
	YYRValue GetSpriteYOrig(void* _pSelf, void* _pOther, YYRValue ind);
	YYRValue AsyncBegin(void* _pSelf, void* _pOther, const char* groupname);
	YYRValue AsyncOption(void* _pSelf, void* _pOther, const char* optionname, const char* optionvalue);
	YYRValue AsyncEnd(void* _pSelf, void* _pOther);
	YYRValue VariableGlobalExists(void* _pSelf, void* _pOther, const char* name);
	YYRValue VariableGlobalGet(void* _pSelf, void* _pOther, const char* name);
	YYRValue VariableGlobalSet(void* _pSelf, void* _pOther, const char* name, YYRValue value);
private:
	SMMWE() = default;
};