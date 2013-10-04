#include <windows.h>

extern "C" {
    __declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function); 
};

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
}
