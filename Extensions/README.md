Extensions
===

CMake is the shit.

i have a clean checkout, what do i do
---

In a shell with a unixy environment (the bash thing that comes with git should do), run `sh bootstrap.sh` in order to download CMake.

If you don't have a bash thingy and no other way to run bootstrap.sh then just do the script yourself, it's pretty simple ... for now.

i ran it and now there's a bld, env, and tmp directory
---

You can get rid of `tmp` if you want.

Now in a command prompt, in this directory, run `setenv` and that should configure your prompt's environment to work properly. You'll need to do that for every shell you open that wants to build. I think, yeah because otherwise you can't run `msbuild`.

i ran setenv
---

Good, now go into `bld` and do `cmake ..`. This will make `cmake` do magical things. I think you only need to run CMake if your CMakeLists.txt changes, but don't quote me on that.

Assuming CMake is generating for msvc, to actually compile the DLLs for a project, be in the `bld` directory and run `msbuild Escalation.sln`. That will try to build everything.

The `/target` (or `/t`) switch can be used to build a particular target thingy; `msbuild Escalation.sln /t:escalationdb` will build the escalationdb DLL and its dependencies.

The `/property` (or `/p`) switch is for setting properties. I don't really know what properties are, but they can twiddle some things like whether to build release or debug. Debug is built by default, `msbuild Escalation.sln /p:Configuration=Release` uses the property switch to build release.


i has dlls but wat aboot arma?
---

*Beware, this section is full of lies and falsehoods*

At the moment, `CMakeLists.txt` is designed such that the timer.dll project thingy will be installed if you build the `INSTALL.vcproj` project. So, again, after running `bootstrap.sh` you should have a `bld` directory, go in there, run `cmake ..` to produce your vcproj files. Run `vcbuild timer.vcproj RELEASE` to build the timer DLL and finally `vcbuild INSTALL.vcproj RELEASE` to shove it into the directory that the ARMADIR environment variable points to (or at least, pointed to when you ran cmake).

It's just that easy! =D
