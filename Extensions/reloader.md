Reloader Extension
===

Defines `RVExtension()` to act as a sort of dll loader thing for swapping dlls while arma is running.

Build Instructions
---

See README.md, reloader should be the target name for this extension.

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
