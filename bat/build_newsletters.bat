REM Process each file in a diretcory
setlocal enabledelayedexpansion
@echo off
cls
set myDir0=%~dp0
pushd %~dp0

set myDir1=C:\Users\Ed\Documents\newsletters


cd %myDir1%
rmdir !myDir0!Virtel\docs\manuals\newsletters\ /s /q
mkdir !myDir0!Virtel\docs\manuals\newsletters\

for %%i in (*.doc) do (
    rem echo %%~ni
    set filename=%%~ni  
    for /f "tokens=2,3" %%a in ("!filename!") do (  
        rem echo !filename! %%a %%b
        set dirName=%%a%%b
        rem echo !dirName!
        set x=!dirName:~0,-3!!dirname:~7,2!
        set y=!myDir0!Virtel\docs\manuals\newsletters\!x!
        mkdir !y!
        cd !y!
        pandoc -o !y!\!x!.rst --extract-media=images "!myDir1!\%%i"           
    )
)
setlocal
popd