Timer extension
===

Usage
---

Assuming you've compiled timer.dll and some other dll like bar.dll, you can measure how long it takes to call the extension with something like

    "timer" callExtension "";
    for [{_i=0}, {_i<100000}, {_i=_i+1}] do {
        "bar" callExtension "";
    };
    hint ("timer" callExtension "");

Calling into `timer` the first time should start the timer, calling into it the second time should stop it and return a floating point specifying the number of seconds that passed since the timer started.

On my machine (i7-3630QM 2.4GHz) it takes about 350 milliseconds to call RVExtension in `bar` (which was doing nothing) 100,000 times. So there doesn't seem to be a lot of overhead there.

---
Bugs

For some reason, the timer doesn't seem to start on the very first call. So the above block won't work on its own, you'll need to call `"timer" callExtension "";` first, and then the next call will start it, and every subsequent one will toggle it. Or something. I don't really know.
