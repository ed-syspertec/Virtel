REM Process each file in a diretcory
setlocal enabledelayedexpansion
@echo off
cls

pushd %~dp0

set myPath="D:\Documents\newsletters"
cd %myPath%
 


for %%i in (*.docx) do (
    set filename=%%~ni    
    echo !filename!  
    )
)
setlocal
popd