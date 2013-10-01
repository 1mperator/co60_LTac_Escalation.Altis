#include <windows.h>

#include <stdio.h>

extern "C" {
    __declspec(dllexport) void __stdcall RVExtension(char *output, int outputSize, const char *function); 
};

void __stdcall RVExtension(char *output, int outputSize, const char *function) {
    FreeConsole();
    AllocConsole();

    HANDLE conin = CreateFile("CONIN$", GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, 0, 0);
    //if (conin == INVALID_HANDLE_VALUE)
    //    complain!
    HANDLE conout = CreateFile("CONOUT$", GENERIC_WRITE, FILE_SHARE_WRITE, NULL, OPEN_EXISTING, 0, 0);

    // These do not seem to work ...
    SetStdHandle(STD_INPUT_HANDLE, conin);
    SetStdHandle(STD_OUTPUT_HANDLE, conout);

    WriteFile(conout, "hello world", 11, NULL, NULL);

    //sprintf(output, "err: %i", GetLastError());
    outputSize -= 1;
    strncpy(output,function,outputSize);
    printf("RVExtension: %s, %i", function, outputSize);
}
