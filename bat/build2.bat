REM Process each file in a diretcory
@echo on
color 1f
cls

cd C:\Users\Ed\Documents\newsletters

for %%f in (C:\Users\Ed\Documents\newsletters\*.docx) do (
            echo %%~nf
            SET P1=%%~nf:~0,6%
            echo %P1%
            rem pansoc -o "&&~nf.rst" --extract-media=images "&&~nf.docx"
    )
cd C:\Users\Ed\Documents\github\virtel