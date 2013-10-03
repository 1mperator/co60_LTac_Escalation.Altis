#include <windows.h>

#include <stdio.h>

extern "C" {
    __declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function);
};

typedef void (*ExtensionFn)(char*, int, const char*);

static HINSTANCE extension = 0;
static ExtensionFn extensionfn = 0;

bool UnloadExtension() {
    if (FreeLibrary(extension)) {
        extension = 0;
        extensionfn = 0;
        return true;
    }
    return false;
}

bool LoadExtension(const char* name) {
    if (extension) {
        if (!UnloadExtension()) {
            return false;
        }
    }
    if (extension = LoadLibrary(name)) {
        extensionfn = (ExtensionFn) GetProcAddress(extension, "_RVExtension@12");
        return extensionfn != 0;
    }
    return false;
}

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    if (0 == strcmp(function, "reloader:unload")) {
        bool ok = UnloadExtension();
        sprintf(output, "%i", ok);
        return;
    } else if (0 == strncmp(function, "reloader:load ", 14)) {
        const char* name = function+14;
        if (!LoadExtension(name)) {
            DWORD err = GetLastError();
            char* buffer = 0;
            FormatMessage(
                    FORMAT_MESSAGE_FROM_SYSTEM|FORMAT_MESSAGE_ALLOCATE_BUFFER,
                    0,
                    err,
                    0,
                    (LPTSTR)&buffer,
                    0,
                    0);
            if (0 == buffer)
                sprintf(output, "Error Code %i", err);
            else
                sprintf(output, "Error Code %i: %s", err, buffer);
            return;
        }
        return;
    } else if (!extensionfn) {
        sprintf(output, "No extension loaded yet!");
        return;
    }

    extensionfn(output, outputSize, function);
}
