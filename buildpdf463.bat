sphinx-build -M latex .\docs\manuals\virtel\Virtel463CN .\docs\_build\latex\Virtel463CN
sphinx-build -M latex .\docs\manuals\virtel\Virtel463CS .\docs\_build\latex\Virtel463CS
sphinx-build -M latex .\docs\manuals\virtel\Virtel463GS .\docs\_build\latex\Virtel463GS
sphinx-build -M latex .\docs\manuals\virtel\Virtel463IG .\docs\_build\latex\Virtel463IG
sphinx-build -M latex .\docs\manuals\virtel\Virtel463MG .\docs\_build\latex\Virtel463MG
sphinx-build -M latex .\docs\manuals\virtel\Virtel463MI .\docs\_build\latex\Virtel463MI
sphinx-build -M latex .\docs\manuals\virtel\Virtel463UG .\docs\_build\latex\Virtel463UG
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel463CN\latex\Virtel_Connectivity_Guide.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel463CS\latex\Virtel_Customization_Guide.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel463GS\latex\Virtel_Getting_Started.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel463IG\latex\Virtel_Installation_guide.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel463MG\latex\Virtel_Messages.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel463MI\latex\Virtel_Migration_Guide.tex
texify --pdf --engine=luahbtex --synctex=1 --clean .\docs\_build\latex\Virtel463UG\latex\Virtel_User_Guide.tex