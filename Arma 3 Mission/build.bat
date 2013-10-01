@ECHO OFF

REM This should build the dll and move it into the correct path for Arma Runtime

set cppDirectory="c:\bleh"
set arg1="cl foo.cpp /link /DLL /OUT:foo.dll"
set armadir="c:\bleh"

ECHO Will compile .dll Files for Arma and place them into the correct directory

cd %cppDirectory%

call "C:\Program Files (x86)\Microsoft Visual Studio 9.0\Common7\Tools\vsvars32.bat" %arg1%

MOVE foo.dll %armadir%
