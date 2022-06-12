#include "pch.h"

#include "DsMap/DsMap.h"
#include "AppProcess/AppProcess.h"

// Macros
#define GM_EXPORT extern "C" __declspec(dllexport)		// Export to dll
#define GM_TRUE (1.0)									// GML true equivalent
#define GM_FALSE (0.0)									// GML false equivalent

// Namespaces
using namespace libzippp;
namespace filesystem = std::filesystem;

// Statics
static bool tl_initialized = false;						// Checks whenever GMS load the library
static AppProcess GameProcess(L"SMM_WE.exe");			// SMM_WE proccess
static ZipArchive* ZipFile = nullptr;					// I/O with zip files

// Conseguir las variables de entorno (ej. "%appdata%")
char* GetEnv(const char* pPath)
{
	char* env;
	size_t len;
	errno_t err = _dupenv_s(&env, &len, pPath);

	return env;
}

std::string to_utf8(const std::wstring& s)
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

std::wstring to_wide(const std::string& str)
{
	int count = MultiByteToWideChar(CP_UTF8, 0, str.c_str(), str.length(), NULL, 0);
	std::wstring wstr(count, 0);
	MultiByteToWideChar(CP_UTF8, 0, str.c_str(), str.length(), &wstr[0], count);
	return wstr;
}

// Inicializar el DLL por parte de GMS2
GM_EXPORT double dllinit()
{
	if (!tl_initialized)
		tl_initialized = true;
	return GM_TRUE;
}

// Exit, basicamente
GM_EXPORT double dllexit()
{
	if (tl_initialized)
		tl_initialized = false;
	return GM_FALSE;
}

// Registrar las funciones necesarias para los DsMaps
GM_EXPORT double RegisterCallbacks(char* arg1, char* arg2, char* arg3, char* arg4)
{
	DsMap::RegCallbacks(arg1, arg2, arg3, arg4);
	return GM_TRUE;
}

// Inicializar TL y cargar los procesos de SMM:WE
GM_EXPORT double tl_init()
{
	if (!tl_initialized) return GM_FALSE;

	GameProcess.AttachProcess();
	if (GameProcess.isValid())return GM_TRUE;

	return GM_FALSE;
}

/* UNUSED
GM_EXPORT double tl_update()
{
	if (!tl_initialized) return GM_FALSE;
	return GM_TRUE;
}
*/

// Inyectar librerias en el proceso
GM_EXPORT double tl_injectdll(char* dllname)
{
	if (!tl_initialized) return GM_FALSE;

	if (GameProcess.isValid())
	{
		if (GameProcess.isRunning())
		{
			if (!GameProcess.hasModule(dllname))
			{
				GameProcess.InjectDLL(dllname);
				return GM_TRUE;
			}
		}
	}

	return GM_FALSE;
}

// Comprobar si el proceso se esta ejecutado
GM_EXPORT double tl_is_process_running()
{
	if (!tl_initialized) return GM_FALSE;
	if (!GameProcess.isValid()) return GM_FALSE;

	return GameProcess.isRunning();

}

// Comprobar si el proceso esta usando alguna libreria
GM_EXPORT double tl_has_module(char* dllname)
{
	if (!tl_initialized) return GM_FALSE;

	if (GameProcess.isValid())
	{
		if (GameProcess.isRunning())
		{
			return GameProcess.hasModule(dllname);
		}
	}

	return GM_FALSE;
}

// Devuelve la ruta de la variable de entorno
GM_EXPORT char* tl_get_environment_path(char* env)
{
	if (!tl_initialized) return (char*)"";
	return GetEnv(env);
}

// Abrir una carpeta en el explorador de archivos
GM_EXPORT double tl_open_folder(char* path)
{
	if (!tl_initialized) return GM_FALSE;
	filesystem::path oPath = path;
	std::wstring folder = to_wide(oPath.string());		// Support for unicode characters

	ShellExecuteW(NULL, L"open", folder.c_str(), NULL, NULL, SW_SHOWDEFAULT);

	return GM_TRUE;
}

// Abrir una url en el explorador web
GM_EXPORT double tl_open_url(char* url)
{
	if (!tl_initialized) return GM_FALSE;
	filesystem::path Path = url;
	std::wstring new_url = to_wide(Path.string());		// Support for unicode characters

	ShellExecuteW(0, 0, new_url.c_str(), 0, 0, SW_SHOW);

	return GM_TRUE;
}

/* UNUSED
// Crear los directorios necesarios para TL
GM_EXPORT double tl_create_directories()
{
	if (!tl_initialized) return GM_FALSE;
	filesystem::path LocalAppData = GetEnv("LOCALAPPDATA");
	filesystem::path TexturesPath = LocalAppData / "SMM_WE\\Textures\\Default";
	filesystem::path SpritesPath = LocalAppData / "SMM_WE\\Textures\\Default\\Sprites";
	filesystem::path BGPath = LocalAppData / "SMM_WE\\Textures\\Default\\Backgrounds";

	filesystem::create_directories(TexturesPath);
	filesystem::create_directory(SpritesPath);
	filesystem::create_directory(BGPath);

	return GM_TRUE;
}
*/

// Open zip file as read only
GM_EXPORT double tl_zip_open_read(char* zip_file)
{
	if (!tl_initialized) return GM_FALSE;
	if (ZipFile != nullptr) return GM_FALSE;

	ZipFile = new ZipArchive(zip_file);
	ZipFile->open(ZipArchive::ReadOnly);

	return GM_TRUE;
}

// Unzip file from an opened zip
GM_EXPORT double tl_zip_unzip_file(char* fname, char* output)
{
	if (!tl_initialized) return GM_FALSE;
	if (ZipFile == nullptr) return GM_FALSE;

	ZipEntry file = ZipFile->getEntry(fname);
	if (file.isNull()) return GM_FALSE;

	std::wstring outPath = to_wide(output);			// Support for unicode characters

	std::ofstream out(outPath, std::ios::binary);
	out.write((char*)file.readAsBinary(), file.getSize());
	out.close();

	return GM_TRUE;
}

// Checks if a file exist in the opened zip
GM_EXPORT double tl_zip_has_file(char* fname)
{
	if (!tl_initialized) return GM_FALSE;
	if (ZipFile == nullptr) return GM_FALSE;

	return ZipFile->hasEntry(fname) ? GM_TRUE : GM_FALSE;
}

// Close opened zip
GM_EXPORT double tl_zip_close_read()
{
	if (!tl_initialized) return GM_FALSE;
	if (ZipFile == nullptr) return GM_FALSE;

	ZipFile->close();
	delete[] ZipFile;
	ZipFile = nullptr;

	return GM_TRUE;
}

/*UNUSED
GM_EXPORT double tl_zip_unzip_singlefile(char* zip_file, char* fname, char* output)
{
	if (!tl_initialized) return GM_FALSE;

	ZipArchive zip(zip_file);
	zip.open(ZipArchive::ReadOnly);

	ZipEntry single = zip.getEntry(fname);

	if (single.isNull()) return GM_FALSE;

	std::ofstream out(output, std::ios::binary);

	out.write((char*)single.readAsBinary(), single.getSize());

	out.close();
	zip.close();

	return GM_TRUE;
}
*/