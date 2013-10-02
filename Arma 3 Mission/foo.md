C extension for arma
===

Defines `RVExtension()` to act as a sort of dll loader thing for swapping dlls while arma is running.

Build Instructions
---

1. Install msvc (what version? do we need 2008? can we use 2012?)
    - http://download.microsoft.com/download/A/5/4/A54BADB6-9C3F-478D-8657-93B3FC9FE62D/vcsetup.exe
- Start a command prompt
- Go to the directory with foo.cpp in it
- Run "C:\Program Files (x86)\Microsoft Visual Studio 9.0\Common7\Tools\vsvars32.bat"
- Run `cl foo.cpp /link /DLL /OUT:foo.dll`
    - Or `cl foo.cpp /Zi /link /DLL /OUT:foo.dll` for debug symbols
- Move foo.dll to arma's runtime path thingy; the Arma directory where arma3.exe lives. Arma won't look for dlls in mission directories because it doesn't love us enough
    - We need an actual build script that can deploy the dll to somewhere, or, when we start arma, we might be able to put the directory the dll is in into PATH, I think that's how the windows dll lookup stuff is supposed to work
- Uninstall msvc because it's gross

Usage
---

Ideally, this is as transparent as possible so that you can get away with not having it on the production server without having to change all your calls to arma extensions in your arma mission scripts.

So there are some magic strings that make it work.

    - `reloader:load mydll` will try to load the mydll.dll library. If it fails, it will try to put a message in the return value of callExtension. It should be safe to call this without unloading first.
    - `reloader:unload` will cause this extension (and therefore the arma process) to let go of the dll so that you can replace it.

Any calls to this dll that do not match those magic strings will be forwarded to the dll loaded with `reloader:load`.

You can also run `test.py` with python to test that the dll is working. I made it so that it I didn't have to keep starting arma every time I changed something. In the long run we will probably write most of our tests in whatever language we write our extensions in. This was just a special case. So don't install python just for this if you don't want to. We might not even keep this reloady module depending on how we decide to do things.

TODO
---

Magic strings are kinda gross

Build systems? Make?
