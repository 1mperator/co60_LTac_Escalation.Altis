
#include <windows.h>

#include <stdio.h>

extern "C" {
    __declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function); 
};

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    sprintf(output, "=D %s", function);
}
