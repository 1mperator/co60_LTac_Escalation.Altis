#include <windows.h>
#include <stdio.h>

#include "sqlite3.h"

extern "C" {
    __declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function); 
};

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    sqlite3* db;
    if(sqlite3_open("test.db", &db)) {
        sprintf(output, "You dun goofed: %s\n", sqlite3_errmsg(db));
        return;
    }
    sqlite3_close(db);
}
