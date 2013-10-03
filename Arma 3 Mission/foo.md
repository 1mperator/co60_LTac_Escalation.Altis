C extension for arma
===

Defines `RVExtension()`

Build Instructions
---

1. Install msvc (what version? do we need 2008? can we use 2012?)
    - http://download.microsoft.com/download/A/5/4/A54BADB6-9C3F-478D-8657-93B3FC9FE62D/vcsetup.exe
- Start a command prompt
- Go to the directory with foo.cpp in it
- Run "C:\Program Files (x86)\Microsoft Visual Studio 9.0\Common7\Tools\vsvars32.bat"
- Run cl foo.cpp /link /DLL /OUT:foo.dll
- Move foo.dll to arma's runtime path thingy; the Arma directory where arma3.exe lives. Arma won't look for dlls in mission directories because it doesn't love us enough
    - We need an actual build script that can deploy the dll to somewhere, or, when we start arma, we might be able to put the directory the dll is in into PATH, I think that's how the windows dll lookup stuff is supposed to work
- Uninstall msvc because it's gross

TODO
---

After loading the dll, arma doesn't appear to let it go ever at all. So one way to solve this is by having two dlls, arma loads a bootstrappy dll that loads an actual dll, the bootstrappy dll can reload the actual dll when we want it to. Forwarding calls should be trivial?

Create a console and dump stdout to it?
