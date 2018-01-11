REM Process each file in newsletter directory and create a RST file in the docs\temp directory
setlocal enabledelayedexpansion
@echo on
cls
set myDir0=%~dp0
pushd %~dp0

set myDir1=X:\Newsletters\temp


cd %myDir1%
rmdir !myDir0!docs\temp\ /s /q
mkdir !myDir0!docs\temp\

for %%i in (!myDir1!\*.docx) do (
    echo %%~ni
    set filename=%%~ni
    echo !filename!  
    set x=!filename!
    set y=!myDir0!docs\temp\!filename!
    mkdir !y!
    cd !y!
    pandoc -o !y!\!x!.rst --extract-media=images "%%i"
    exit    	               
)
setlocal
popd
