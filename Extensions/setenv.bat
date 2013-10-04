@echo off
where cl
if %errorlevel% == 0 (
    echo This environment appears to already be configured, exiting
    goto :end
)

set PATH=%PATH%;%~p0\env\bin
call "C:\Program Files (x86)\Microsoft Visual Studio 9.0\Common7\Tools\vsvars32.bat"

echo.
echo Your shit is good to go!
:end
