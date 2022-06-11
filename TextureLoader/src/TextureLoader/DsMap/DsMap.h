#pragma once

// Class wrapper para los DsMaps
class DsMap
{
private:
	typedef void(*create_async_event)(int, int);
	typedef int(*create_ds_map)(int num, ...);
	typedef bool(*ds_map_add_double)(int _index, const char* _pKey, double value);
	typedef bool(*ds_map_add_string)(int _index, const char* _pKey, const char* value);

	static inline create_async_event ICreateAsyncEvent;
	static inline create_ds_map ICreateDsMap;
	static inline ds_map_add_double IAddDouble;
	static inline ds_map_add_string IAddString;
public:
	static void RegCallbacks(char* async, char* ds_map, char* add_double, char* add_string);
private:
	int m_MapID;
public:
	DsMap();
	DsMap& AddDouble(const char* key, double value);
	DsMap& AddString(const char* key, const char* value);
	void Send() const;
};