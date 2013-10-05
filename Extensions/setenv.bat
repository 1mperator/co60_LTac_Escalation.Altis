@echo off

if not exist "setenv.local.bat" (
    echo You don't have a setenv.local.bat file, you need one.
    echo There should be a setenv.local.bat.sample file and I will try to copy it to setenv.local.bat and then exit. You should probably look at it and make sure it's correct for your configuration.
    copy "setenv.local.bat.sample" "setenv.local.bat"
    goto :end
)

where cl
if %errorlevel% == 0 (
    echo This environment appears to already be configured, exiting
    goto :end
)

call "setenv.local.bat"
set PATH=%PATH%;%~p0\env\bin
call "C:\Program Files (x86)\Microsoft Visual Studio 9.0\Common7\Tools\vsvars32.bat"

echo.
echo Your shit is good to go!
:end
