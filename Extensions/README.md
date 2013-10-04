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

To actually compile the dlls, be in the `bld` directory and run `msbuild`. This is assuming CMake detected you were using msvc and generated vcproj files and stuff. Anyway, run that when you modify a source file. I think.

TODO
---

Distribution? Getting the DLLs into a place where ArmA can load them.
