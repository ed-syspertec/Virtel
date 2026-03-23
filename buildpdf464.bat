REM Before running this, you need to install Python, then pip and sphinx:
REM - download https://bootstrap.pypa.io/get-pip.py
REM - python get-pip.py
REM - pip install sphinx

REM Release note Newsletter
sphinx-build -M latex .\docs\manuals\newsletters\TN202603 .\docs\_build\latex\TN202603
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\TN202603\latex\TN202603.tex

REM Documentation manuals
sphinx-build -M latex .\docs\manuals\virtel\Virtel464AP .\docs\_build\latex\Virtel464AP
sphinx-build -M latex .\docs\manuals\virtel\Virtel464CN .\docs\_build\latex\Virtel464CN
sphinx-build -M latex .\docs\manuals\virtel\Virtel464CS .\docs\_build\latex\Virtel464CS
sphinx-build -M latex .\docs\manuals\virtel\Virtel464GS .\docs\_build\latex\Virtel464GS
sphinx-build -M latex .\docs\manuals\virtel\Virtel464IG .\docs\_build\latex\Virtel464IG
sphinx-build -M latex .\docs\manuals\virtel\Virtel464MG .\docs\_build\latex\Virtel464MG
sphinx-build -M latex .\docs\manuals\virtel\Virtel464MI .\docs\_build\latex\Virtel464MI
sphinx-build -M latex .\docs\manuals\virtel\Virtel464UG .\docs\_build\latex\Virtel464UG
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel464AP\latex\Virtel_AOP_Guide.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel464CN\latex\Virtel_Connectivity_Guide.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel464CS\latex\Virtel_Customization_Guide.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel464GS\latex\Virtel_Getting_Started.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel464IG\latex\Virtel_Installation_guide.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel464MG\latex\Virtel_Messages.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel464MI\latex\Virtel_Migration_Guide.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel464UG\latex\Virtel_User_Guide.tex