#pragma once
#include "YYRValue/YYRValue.h"

// Internal GML stuff
typedef void(__cdecl* gml_ObjectScript) (void* _pSelf, void* _pOther); //void gml_ObjectScript(CInstance* _pSelf, CInstance* _pOther);
typedef void(__cdecl* _YYGML_CallLegacyFunction) (void* _pSelf, void* _pOther, YYRValue* _result, int _argc, int _id, YYRValue** _args);
typedef void(__cdecl* _Variable_GetValue_Direct) (void* _pSelf, unsigned int _id, int _arrayindex, YYRValue* _result);
typedef void(__cdecl* _AllocString) (YYRValue* new_string, const char* string);
typedef void(__cdecl* _DeAllocString) (YYRValue* string);