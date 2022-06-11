#include "pch.h"
#include "libSMMWE.h"
#include "Memory/Memory.h"

// Namespaces
namespace filesystem = std::filesystem;

// Statics
static filesystem::path LocalAppData = mem::GetEnv("LOCALAPPDATA");			// %localappdata%	
static filesystem::path TLPath = LocalAppData / "SMMWE_Texture_Loader";		// directorio local de TL

// Script prinicipal
void __cdecl SMMWE::hkdPersistentStep(void* _pSelf, void* _pOther)
{
	if (running)
	{
		filesystem::path texdir;

		if (filesystem::exists(TLPath / "Cache/temp"))
		{
			std::ifstream temporal_file;
			temporal_file.open(TLPath / "Cache/temp");
			if (temporal_file.is_open())
			{
				//temporal_file >> texdir;
				std::string line;
				std::getline(temporal_file, line);
				texdir = line;
			}
		}

		// Return (exit) en caso de algun error
		if (texdir.empty() || !filesystem::exists(texdir))
		{
			running = false;
			oriPersistentStep(_pSelf, _pOther);
			return;
		}

		// Crear una regla dentro del juego en caso de que no exista
		if (!GetInstance().VariableGlobalExists(_pSelf, _pOther, "tlrule_no_sandbox"))
		{
			// Crear regla "tlrule_no_sandbox"
			GetInstance().VariableGlobalSet(_pSelf, _pOther, "tlrule_no_sandbox", 1.0);

			// Romper el sandbox
			GetInstance().AsyncBegin(_pSelf, _pOther, "dummy");
			GetInstance().AsyncOption(_pSelf, _pOther, "temprloc", TLPath.string().c_str());
		}

		if (filesystem::exists(texdir / "Sprites"))
		{
			// Loop entre todos los elementos de la carpeta y subcarpetas
			for (auto const& dir_entry : filesystem::recursive_directory_iterator{ texdir / "Sprites" })
			{
				// Obtener la informacion del elemento
				filesystem::path entry_path = dir_entry.path();
				filesystem::path entry_file = dir_entry.path().filename();
				filesystem::path entry_extn = dir_entry.path().extension();

				// Saltar al siguiente archivo en caso de que no sea un png valido
				if (!dir_entry.is_regular_file()) continue;
				if (!(entry_extn.compare(".png") == 0)) continue;

				// Strings del nombre del archivo
				std::string fname = entry_file.string();
				std::string Strip = fname;

				// Obtener el nombre absoluto del sprite
				auto str_pos = fname.find_last_of("_");
				if (str_pos == std::string::npos) continue;
				fname.erase(str_pos);

				// Obtener la cantidad de frames del nombre del archivo
				str_pos = Strip.find_last_of("_");
				if (str_pos == std::string::npos) continue;
				Strip.erase(0, str_pos + 6);

				// Eliminar el residuo
				str_pos = Strip.find_last_of(".");
				if (str_pos == std::string::npos) continue;
				Strip.erase(str_pos);

				// Obtener el index del sprite y la cantidad te frames en valor numerico
				double sprite_index = GetInstance().GetAssetIndex(_pSelf, _pOther, fname.c_str());
				double imgnumb = std::stoi(Strip);

				// Si el index del sprite no es invalido se reemplazara el sprite
				if (sprite_index != -1)
				{
					GetInstance().SpriteReplace(_pSelf, _pOther, sprite_index, entry_path.string().c_str(), imgnumb, 0, 0, GetInstance().GetSpriteXOrig(_pSelf, _pOther, sprite_index), GetInstance().GetSpriteYOrig(_pSelf, _pOther, sprite_index));
				}
			}
		}

		// Comprobar si existe la carpeta de Backgrounds
		if (filesystem::exists(texdir / "Backgrounds"))
		{
			// Loop entre todos los elementos de la carpeta y subcarpetas
			for (auto const& dir_entry : filesystem::recursive_directory_iterator{ texdir / "Backgrounds" })
			{
				// Obtener la informacion del elemento
				filesystem::path entry_path = dir_entry.path();
				filesystem::path entry_stem = dir_entry.path().stem();
				filesystem::path entry_extn = dir_entry.path().extension();

				// Saltar al siguiente archivo en caso de que no sea un png valido
				if (!dir_entry.is_regular_file()) continue;
				if (!(entry_extn.compare(".png") == 0)) continue;

				// Nombre del archivo
				std::string fname = entry_stem.string();

				// Obtener el index del background
				double background_index = GetInstance().GetAssetIndex(_pSelf, _pOther, fname.c_str());

				// Si el index del background no es invalido se reemplazara el background
				if (background_index != -1)
				{
					GetInstance().BackgroundReplace(_pSelf, _pOther, background_index, entry_path.string().c_str(), 0, 0);
				}
			}
		}
		running = false;
	}

	oriPersistentStep(_pSelf, _pOther);
}
	/*
	// Evitar que se ejecute 2 o mas veces
	Sleep(20);
	if (running)
	{
		filesystem::path texture_path;

		// Check cache folder
		if (filesystem::exists(TLPath / "Cache"))
		{
			// Get temp file path
			filesystem::path temp_path = TLPath / "Cache" / "temp";
			std::ifstream temp_file;
			temp_file.open(temp_path);

			if (temp_file.is_open());
			{
				temp_file >> texture_path;
			}
		}

		if (!GetSingleton().VariableGlobalExists(_pSelf, _pOther, "tlrule_sandboxbroke"))
		{
			GetSingleton().VariableGlobalSet(_pSelf, _pOther, "tlrule_sandboxbroke", 1.0);

			// Break sandbox
			GetSingleton().AsyncBegin(_pSelf, _pOther, "dummy");
			GetSingleton().AsyncOption(_pSelf, _pOther, "temprloc", TLPath.string().c_str());
		}

		// Comprobar si existe la carpeta de Sprites
		if (filesystem::exists(texture_path / "Sprites"))
		{
			// Loop entre todos los elementos de la carpeta y subcarpetas
			for (auto const& dir_entry : filesystem::recursive_directory_iterator{ texture_path / "Sprites" })
			{
				// Obtener la informacion del elemento
				filesystem::path entry_path = dir_entry.path();
				filesystem::path entry_file = dir_entry.path().filename();
				filesystem::path entry_extn = dir_entry.path().extension();

				// "Safe Guard", en caso de que algo salga mal
				if (!dir_entry.is_regular_file()) continue;
				if (!(entry_extn.compare(".png") == 0)) continue;

				// Strings del nombre del archivo
				std::string fname = entry_file.string();
				std::string Strip = fname;

				// Obtener el nombre absoluto del sprite
				auto str_pos = fname.find_last_of("_");
				if (str_pos == std::string::npos) continue;
				fname.erase(str_pos);

				// Obtener la cantidad de frames del nombre del archivo
				str_pos = Strip.find_last_of("_");
				if (str_pos == std::string::npos) continue;
				Strip.erase(0, str_pos + 6);

				// Eliminar el residuo
				str_pos = Strip.find_last_of(".");
				if (str_pos == std::string::npos) continue;
				Strip.erase(str_pos);

				// Obtener el index del sprite y la cantidad te frames en valor numerico
				double sprite_index = GetSingleton().GetAssetIndex(_pSelf, _pOther, fname.c_str());
				double imgnumb = std::stoi(Strip);

				// Si el index del sprite no es invalido se reemplazara el sprite
				if (sprite_index != -1)
				{
					GetSingleton().SpriteReplace(_pSelf, _pOther, sprite_index, entry_path.string().c_str(), imgnumb, 0, 0, GetSingleton().GetSpriteXOrig(_pSelf, _pOther, sprite_index), GetSingleton().GetSpriteYOrig(_pSelf, _pOther, sprite_index));
				}
			}
		}

		// Comprobar si existe la carpeta de Backgrounds
		if (filesystem::exists(texture_path / "Backgrounds"))
		{
			// Loop entre todos los elementos de la carpeta y subcarpetas
			for (auto const& dir_entry : filesystem::recursive_directory_iterator{ texture_path / "Backgrounds" })
			{
				// Obtener la informacion del elemento
				filesystem::path entry_path = dir_entry.path();
				filesystem::path entry_stem = dir_entry.path().stem();
				filesystem::path entry_extn = dir_entry.path().extension();

				// "Safe Guard", en caso de que algo salga mal
				if (!dir_entry.is_regular_file()) continue;
				if (!(entry_extn.compare(".png") == 0)) continue;

				// Nombre del archivo
				std::string fname = entry_stem.string();

				// Obtener el index del background
				double background_index = GetSingleton().GetAssetIndex(_pSelf, _pOther, fname.c_str());

				// Si el index del background no es invalido se reemplazara el background
				if (background_index != -1)
				{
					GetSingleton().BackgroundReplace(_pSelf, _pOther, background_index, entry_path.string().c_str(), 0, 0);
				}
			}
		}
		running = false;
	}

	// Ejecutar el codigo original
	oriPersistentStep(_pSelf, _pOther);
}
*/

SMMWE& SMMWE::GetInstance()
{
	static SMMWE instance;
	return instance;
}

void SMMWE::RegisterMethods(uintptr_t arg1, uintptr_t arg2, uintptr_t arg3, uintptr_t arg4, uintptr_t arg5)
{
	oriPersistentStep = (gml_ObjectScript)arg1;
	YYGML_CallLegacyFunction = (_YYGML_CallLegacyFunction)arg2;
	Variable_GetValue_Direct = (_Variable_GetValue_Direct)arg3;
	AllocString = (_AllocString)arg4;
	DeAllocString = (_DeAllocString)arg5;
}

void SMMWE::Hook()
{
	oriPersistentStep = (gml_ObjectScript)mem::TrampHook32((BYTE*)oriPersistentStep, (BYTE*)hkdPersistentStep, 5);
}

void SMMWE::RejectHook()
{
	mem::DejectTrampHook32((BYTE*)oriPersistentStep, 5);
}

YYRValue SMMWE::SpriteReplace(void* _pSelf, void* _pOther, YYRValue ind, const char* fname, YYRValue imgnumb, YYRValue removeback, YYRValue smooth, YYRValue xorig, YYRValue yorig)
{
	YYRValue result;
	YYRValue string;
	YYRValue* args[] = { &ind, &string, &imgnumb, &removeback, &smooth, &xorig, &yorig };

	AllocString(&string, fname);
	YYGML_CallLegacyFunction(_pSelf, _pOther, &result, 7, 813, args);
	DeAllocString(&string);
	return result;
}

YYRValue SMMWE::BackgroundReplace(void* _pSelf, void* _pOther, YYRValue ind, const char* fname, YYRValue removeback, YYRValue smooth)
{
	YYRValue result;
	YYRValue string;
	YYRValue* args[] = { &ind, &string, &removeback, &smooth };

	AllocString(&string, fname);
	YYGML_CallLegacyFunction(_pSelf, _pOther, &result, 4, 837, args);
	DeAllocString(&string);
	return result;
}

YYRValue SMMWE::GetAssetIndex(void* _pSelf, void* _pOther, const char* name)
{
	YYRValue result;
	YYRValue ret;
	YYRValue string;
	YYRValue* args[] = { &string };

	AllocString(&string, name);
	YYGML_CallLegacyFunction(_pSelf, _pOther, &result, 1, 976, args);
	DeAllocString(&string);

	return result;
}

YYRValue SMMWE::GetSpriteXOrig(void* _pSelf, void* _pOther, YYRValue ind)
{
	if (ind == -1) return -1.0;

	YYRValue result;
	YYRValue* args[] = { &ind };

	YYGML_CallLegacyFunction(_pSelf, _pOther, &result, 1, 790, args);
	return result;
}

YYRValue SMMWE::GetSpriteYOrig(void* _pSelf, void* _pOther, YYRValue ind)
{
	if (ind == -1) return -1.0;

	YYRValue result;
	YYRValue* args[] = { &ind };

	YYGML_CallLegacyFunction(_pSelf, _pOther, &result, 1, 791, args);
	return result;
}

YYRValue SMMWE::AsyncBegin(void* _pSelf, void* _pOther, const char* groupname)
{
	YYRValue result;
	YYRValue string;
	YYRValue* args[] = { &string };

	AllocString(&string, groupname);
	YYGML_CallLegacyFunction(_pSelf, _pOther, &result, 1, 1744, args);
	DeAllocString(&string);

	return result;
}

YYRValue SMMWE::AsyncOption(void* _pSelf, void* _pOther, const char* optionname, const char* optionvalue)
{
	YYRValue result;
	YYRValue name;
	YYRValue value;
	YYRValue* args[] = { &name, &value };

	AllocString(&name, optionname);
	AllocString(&value, optionvalue);
	YYGML_CallLegacyFunction(_pSelf, _pOther, &result, 2, 1746, args);
	DeAllocString(&name);
	DeAllocString(&value);

	return result;
}

YYRValue SMMWE::AsyncEnd(void* _pSelf, void* _pOther)
{
	YYRValue result;

	YYGML_CallLegacyFunction(_pSelf, _pOther, &result, 0, 1745, NULL);

	return result;
}

YYRValue SMMWE::VariableGlobalExists(void* _pSelf, void* _pOther, const char* name)
{
	YYRValue result;
	YYRValue string;
	YYRValue* args[] = { &string };

	AllocString(&string, name);
	YYGML_CallLegacyFunction(_pSelf, _pOther, &result, 1, 1285, args);
	DeAllocString(&string);

	return result;
}

YYRValue SMMWE::VariableGlobalGet(void* _pSelf, void* _pOther, const char* name)
{
	YYRValue result;
	YYRValue string;
	YYRValue* args[] = { &string };

	AllocString(&string, name);
	YYGML_CallLegacyFunction(_pSelf, _pOther, &result, 1, 1286, args);
	DeAllocString(&string);

	return result;
}

YYRValue SMMWE::VariableGlobalSet(void* _pSelf, void* _pOther, const char* name, YYRValue value)
{
	YYRValue result;
	YYRValue string;
	YYRValue* args[] = { &string, &value };

	AllocString(&string, name);
	YYGML_CallLegacyFunction(_pSelf, _pOther, &result, 2, 1287, args);
	DeAllocString(&string);

	return result;
}
