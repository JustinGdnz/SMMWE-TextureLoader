#include "pch.h"
#include "DsMap.h"

DsMap::DsMap()
{
	m_MapID = ICreateDsMap(0);
}

void DsMap::RegCallbacks(char* async, char* ds_map, char* add_double, char* add_string)
{
	ICreateAsyncEvent = (create_async_event)async;
	ICreateDsMap = (create_ds_map)ds_map;
	IAddDouble = (ds_map_add_double)add_double;
	IAddString = (ds_map_add_string)add_string;
}

DsMap& DsMap::AddDouble(const char* key, double value)
{
	IAddDouble(m_MapID, key, value);
	return *this;
}

DsMap& DsMap::AddString(const char* key, const char* value)
{
	IAddString(m_MapID, key, value);
	return *this;
}

void DsMap::Send() const
{
	ICreateAsyncEvent(m_MapID, 70);
}
