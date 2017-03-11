REM Process each file in a diretcory
setlocal enabledelayedexpansion
@echo off
cls

pushd %~dp0

set myPath="C:\Users\Ed\Documents\nw"
cd %myPath%
 


for %%i in (*.doc) do (
    set filename=%%~ni    
    echo !filename!  
    )
)
setlocal
popd