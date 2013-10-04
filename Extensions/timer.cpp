
#include <windows.h>

#include <time.h>
#include <stdio.h>

extern "C" {
    __declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function); 
};

clock_t t = 0;

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    if (0 == t) {
        t = clock();
    } else {
        t = clock() - t;
        sprintf(output, "%f", ((float)t)/CLOCKS_PER_SEC);
        t = 0;
    }
}
