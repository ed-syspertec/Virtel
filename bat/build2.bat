REM Process each file in a diretcory
setlocal enabledelayedexpansion
@echo off
cls
set myDir0=%~dp0
pushd %~dp0

set myPath="D:\Documents\newsletters"
cd %myPath%


for %%i in (*.docx) do (
    rem echo %%~ni
    set filename=%%~ni     
    set x=!filename!
    set y=!myDir0!Virtel\!filename!
    echo !x! 
    pandoc -o "!x!.rst" --extract-media=images "%%i" 
    )
)
setlocal
popd

rem cd D:\Documents\github\virtel\bat