REM Process each file in a diretcory
setlocal enabledelayedexpansion
@echo on
cls
set myDir0=%~dp0
pushd %~dp0

set myDir1=C:\virtel\HowTo_Manuals


cd %myDir1%
rmdir !myDir0!Virtel\docs\manuals\howto\ /s /q
mkdir !myDir0!Virtel\docs\manuals\howto\

for %%i in (*.doc) do (
    echo %%~ni
    set filename=%%~ni
    echo !filename!  
    set x=!filename!
    set y=!myDir0!Virtel\docs\manuals\howto\!filename!
    mkdir !y!
    cd !y!
    pandoc -o !y!\!x!.rst --extract-media=images "!myDir1!\%%i"               
)
setlocal
popd