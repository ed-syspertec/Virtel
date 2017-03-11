Updates Virtel 4.54
===================

VIRTEL Universal Protocol:
--------------------------

5180 Allow several ICONNECT lines on one TPIPE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Anew request cannot be received from ICAL IMSConnect before the previous one has been finished and a Resume TPIPE has been issued.

	Change VIR0ICON 's TPIPE to use the Virtel internal line name as IRM_CLIENTID and use Virtel entry point name as IRM_RT_ALTCID (alternate client id)

	This what ise suggested in the attached Sync Call Client Architecture.doc provided by IBM.

	Also change IRM_F5 TPIPE flag to IRM_F5_AUTO:  'AUTO FLOW OF MESSAGES'


	NOTE: To provide parallelism, several Virtel lines should be defined instead of only one line as previously done.

VIRTEL Web Access:
------------------

5119 Extended colors not shown by InterPel (Pelican) application
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Add support for the X'03' Query List variant Type of operation of the Read Partition structured field.
	(cf IBM 3270 IDS data stream programmer's Reference page 5-50)

5140 Display Virtel update level (in Home & VWA pages)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Display Virtel update level (in Home & VWA pages) + Changes in the VWA toolbar

	- Virtel Name & Update level displayed in VWA toolbar (can be disabled using user settings)
	- Added 3D hovering style to toolbar buttons & cosmetic changes in the KeyPad popup
	- Toolbar buttons images merged into a single sprite image

5141 FireFox/Chrome extensions status icon in the Copy/Paste menu.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	FireFox/Chrome extensions status icon in the Copy/Paste menu.

	A new icon (and tooltip) is displayed in the Copy+Paste menu title (on FireFox or Chrome only).
	This icon shows the status of the FireFox/Chrome Copy+Paste extension (plugin installation and/or current domain's authorization).

	The possible status are :
	- + GREEN (Checkmark icon) : the extension is installed and the current domain is authorized
	- + ORANGE (Padlock icon) : the extension is installed but the current domain is NOT authorized (Chrome only)
	- + RED (Ban icon) : 
	  - Chrome : the extension is NOT installed (or disabled)
	  - FireFox : the extension is NOT installed (or disabled), or the domain is NOT authorized

5145 ADMVWM - group copy/delete
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  

	Implementation of a possibility of serial processing on the file list of a directory VIRTEL:

	A button switches the list to serial processing mode with check boxes to select files, and input fields to change file names

	In this mode:
	- A button allows you to request the deletion of the selected files (with dialogs for confirmation, following the confirmation screen 3270)
	- A button allows you to request to copy all the selected files. A dialog box opens to specify the target directory. If the current directory is retained as the target directory, the user will have renamed the files to be copied under a different name in the same directory.
	- When processing is started, an abort button is displayed.
	
	Below each selected file line appears a notification line of the processing steps. They remain displayed, the button of refreshment of the page making it possible to update the display of the list.

5150 Toolbar styling fixes
^^^^^^^^^^^^^^^^^^^^^^^^^^

	+ Only the virtel name can be hidden, update version is always shown (all)
	+ Transparent background for user-defined toolbar buttons (all)
	+ Hide toolbar infos during page load (all)
	+ Removed blue border around the toolbar's flag icon (on IE9-)
	+ Fixed position of close icon in keypad window (IE8-)
	+ Fixed toolbar buttons display (IE 8-)

5163 3278T terminals support: graphic characters allowed in input
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	This expands on 4842 3270 graphics support for UTF-8 to also allow graphics in INPUT fields.


5191 Implementing help pages in different languages in VWA.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	(OFD Karlsruhe requested German, AG2R French).	


5194 Update of Dynamic Directoriy Interface & Macro interface
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


VIRTEL Web Modernisation & intergration:
----------------------------------------

5133 QUICKLNK - OPTION$ FOR-QUICKLNK
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	OPTION$ statement now supports 'QUICKLNK' line type.

	::

     	OPTION$ FOR-QUICKLNK,                        
           (METHOD,'CALL'),                       
           (PROGRAM,'*TARGET'),                   
           (TERMINAL,'CICS-TERMINAL'),            
           (FILE-OUT,'QUESTION'),                 
           (FILE-IN,'ANSWER'),                    
           (RET-CODE,'RETURN-CODE'),              
           TOVAR='MYPARMS'    

5187 VTA and QUICKLNK line type
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	This completes 5133 QUICKLNK - OPTION$ FOR-QUICKLNK


	In the attached test2 scenario which is called by the test2 transaction a SEND$ request calls a QUICKLINK LINE:

	::

	         OPTION$ FOR-QUICKLNK,                                         *
	               (METHOD,'CALL'),                                        *
	               (PROGRAM,'*TARGET'),                                    *
	               (TERMINAL,'TERMINAL'),                                  *
	               (FILE-OUT,'QUESTION'),                                  *
	               (FILE-IN,'ANSWER'),                                     *
	               (RET-CODE,'RETURN-CODE'),                               *
	               (RET-CICS1,'EIBRESP'),                                  *             
	               (RET-CICS2,'EIBRESP2'),                                 * 
	               TOVAR='MYPARMS'                    
		*
	         SEND$ TO-LINE,LINE='QLNKSABY',PARMS='MYPARMS',ERROR=ERRSCENAR   

	This request supports the VTA protocol to call a user program under SPCICSH (the cics is defined in the QUICKLINK LINE), passing a commarea (question) and retrieving a commarea (answer).

5226 VTA CONTAINERS
^^^^^^^^^^^^^^^^^^^ 

	reassembly of VIR0QLK with the new  VXMDQLNK dsect.
	(cf 5187 VPA and QUICKLNK line type)

	Also support for containers by specifiying method 'CALL-CONTAINER' in OPTION$ FOR-QUICKLNK:

	::

	         OPTION$ FOR-QUICKLNK,                                         *
	               (METHOD,'CALL-CONTAINER'),                              *
	               (PROGRAM,'*TARGET'),                                    *
	               (TERMINAL,'TERMINAL'),                                  *
	               (FILE-OUT,'QUESTION'),                                  *
	               (FILE-IN,'ANSWER'),                                     *
	               (RET-CODE,'RETURN-CODE'),                               *
	               (RET-CICS1,'EIBRESP'),                                  *             
	               (RET-CICS2,'EIBRESP2'),                                 * 
	               TOVAR='MYPARMS'      



5132 Allow Program Tab into a SCRIPT or a SCENARIO
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	New command that can be inserted in a Virtel Script to mean: 'Progam Tab'.
	Since a script may be invoked by a scenario through the ACTION$ instruction, also allows program tab from a scenario:

	..note:: When specified in a scenario, the '&' character must be escaped.

:: 

      ACTION$  TO-APPLICATION,KEY=7D,
            AND=(SCRIPT,'&&>&&>Test&&/T')


5138 allow COPY$ SYSTEM-TO-VARIABLE TYPE=REPLACE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The TYPE=REPLACE option was not allowed for instruction COPY$ SYSTEM-TO-VARIABLE.

5157 MAP$ FORMAT= with TYPE=S9
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Allows support for positive/negative sign of a MAP$ instruction with FORMAT= and TYPE=S9

	When converting from a COMMAREA, if the MAP$ statement has TYPE=S9, FORMAT= will convert the '+' sign to '-' if the input number is negative.

	When converting to a COMMAREA, if the MAP$ statement has TYPE=S9, non numeric characters will be removed (like ONLY9 does).   
	change FORMAT= support to 

	Exemple of statement:-

	::

		MAP$ AREA,WITH='DOSSIER-MONTHLYPAYMENTAMOUNT',TYPE=S9,LENGTH=11,FORMAT=('+9999999.99',9) 

5177 Decimal Point for FORMAT= with TYPE=S9
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Expand 5157 MAP$ FORMAT= with TYPE=S9 to also support decimal point when translating XML to commarea.

	For instance,

	         MAP$ AREA,WITH='out',TYPE=S9,LENGTH=18,                       *
	               FORMAT=('+9999999999999999.99',9)

	would translate <out> -123.4 </out>

	to:     

	00240  40404040 40F0F0F0 F0F0F0F0 F0F0F0F0  F0F0F1F2 F3F4D000 040000             *     00000000000001234è .       *

	where one zero has been added at the right of the '4' digit to account for the FORMAT= definition.

	NOTE: the rightmost period ('.') or comma (',') determine the decimal point.

5192 IF-SOUND-ALARM-IS-REQUESTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
                                                
	Virtel will allow a new template instruction: IF-SOUND-ALARM-IS-REQUESTED :

	{{{ IF-SOUND-ALARM-IS-REQUESTED ... whatever code is needed to ring the bell ... }}}



MQSeries:
---------

5135 MQPUT FORMAT STRING
^^^^^^^^^^^^^^^^^^^^^^^^

	Line definition now supports 'TRAN' option.

	- When TRAN specified with the STR value on the OUTPUT QUEUE line MQPUT sets the FORMAT MQSTR option (MSGDESC_FORMAT,MQFMT_STRING)
	- When TRAN specified with the STR value on the INPUT QUEUE line MQGET sets the  MQGMO_CONVERT option.

	Provided character sets are known to MQ, this will allow MQ to perform the appropriate character set translations between the communicating systems.

Miscellaneous:
--------------

5148 variables above the BAR : ALLOW64BITS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	This update adds the possibility to store Virtel Variables above the BAR, ie in 64 bits storage. For the time being, this type of variable is only used for ind$file downloads.
	The support is activated if the VIRTCT MEMORY= parameter has the option 'ALLOW64BITS', for instance:

	MEMORY=(ABOVE,ALLOW64BITS), ...
	or
	MEMORY=(TEST,ALLOW64BITS), ...

	This support also depends on the Virtel JCL JOB parameter MEMLIMIT= which controls the amount of 64-bit private virtual memory available to the Virtel address space. 

	For instance:
	// MEMLIMIT=2G, 
	would allow Virtel to use up to 2 gigabytes above the BAR.

	If the 'above the BAR' memory allocation fails, Virtel issues a message:

	VIRB179E ERROR ON: luname  ALLOCATING 64 BITS STORAGE - RETCODE: xxxxxxxx - REASON CODE: xxxxxxxx   

	the (hexadecimal) return code and reason code would be researched in the DC2 code in the 'z/OS MVS System Codes ' manual.
	(or possibly in in IBM IARV64 service documentation in the 'MVS Assembler Services Reference ' manual )

	Virtel currently limits the maximum size of a Virtel variable to 2 gigabytes. 


5151 New option in TCT to support wrting WTOs to dataset.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 

	LOG = Console | LOG = SYSOUT | LOG= (SYSOUT,class)

5160 Additional VIRTEL LOG
^^^^^^^^^^^^^^^^^^^^^^^^^^

	TCT Changes

	LOG=CONSOLE | SYSOUT
	LOG=(SYSOUT,class)
	LOG=(SYSOUT,class,destid)

	Defaults

	class  = A
	destid = NULL


	Commands

	F VIRTEL,LOG=CONSOLE | SYSOUT | SPIN | BOTH

	CONSOLE	Write WTOs to the system console log.
	SYSOUT		Write WTOs to a dynamically allocated SYSOUT dataset using the LOG options in the TCT.
	SPIN		If writing to SYSOUT, spin off the current dataset for printing etc.
	BOTH		Write WTOs to both the console log and SYSOUT.


	Messages

	VIR0230W	DYNAMIC ALLOCATION FAILED FOR SYSOUT. LOG OPTION SET TO CONSOLE
			VIRTEL was unable to allocate a SYSOUT datsset. LOG=SYSOUT has been terminated and WTOs are now recording to CONSOLE.
			Action:	Contact Virtel support
			Issuing module VIR0002A

	VIR0231W	ERROR OPENING SYSOUT DDNAME. LOG OPTION SET TO CONSOLE
			VIRTEL was unable to open the SYSOUT dataset.     
			Action:	Check for IEC related error messages in the system console log. WTOs will contine record in CONSOLE mode only. 
				Contact Virtel support.
			Issuing module VIR0002A

	VIR0232W	ERROR WRITING TO SYSOUT DDNAME. LOG OPTION SET TO CONSOLE
			VIRTEL was unable to write to the SYSOUT dataset. Check for IEA related error messages in the system console log. WTOs will contine
			to record in CONSOLE mode only. Contact Virtel support.     
			Action:	None
			Issuing module VIR0002A

	VIR0233I		VIRTEL SYSOUT DATASET HAS BEEN SPUN OFF 
			VIRTEL has successfully spun off a sysout dataset.
			Action:	None
			Issuing module VIR0002A

	VIR0234W	CLOSE FAILED FOR SYSOUT DATASET. UNABLE TO SPIN OFF
			VIRTEL failed to close the current SYSOUT dataset and consequenlty the dataset hasn't been spun off.
			Action:	VIRTEL continues to use the SYSOUT dataset. Issue LOG=CONSOLE to stop further SYSOUT processing.
				Contact Virtel support.
			Issuing module VIR0002A

	VIR0235I		VIRTEL LOG ROUTINE VIR0002A LOADED
			VIRTEL logging routine has been loaded. LOG commands are available.
			Action:	None
			Issuing module VIR0002


	VIR0236I		VIRTEL LOG RECORDING TO SYSOUT
			VIRTEL logging is now recording to SYSOUT.
			Action:	None
			Issuing module VIR0002

	VIR0237I		VIRTEL LOG RECORDING TO SYSOUT AND CONSOLE
			VIRTEL logging is now recording to both the system console log and SYSOUT.
			Action:	None
			Issuing module VIR0002

	VIR0238I		VIRTEL LOG RECORDING TO CONSOLE
			VIRTEL logging is now recording to CONSOLE.
			Action:	None
			Issuing module VIR0002	

5166 Enhance TCT command
^^^^^^^^^^^^^^^^^^^^^^^^

	The F VIRTLOG,TCT command has been enhanced to display the active LOG value.

	::

		F SPVIREH,TCT

		VIR0200I TCT                                                        
		VIR0270I DISPLAY     035                                            
		VIRTEL TCT=VIRTCTEH:                                                
		SILENCE=N,MEMORY=(A,N),BFVSAM=32768,BUFDATA=016,BUFSIZE=20000,STR=03
		COUNTRY=GB,GMT=SYSTZ,DEFUTF8=IBM1146 ,LANG=E,MAXSOCK=00240,VSAMTYP=N
		APPLID=APPLHOLT,SMF=Y,PASSTCK=Y,VIRSECU=Y,SWA=N,NBTERM=0500,NTASK=04
		MEMORY=(SYS(0001567K,0001567K),DATA(0002816K,0002816K)),LOG=CONSOLE 
		VIR0280I END   


5196 Installation of VTG within Virtel.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

5201 IND$FILE: new VIR11D3W wto if download canceled due to size
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	New message displayed when an IND$FILE download is canceled it is too large:


5204 ind$file download - HTPARM limit
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Implement a user specifiable limit to the size of a download IND$FILE. 	Previously, the limit was hardcoded at 2 gigabytes by 5148 variables above the BAR : ALLOW64BITS. After this modification, the limit will be set by the HTPARM(4) VIRTCT parameter, specified in megabytes, with 500 as the default.

	For instance:

	      HTPARM=(,,,300),   	: will set the max above the BAR file size to 300 megabytes  

	      HTPARM=,			: will set the max above the BAR file size to the default: 50 megabytes. 


	If the limit is reached, the VIR11D3W error message will be issued:

	 VIR11D3W DEVTA115 IND$FILE DOWNLOAD CANCELED BECAUSE LARGER THAN HTPARM(4)  
	 VIR11D3W CLVTA009 IND$FILE DOWNLOAD CANCELED BECAUSE LARGER THAN HTPARM(2)	


5205 VIRSV V3R3 modifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	14/11/14     Ajout VIRDEXC3 VIRPEXC3.

	08/12/14     Codes retour DPL pour EXCI RC=12, reason=422
	             Sources modifié: VIRPEXC3
	             Programme réassemblé: VIRPEXC3.

	12/12/14     Codes retour DPL + code EXCI pour RC=12, Reason=422
	             Sources modifié: VIRPEXC3
	             Programme réassemblé: VIRPEXC3.

	09/02/15     Suppression store de r0 et r1 dans yuser_token pour
	             ne pas ecraser SN + LX de VIRXM.
	             Adaptation appel PC routine VIRXM a SN + LX en gardant
	             la compatibilité avec VIRXM précédent.
	             Sources modifié: VSVTRACE.
	             Programme réassemblé: VSVTSURV et VSVTINIT.       



Virtel 4.55 Updates
=================== 

VIRTEL Web Modernisation & intergration:
----------------------------------------     

5239 QUICKLNK allow specifying CHANNEL and CONTAINER names
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	( NOTE: see also 5256 QUICKLNK redesign for multiple containers )

	      OPTION$ FOR-QUICKLNK,                       
	            (METHOD,'CALL-CONTAINER'),            
	            (PROGRAM,'*TARGET'),                  
	            (CONTAINER-FOR-QUESTION,'*CONT1'),    
	            (CONTAINER-FOR-RESPONSE,'*CONT2'),    
	            (CHANNEL,'*MYCHANNEL'),               
	            (TERMINAL,'CICS-TERMINAL'),           
	            (FILE-OUT,'QUESTION'),                
	            (FILE-IN,'ANSWER'),                   
	            (RET-CODE,'RETURN-CODE'),             
	            (RET-CICS1,'EIBRESP'),                
	            (RET-CICS2,'EIBRESP2'),               
	            TOVAR='MYPARMS'                       

	exemple dans SNAP utilisant test4.vsc :


	QLNKSABY  EECB   0000008D  9EC4784E  VIR0QLK +283E  0822  /WRITE     1611320569                                    
	00000  00000060 C8E3D3D6 C3F0F1F5 1ECC0040  E3C5E2E3 C4D7D3F2 00000000 C3D6D5E3  *   -HTLOC015..  TESTDPL2    CONT*
	00020  00000000 00000000 00004DC0 0000002D  C4C6C8D9 C5D8E4C5 E2E34040 40404040  *          (é   .DFHREQUEST      *
	00040  C4C6C8D9 C5E2D7D6 D5E2C540 40404040  E3D6E3D6 40404040 40404040 40404040  *DFHRESPONSE     TOTO            *
	00060  E3C5E2E3 40C3D6D4 D4C1D9C5 C140F1F2  F3F4F5F6 F7F8F9F0 F1F2F3F4 F5F6F7F8  *TEST COMMAREA 123456789012345678*
	00080  F9F04040 40404040 40404040 40                                             *90                              *


5256 QUICKLNK redesign for multiple containers
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	This is to complete 5239 QUICKLNK allow specifying CHANNEL and CONTAINER names which only allowed one output and one input container.

	This new variant allows a list of containers in input as well as in output.


	     OPTION$ FOR-QUICKLNK,                       
	            (METHOD,'CALL-CONTAINER-LIST'),            
	            (PROGRAM,'*TARGET'),                  
	            (CONTAINERS-FOR-QUESTION,'*CONT1'),    
	            (CONTAINERS-FOR-RESPONSE,'*CONT2'),    
	            (CHANNEL,'*MYCHANNEL'),               
	            (TERMINAL,'CICS-TERMINAL'),           
	            (FILE-OUT,'QUESTION'),                << see below
	            (FILE-IN,'ANSWER'),                   
	            (RET-CODE,'RETURN-CODE'),             
	            (RET-CICS1,'EIBRESP'),                
	            (RET-CICS2,'EIBRESP2'),               
	            TOVAR='MYPARMS'                     


	------------------------
	jeu. juin-04-2015  19:48

	see 5259 QUICKLNK corrects 5256 which simplifies the above to:



	     OPTION$ FOR-QUICKLNK,                       
	            (METHOD,'CALL-CONTAINER-LIST'),            
	            (PROGRAM,'*TARGET'),                  
	            (CONTAINERS-FOR-QUESTION,'DATAIN'),    
	            (CONTAINERS-FOR-RESPONSE,'DATAOUT'),    
	            (CHANNEL,'*MYCHANNEL'),               
	            (TERMINAL,'CICS-TERMINAL'),           
	            (RET-CODE,'RETURN-CODE'),             
	            (RET-CICS1,'EIBRESP'),                
	            (RET-CICS2,'EIBRESP2'),               
	            TOVAR='MYPARMS'                     

	5259 QUICKLNK: corrects 5256

	Corrects 5256 QUICKLNK redesign for multiple containers by:

		- removing references to FILE-IN and FILE-OUT which conflict with the CONTAINERS-... parameters.
		- remove the indirection on the CONTAINERS-... values: name of a variable, instead of the name of a variable containing the name of a variable.


	eg:

	     OPTION$ FOR-QUICKLNK,                       
	            (METHOD,'CALL-CONTAINER-LIST'),            
	            (PROGRAM,'*TARGET'),                  
	            (CONTAINERS-FOR-QUESTION,'DATAIN'),    
	            (CONTAINERS-FOR-RESPONSE,'DATAOUT'),    
	            (CHANNEL,'*MYCHANNEL'),               
	            (TERMINAL,'CICS-TERMINAL'),           
	            (RET-CODE,'RETURN-CODE'),             
	            (RET-CICS1,'EIBRESP'),                
	            (RET-CICS2,'EIBRESP2'),               
	            TOVAR='MYPARMS'            



	sample trace entry:



	QLNKMAU   EE58   00000055  9EBD4852  VIR0QLK +2922  0822  /WRITE     1735396027                                    
	00000  00000040 E5E3C7D3 D6F2F4F9 1EDD42D8  E3C7C5C3 C8D6F0F1 00000000 C3D6D5E7  *    VTGLO249...QTGECHO01    CONX*
	00020  00000000 00000000 00004DE0 00000015  40404040 40404040 40404040 40404040  *          (ç   .                *
	00040  C9D5D7E4 E3C3D6D5 E3C1C9D5 C5D94040  00000001 C1                          *INPUTCONTAINER     .A           *

	5259 QUICKLNK: corrects 5256
	^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Corrects 5256 QUICKLNK redesign for multiple containers by:

		- removing references to FILE-IN and FILE-OUT which conflict with the CONTAINERS-... parameters.
		- remove the indirection on the CONTAINERS-... values: name of a variable, instead of the name of a variable containing the name of a variable.


	eg:

	     OPTION$ FOR-QUICKLNK,                       
	            (METHOD,'CALL-CONTAINER-LIST'),            
	            (PROGRAM,'*TARGET'),                  
	            (CONTAINERS-FOR-QUESTION,'DATAIN'),    
	            (CONTAINERS-FOR-RESPONSE,'DATAOUT'),    
	            (CHANNEL,'*MYCHANNEL'),               
	            (TERMINAL,'CICS-TERMINAL'),           
	            (RET-CODE,'RETURN-CODE'),             
	            (RET-CICS1,'EIBRESP'),                
	            (RET-CICS2,'EIBRESP2'),               
	            TOVAR='MYPARMS'            



	sample trace entry:



	QLNKMAU   EE58   00000055  9EBD4852  VIR0QLK +2922  0822  /WRITE     1735396027                                    
	00000  00000040 E5E3C7D3 D6F2F4F9 1EDD42D8  E3C7C5C3 C8D6F0F1 00000000 C3D6D5E7  *    VTGLO249...QTGECHO01    CONX*
	00020  00000000 00000000 00004DE0 00000015  40404040 40404040 40404040 40404040  *          (ç   .                *
	00040  C9D5D7E4 E3C3D6D5 E3C1C9D5 C5D94040  00000001 C1                          *INPUTCONTAINER     .A           *

5284 SHRHTTP line type, EXTERNAL-LINE startup prerequisite, QUICKLNK on TCP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	First step of inter-Virtel support.

	This defines 
			- a new SHRHTTP line protocol;
	to allow the Virtel HTTP session to tell on which Virtel it resides (not implemented)

			- a EXTERNAL-LINE( startup prerequisite;
	to attach a (normally QUICKLNK) line to a SHRHTTP line for inter-Virtel messaging 

			- a QUICKLINK on TCP protocol.
	to support the inter Virtel messaging.

	At this stage, the various line modifications do not do anything useful, but allow the various lines to start.
	eg:

	16.49.03 JOB00155  VIRHT01I HTTP INITIALISATION FOR HTTPSHR1 (S-HTTP1 ), VERSION 4.55     
	16.49.03 JOB00155  VIRT905I HTTPSHR1 SOCKET 00000000 LISTENING 192.168.235.061:43191      
	16.49.03 JOB00155  VIRHT02I LINE HTTPSHR1 (S-HTTP1 ) HAS URL http://192.168.235.61:43191  
	16.49.03 JOB00155  VIRHT03I HTTP LINE HTTPSHR1 (S-HTTP1 ), IS SERVING THE LOCAL VIRTEL              
	16.49.10 JOB00155  VIRQLK9I INITIALISATION FOR EXTVIR5  (T2-QLNK ), VERSION 4.55  
	        
	16.49.10 JOB00155  VIRT907I EXTVIR5  SOCKET 00000000 CALLING   192.168.235.061:63161      
	16.49.11 JOB00155  VIRB176I LINE HTTPSHR2 (S-HTTP2 ), RESTARTED BY T2-QLNK                
	16.49.11 JOB00155  VIRT906I SP3VIR5  SOCKET 00010000 CALL FROM 192.168.235.061:32220      
	16.49.12 JOB00155  VIRHT01I HTTP INITIALISATION FOR HTTPSHR2 (S-HTTP2 ), VERSION 4.55     

	...

	16.49.13 JOB00155  VIRHT01I HTTP INITIALISATION FOR HTTPSHR2 (S-HTTP2 ), VERSION 4.55     
	16.49.13 JOB00155  VIRT905I HTTPSHR2 SOCKET 00000000 LISTENING 192.168.235.061:43192      
	16.49.13 JOB00155  VIRHT02I LINE HTTPSHR2 (S-HTTP2 ) HAS URL http://192.168.235.61:43192  
	16.49.13 JOB00155  VIRHT03I HTTP LINE HTTPSHR2 (S-HTTP2 ), IS SERVING A REMOTE VIRTEL             


	NOTE: this has been changed by: 5300 VIRPLEX

5300 VIRPLEX
^^^^^^^^^^^^

	This expands and change 5284 SHRHTTP line type, EXTERNAL-LINE startup prerequisite, QUICKLNK on TCP

	The new Virplex feature of Virtel implements a dialog between two or more Virtel lines located in one or several Virtel's.

	This could allow sharing of one IP address between several Virtel's without the need of the TIMEDAFFINITY parm (of VIPADISTRIBUTE) for DVIPA's.

	urls received by Virtel have a new parameter VPLEX= which allow one Virtel line to know if it is one of his urls, or if it belongs to another Virtel.
	If it belongs to another Virtel, the url is routed through quicklink lines to this other Virtel, which will process it and route back the answer through the same path.

	example of an url with the VPLEX= parameter:
	http://192.168.235.61:43192/w2h/VPLEX=Hsb-6M-GazFL2HQE/WEB2SUB.HTML++VirtelSession=AGnTmQAAAAweyIyY

	the VPEX= parameter is created with a new specific instruction page: '{{{ VIRPLEX-CODE }}}'
	for instance, in the WEB2SUB.html page:

	form name="virtelForm" action="{{{VIRPLEX-CODE}}}{{{NAME-OF (PAGE)}}}++{{{SESSION-CODE}}}" method="post"

	NOTE: this is modified by 5324 VIRPLEX - several lines


5324 VIRPLEX - several lines
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Continue VIRPLEX support, allowing several lines.


	Setup:

	-1-	Each Virtel in a VIRPLEX sees the other Virtel through a Quicklink line.
		The external AND internal names of these lines should be the name of a Virtel in the VIRPLEX.

	-2-	Each Virtel should also have a Http line with the VIRPLEX-LINE($VIRTEL$)  statement as a startup prerequisite.
		At startup, $VIRTEL$ will be replaced by the name of the Virtel.



	For example, see the list of lines for a VIRPLEX with 4 lines.


	------------------------
	jeu. déc.-24-2015  18:51

	5324 VIRPLEX - several lines - corrections


	NOTE: this is updated by: 5385 VIRPLEX - complements

	also possible is:  VIRPLEX-LINE(=VIRTEL=) 


5342 VIRPLEX - Correct message VIRQLK8I
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	The message VIRQLK8I is confusing.
	eg in started task SPVIRE00, the following message was issued:

	11.43.09 STC09204  VIRQLK8I SPVIRE02 (SPVIRE02) IS CONNECTED TO VIRTEL SPVIRE02     

	-->
	this tries to say:
	in current Virtel, SPVIRE00, the local line 'SPVIRE02(SPVIRE02)' is connected to remote Virtel 'SPVIRE02'

	==>
	message is changed to:

	VIRQLK8I LOCAL LINE SPVIRE02(SPVIRE02) IS CONNECTED TO REMOTE VIRTEL : SPVIRE02

5385 VIRPLEX - complements
^^^^^^^^^^^^^^^^^^^^^^^^^^

	-	allow VIRPLEX-LINE(=VIRTEL=) in Startup prerequisite of the Http line in addition to VIRPLEX-LINE($VIRTEL$) which uses a country specific character (: $) and that may lead to problems.

	-	correct support of Long Poll requests: the 205 response was not sent to the correct session when it was in an other Virtel.

	-      tests on four quicklnk lines and one http; 4 Virtels: spvire00, spvire01 (on mvs1)  spvire02, spvire03 (on mvs2).
	       all sharing the same READ-ONLY files. (updates are done by stopping all four Virtels and starting sptholtv with the same files in update mode)

	-	cosmetic changes in the protocol used to communicate between Virtels in order to indicate clearly the name of the partner Virtel.
	       ( cf example messages )


5320 RULE may ignore an url and respond with an error page
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Currently, a rule allows choosing an entry point but not redefining the input URL.
	Therefore, the error message received by an unauthorized user would be 'page not found' or 'directory not found': which are un-userfriendly messages.

	This modification allows the specification of '$REJECT$' in the parameter field of a rule. 
	If the rule is activated for a connection, and the rule has the $REJECT$ parameter specified, then the url will be ignoredand the user will be redirected according to the entry point specified in the RULE, with all defaults equal to the entry point name: (external name of the directory transaction and name of the page to be displayed).

5417 SCRIPT enhancements
^^^^^^^^^^^^^^^^^^^^^^^^

	Similar to 4519 SCRIPT : allows * for a PA key

	Allows more 'user friendly' codings for PA/PF keys in a transaction script: keys may now be specified as:

	&*CLEAR 
	&*clear
	&*ENTER
	&*enter
	&*PA1
	&*pa1
	...
	&*PF24
	&*Pf24


5244 COPY$ column to variable with TYPE=REP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	From:    Jean-Noël CLEMENT <jean-noel.clement@syspertec.com>
	Date:    Thursday, April 16, 2015, 11:01:32 AM
	Subject: Problème COPY$ SCREEN-TO-VARIABLE
	 
	Il y a un problème avec  COPY$ SCREEN-TO-VARIABLE,SCREEN=(row,col,len,ht) quand on utilise ht et TYPE=REPLACE
	Sans TYPE=REPLACE, la variable destinataire est bien une liste 

	         COPY$ SCREEN-TO-VARIABLE,SCREEN=(18,19,16,06),VAR='LISTE'
	         ERROR$ 0,'Poste 1=','*LISTE'
	         POP$ VAR='LISTE'
	         ERROR$ 0,'Poste 2=','*LISTE'
	         POP$ VAR='LISTE'
	         ERROR$ 0,'Poste 3=','*LISTE'
	         POP$ VAR='LISTE'
	         ERROR$ 0,'Poste 4=','*LISTE'
	         POP$ VAR='LISTE'
	         ERROR$ 0,'Poste 5=','*LISTE'
	         POP$ VAR='LISTE'
	         ERROR$ 0,'Poste 6=','*LISTE'
	         POP$ VAR='LISTE'
	Résultat 
	Poste 1=User . . . . . . 
	Poste 2=Password . . . . 
	Poste 3=Secondary Data . 
	Poste 4=Application  . . 
	Poste 5=Group  . . . . . 
	Poste 6=Location . . . .

	Avec TYPE=REPLACE, toutes les extractions sont concaténées 
	         COPY$ SCREEN-TO-VARIABLE,SCREEN=(18,19,16,06),VAR='LISTE',    X
	               TYPE=REPLACE
	         ERROR$ 0,'Poste 1=','*LISTE'
	         POP$ VAR='LISTE'
	         ERROR$ 0,'Poste 2=','*LISTE'
	         POP$ VAR='LISTE'
	         ERROR$ 0,'Poste 3=','*LISTE'
	         POP$ VAR='LISTE'
	         ERROR$ 0,'Poste 4=','*LISTE'
	         POP$ VAR='LISTE'
	         ERROR$ 0,'Poste 5=','*LISTE'
	         POP$ VAR='LISTE'
	         ERROR$ 0,'Poste 6=','*LISTE'
	         POP$ VAR='LISTE'
	         DEBUG$ SNAP
	         GOTO$ THEEND
	Résultat 
	               Poste 1=User . . . . . .Password . . . .Secondary Data .Application  . .Group  . . . . .Location . . . .   
	Poste 2=                                                                                                   
	Poste 3=                                                                                                   
	Poste 4=                                                                                                   
	Poste 5=                                                                                                   
	Poste 6=                                    

	==>
	Change copy$ to first, internally, do a POP$ ALL on the variable if copying a column with type=rep


5248 CASE$ CURRENT-SCREEN-POSITION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Jean-Noel Clement needs enhancement to Virtel Scenario language complete the Air France project.
	In particular, he would want facilities to process each field in the columns of a 3270 screen without hardcoding each line of the column.

	This modification introduces such a facility by allowing to SET$ a SCREEN-POSITION, advancing the SCREEN-POSITION, CASE$ for a SCREEN-POSITION and COPY$ to/from a SCREEN-POSITION.

	for instance:

		- setting a screen position (with hh the number of lines in the column):

	               SET$  SCREEN-POSITION,(lig,col,len,hh)  
	     
		- advancing the position to next line:

	               SET$  SCREEN-POSITION,TO-NEXT-LINE              

		- if the next line is after the end of the current screen rectangle, it wraps to its begining, and this condition may be tested with:

	               IF$ NOT-FOUND,THEN=...

		- CASE$ which works with current screen position:

	               CASE$ CURRENT-SCREEN-POSITION,(EQ,'XXXX',ET1),...  

		- CASE$ which works with current screen line (or column or length) (equal sign) and hard coded column and length:

	               CASE$ (=,COL,LEN),(EQ,'XXXX',ET1),...   

		- COPY$ which works with current screen line (or column or length) (equal sign):
	           
	               COPY$ VARIABLE-TO-SCREEN,VAR='VAR1',SCREEN=(=,col,len)   


5249 MAP$ JSON support
^^^^^^^^^^^^^^^^^^^^^^

	Support for JSON input.

	Similarly to the following MAP$ statement which allowed copying XML or QUERY data into a commarea,  

	COMMAREA MAP$    FROM-VARIABLE,XML,VAR='MYINPUT'   default 
	COMMAREA MAP$    FROM-VARIABLE,QUERY,VAR='MYINPUT'         

	it is now possible to have JSON data as input:

	COMMAREA MAP$    FROM-VARIABLE,JSON,VAR='MYINPUT'          

	or 

	COMMAREA MAP$    FROM-INPUT,JSON      input is in json format

	or 

	COMMAREA MAP$    FROM-INPUT,JSON,FIELD='MYINPUT' 

	-----------------------
	jeu. mai-28-2015  12:59

	5249A corrects 5249

	2 problems encountered by Jean-Noel when using:

	JSONAF1  MAP$  FROM-INPUT,JSON
	JSONAF1  MAP$  TO-VARIABLE,VAR='MYCRBO00'
	JSONAF1  TOVAR$  FROM-VARIABLE,VAR='MYCRBO00'  

	1:	'[' and ']' where wrongly translated when using FROM-INPUT,JSON without FIELD= parameter.
	2:	TOVAR$ was not fully processing an the OCCURS= statement
	-----------------------
	ven. mai-29-2015  17:47

5263 allow embedded OCCURS=UNLIMITED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	From:    Jean-Noël CLEMENT <jean-noel.clement@syspertec.com>
	Date:    Wednesday, June 10, 2015, 11:13:08 AM
	 
	OCCURS=UNLIMITED ne récupère que le premier item (par contre OCCURS=nn fonctionne correctement)
	 
	JSONAF1  MAP$  BEGIN
	          MAP$  AREA,WITH='inAFR',LENGTH=30
	          MAP$  AREA,WITH='inICT',LENGTH=30
	*
	INSUBFS   MAP$  BEGIN,WITH='friends'
	INSUBF     MAP$ BEGIN,WITH=NEXT-ELEMENT,OCCURS=UNLIMITED,COUNT='count'
	            MAP$  AREA,WITH='inRRN',LENGTH=17
	            MAP$  AREA,WITH='inQtyT10',LENGTH=10,TYPE=9
	INSUBF     MAP$ END
	INSUBFS   MAP$  END
	*
	JSONAF1  MAP$    END
	*
	JSONAF1  MAP$  FROM-INPUT,JSON
	JSONAF1  MAP$  TO-VARIABLE,VAR='MYCRBO00'
	         ERROR$ 0,'COMMAREA=[','*MYCRBO00',']'
	         ERROR$ 0,'COUNT=','*count'
	         ERROR$ 0,'POSTE=[','*inRRN',']'
	         
	         DEBUG$ NOTRACE,TERMINAL
	         DEBUG$ SNAP
	         SET$ PAGE,'commarea.txt'
	DECODE   EQU   *
	         ERROR$ 0,'DECODE'
	         IF$ NOT-EXISTS-VARIABLE,'inRRN',THEN=THEEND
	         ERROR$ 0,'inRNN=','*inRRN'
	         POP$ FIRST-VALUE-OF,VAR='inRNN'
	         GOTO$ DECODE


	Résultat =  
	COMMAREA=[Livingston                    Owen                          B00000000000000000000042901]
	COUNT=1                     
	POSTE=[]                    
	DECODE                      
	INPUT END                   

	alors qu’il y a dix items en entrée                                     

	-->
	OCCURS=UNLIMITED  ne fonctionnait que sur le premier BEGIN.


5270 MAP$ FROM-INPUT TO-VARIABLES
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	One can now add a new positional parameter to the various FROM-INPUT forms of the MAP$ instruction.
	This allows to convert, for instance, XML or JSON input directly to variables, without intermediate usage of a commarea.

	For instance, specifying:

	JSONAF1  MAP$  FROM-INPUT,JSON,TO-VARIABLES,FIELD='MYINPUT'      generate variables

	will convert the JSON input to variables directly, with the names specified in the JSONAF1 MAP$.

	Previously, it was possible to generate the same variables, but 3 statements were required:

	JSONAF1  MAP$  FROM-INPUT,JSON,FIELD='MYINPUT' 	generate commarea        
	JSONAF1  MAP$  TO-VARIABLE,VAR='MYCRBO00'	copy commarea to variable
	JSONAF1  TOVAR$  FROM-VARIABLE,VAR='MYCRBO00'  	generate variables

	NOTE: this new form of the instruction also permits to remove the restriction that an OCCURS=UNLIMITED should be at the end of a description.
	 

	------------------------
	jeu. juin-25-2015  13:47

	5270A conflict with an old, not recompiled scenario


	=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=
	From:    Ed HOLT <ed.holt@syspertec.com>
	Date:    Thursday, June 25, 2015, 9:52:23 AM
	Subject: Scenario abends using VIRTEL5

	My scenario abends when using VIRTEL5 loadlib. This causes my 3270 application to abend S0C7. 

	VIRS129E EHVTA015 ERROR: SCENARIO V3270SCN ABENDED AT OFFSET '000004B0'
	        ON INSTRUCTION STARTING WITH '0018C3F3'                         
	        INPUT SCENARIO IS DISCARDED                                     
	                                                                                  

	-->
	the scenario was not recompiled with the new MAP$ macro cause Virtel to misinterpret a 

	 	MAP$  FROM-VARIABLE,VAR='MYINPUT'  
	to a
		MAP$  FROM-VARIABLE,TO-VARIABLES,VAR='MYINPUT'
	the abend is a consequence of this.

	==>
	correct Virtel to NOT force a recompile of old scenarios.

	------------------------
	mar. juin-30-2015  10:50

	5270B completes/corrects 5270A


	-------------------------
	mer. juil.-01-2015  20:07

	5270C assembly error due to missing quote in MAP$


	                                     39 INPUT    MAP$ BEGIN,WITH='CVirtelOperationINPUT'                       
	** ASMA063E No ending apostrophe - MACRO - MAP$                                                                
	** ASMA435I Record 875 in SP000.SPTHOLT.SCRNAPI.MACLIB(MAP$) on volume: SPT30A                                 

	-->
	quote erased by sequence number


5276 MAP$ FROM-INPUT restart
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Allow reexecution of a MAP$ FROM-INPUT

	For instance, in the following scenario, the two 'MAP$  FROM-INPUT' will produce the same output.



	JSON1    SCREENS APPL=JSON1
	*                                   
	         SCENARIO INITIAL
	*
	         SET$  ENCODING,UTF-8,'IBM1147'  
	JSONAF1  MAP$  BEGIN
	          MAP$  AREA,WITH='inAFR',LENGTH=30
	          MAP$  AREA,WITH='inICT',LENGTH=30
	*
	INSUBFS   MAP$  BEGIN,WITH='friends'
	INSUBF     MAP$ BEGIN,WITH=NEXT-ELEMENT,OCCURS=UNLIMITED
	            MAP$  AREA,WITH='inRRN',LENGTH=17
	            MAP$  AREA,WITH='inQtyT10',LENGTH=10,TYPE=9
	INSUBF     MAP$ END
	INSUBFS   MAP$  END
	*
	JSONAF1  MAP$    END
	*
	JSONAF1  MAP$  FROM-INPUT,JSON,TO-VARIABLES,FIELD='MYINPUT'
	         ERROR$ 0,'COUNT=','*INSUBF'
	         DEBUG$ SNAP,TERMINAL
	         PERFORM$ DECODE
	*         
	JSONAF1  MAP$  FROM-INPUT,JSON,TO-VARIABLES,FIELD='MYINPUT'
	         ERROR$ 0,'COUNT=','*INSUBF'
	         DEBUG$ SNAP,TERMINAL
	         PERFORM$ DECODE
	* 
	         SCENARIO END 
	*
	DECODE   SCENARIO SUBROUTINE
	DECODELOOP LABEL$
	         IF$ NOT-EXISTS-VARIABLE,'inRRN',THEN=THEEND
	         ERROR$ 0,'inRRN=','*inRRN'
	         ERROR$ 0,'inQtyT10=','*inQtyT10'
	         POP$ FIRST-VALUE-OF,VAR='inRRN'
	         POP$ FIRST-VALUE-OF,VAR='inQtyT10'
	         GOTO$ DECODELOOP         
	THEEND   LABEL$         
	         SCENARIO END 
	*
	         SCRNEND      
	         END    ,  

	5276 MAP$ FROM-INPUT restart

		Allow reexecution of a MAP$ FROM-INPUT

		For instance, in the following scenario, the two 'MAP$  FROM-INPUT' will produce the same output.



		JSON1    SCREENS APPL=JSON1
		*                                   
		         SCENARIO INITIAL
		*
		         SET$  ENCODING,UTF-8,'IBM1147'  
		JSONAF1  MAP$  BEGIN
		          MAP$  AREA,WITH='inAFR',LENGTH=30
		          MAP$  AREA,WITH='inICT',LENGTH=30
		*
		INSUBFS   MAP$  BEGIN,WITH='friends'
		INSUBF     MAP$ BEGIN,WITH=NEXT-ELEMENT,OCCURS=UNLIMITED
		            MAP$  AREA,WITH='inRRN',LENGTH=17
		            MAP$  AREA,WITH='inQtyT10',LENGTH=10,TYPE=9
		INSUBF     MAP$ END
		INSUBFS   MAP$  END
		*
		JSONAF1  MAP$    END
		*
		JSONAF1  MAP$  FROM-INPUT,JSON,TO-VARIABLES,FIELD='MYINPUT'
		         ERROR$ 0,'COUNT=','*INSUBF'
		         DEBUG$ SNAP,TERMINAL
		         PERFORM$ DECODE
		*         
		JSONAF1  MAP$  FROM-INPUT,JSON,TO-VARIABLES,FIELD='MYINPUT'
		         ERROR$ 0,'COUNT=','*INSUBF'
		         DEBUG$ SNAP,TERMINAL
		         PERFORM$ DECODE
		* 
		         SCENARIO END 
		*
		DECODE   SCENARIO SUBROUTINE
		DECODELOOP LABEL$
		         IF$ NOT-EXISTS-VARIABLE,'inRRN',THEN=THEEND
		         ERROR$ 0,'inRRN=','*inRRN'
		         ERROR$ 0,'inQtyT10=','*inQtyT10'
		         POP$ FIRST-VALUE-OF,VAR='inRRN'
		         POP$ FIRST-VALUE-OF,VAR='inQtyT10'
		         GOTO$ DECODELOOP         
		THEEND   LABEL$         
		         SCENARIO END 
		*
		         SCRNEND      
		         END    ,  


5277 CASE$ RTRIM and LTRIM / EMPTY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Two new optional parameters for the CASE$ instruction, RTRIM= and LTRIM=, to allow removing one or more characters from the various operands of the CASE$ instruction before the comparisons are done.

	Also, a new CASE$ condition EMPTY is added to allow testing whether a variable or a part of the screen is empty. The condition empty can be tested after the variable or screen has been trimmed.


	examples:

	         CASE$ 'MYVAR',                                                *
	               (EMPTY,L2),                                             *
	               (CONTAINS,'*Val',L1)                                    *
	               RTRIM=('_',' '),                                        *
	               LTRIM=('_',' '),                                        *
	               ELSE=other
	*         
	         CASE$ (1,1,80),                                               *
	               (CONTAINS,'Val',L1),RTRIM=('_',' ')                

	NOTE 1 : CASE$ do not change the contents of the variables or parts of the screen being compared.
	NOTE 2 : if the variable being tested does not exist, (eg 'MYVAR' does not exist), it is not considered empty. Rather, the CASE$ branches at the ELSE= label.


	-------------------------
	jeu. juil.-02-2015  12:47

	5277A TRIM variable args, but not fixed ones.  

	LTRIM and RTRIM will trim both the value being tested (variable or part of the screen) and the variable arguments, but not the fixed arguments.

	e.g.:

	  (EQ,'*VAR1',label1) 	-> the value of the VAR1 variable will be trimmed before comparison

	  (EQ,'zagreb ',label2)	-> the value of the string 'zagreb ' will NOT be trimmed, but kept as is for comparison


5279 COPY$ RTRIM and LTRIM
^^^^^^^^^^^^^^^^^^^^^^^^^^ 

	Two new optional parameters for the COPY$ LIST-TO-VARIABLE instruction, RTRIM= and LTRIM=, to allow removing one or more characters from the various variable operands of the COPY$ instruction before the copys are done.




	examples:

	         COPY$ LIST-TO-VARIABLE,VAR='VAR1',                                  * 
	               RTRIM=('_',' '),LTRIM=('_',' '),                              *        
	               LIST=('string1','*var1',VARIABLE,'var2')                                        

		the variable VAR1 is created/modified, with 'string1' copied as is, var1 and var2 left and right trimmed. 


5280 Indirection on OUTPUT-FILE-TO-VARIABLE FILE=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


	Allows specifying the filename with an initial asterisk to mean that the request filename is in a variable.

	eg:

	 COPY$ OUTPUT-FILE-TO-VARIABLE,FILE='*MYFILE',VAR='MYRESULT'     


5281 COPY$ VARIABLE-TO-VARIABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	::

	       COPY$ VARIABLE-TO-VARIABLE,VAR=('VAR1','VAR2'),OFFSET=8,LENGTH=5,PAD=' '   

	Copies a source variable to a target variable.
	VAR= must specifies two variable names, the first being the source, the second the target.
	 
	TYPE=REP may be specified to mean the target variable should be replaced. Otherwise the new value is appended the the target variable.

	OFFSET= is the number of characters to skip in string, defaulting to 0.

	LENGTH= is how many characters to take, defaulting to the remainder of the string from start. If length
	is longer than the string, padding occurs with the PAD= character, which defaults to the blank.


5291 COPY$ CURRENT-LINE
^^^^^^^^^^^^^^^^^^^^^^^

	This update complements 5248 CASE$ CURRENT-SCREEN-POSITION, ... 

	It allows copying the current values of the ifeld in the SCREEN-POSITION to a variable.
	The length of the returned value may be specified with the LENGTH= parameter.

	examples:

	         SET$  SCREEN-POSITION,(10,20,5,15)
	         SET$  SCREEN-POSITION,TO-NEXT-LINE          

	         COPY$ SYSTEM-TO-VARIABLE,VAR='L1',LENGTH=2,                   *
	               FIELD=(VALUE-OF,CURRENT-LINE)
	         COPY$ SYSTEM-TO-VARIABLE,VAR='C1',LENGTH=2,                   *
	               FIELD=(VALUE-OF,CURRENT-COLUMN)
	         COPY$ SYSTEM-TO-VARIABLE,VAR='L2',                            *
	               FIELD=(VALUE-OF,CURRENT-LENGTH)
	         COPY$ SYSTEM-TO-VARIABLE,VAR='H1',                            *
	               FIELD=(VALUE-OF,CURRENT-HEIGHT) 


5340 APPLICATION-OPTION
^^^^^^^^^^^^^^^^^^^^^^^

	This update allows specifying {{{ VALUE-OF (APPLICATION-OPTION) }}} in a page 

	and

	COPY$ SYSTEM-TO-VARIABLE,VAR='VAR1',                          x
	               FIELD=(VALUE-OF,APPLICATION-OPTION)

	in a scenario.


	The value of this 'application option' is taken from the current transaction definition, in the Option field next to the Application field.
	The maximum length is 32 bytes. The value will be trimmed from blanks and binary zeroes on the rigth. It is not uppercased.



	 TRANSACTION DETAIL DEFINITION ---------------------- Applid: SPVIRPX1 18:40:05 
	 
	 Internal name ===> ZLI-10                 To associate with an entry point name
	 External name ===> Cics                   Name displayed on user menu          
	 Description   ===> Logon to CICS                                               
	 Application   ===> DBDCCICS        Option ===> ................................         
	 PassTicket    ===>    Name ===>           0=no 1=yes 2=unsigned                
	 Application type   ===> 1                 1=VTAM 2=VIRTEL 3=SERV 4=PAGE 5=LINE 
	 Pseudo-terminals   ===> ZLVTA             Prefix of name of partner terminals  
	 Logmode            ===>                   Specify when LOGMODE must be changed 
	 How started        ===> 1                 1=menu 2=sub-menu 3=auto             
	 Security           ===> 1                 0=none 1=basic 2=NTLM 3=TLS 4=HTML   
	 H4W commands ?     ===>                   0=no 1=yes 2=if2VIRTEL 4=auto        
	 Logon message      ===>                                                        
	                                                                                
	 TIOA at logon      ===>                                                        
	                                                                                
	 TIOA at logoff     ===>                                                        
	                                                                                
	 Initial Scenario   ===>                   Final Scenario      ===>             
	 Input Scenario     ===>                   Output Scenario     ===>           


5364 SCENARIO FAIL , SCENARIO SUCCESS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Requested by JNC about Air France scenarios:

	Le fonctionnement exact du FAIL (qui permet de récupérer la suite d'un écran 3270 arrivant en plusieurs parties) mériterait d'être mieux documenté.De plus, il ne permet pas au scenario d'écrire un message de trace puisque le scenarion s'interrompt et se remet à l'écoute du host
	         CASE$ 'line1',RTRIM=(' '),(EMPTY,FAIL),ELSE=MSG
	On est alors oblige d'écrire une “verrue” du genre
	               CASE$ 'line1',RTRIM=(' '),(EMPTY,NOMSG),ELSE=MSG
	NOMSG    EQU   *
	               ERROR$ 0,'*scenname',' - Attente msg 1304 par FAIL'
	               CASE$ 'line1',(NE,'XXX',FAIL)

	==>

	Allow two new variants of the SCENARIO instruction:

	      SCENARIO FAIL

	processing stops. The scenario will be restarted (at the same entry point that it just was entered with) at the next message arrival.

	      SCENARIO SUCCESS

	stop scenario processing but continue normal Virtel processing of the current message.


5382 FINAL scenario message
^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Wed Mar-02-2016  09:48

	FINAL scenario fails to load. Following message issued.

	VIRS121W dddddddd ERROR LOADING SCENARIO xxxxxxxx IN TRANSACTION yyy-zz.

	A new message, specific to this error, has been added :-

	VIRS128W dddddddd ERROR LOADING FINAL SCENARIO xxxxxxxx IN TRANSACTION
	yyy-zz                                                                

	Module: VIR0S12
	Meaning: A load error occurred attempting to load a FINAL scenario.
	Action: Loading a FINAL only scenario can lead to unpredictable results , for example read errors. To prevent this include the 
	FINAL scenario with a related INITIAL scenario and set the transaction TIOA fields accordingly. This will ensure that the scenario
	is load during initialisation. 

	See below for example.

	SCENINIT SCREENS APPL=SCENINIT,EXEC=NO
	         SCENARIO INITIAL      
	         SCENARIO END 
	         SCENARIO FINAL                                                
	         ERROR$ 0,'Final Scenario Entered'                                                                             
	         SCENARIO END  
	         SCRNEND  
	         END    ,   


5393 FOREACH$
^^^^^^^^^^^^^

	Allows a FOR EACH loop in scenarios thru two new instructions: FOREACH$ and ENDFOR$.

	eg:

	* loop on a variable:
	* loop to print all values of a variable:

	LOOP1    FOREACH$ VALUE-IN-VARIABLE,VAR='TOTO'  

	         CASE$ CURRENT-FOREACH-VARIABLE-OF,LOOP1,(EQ,'XXXX',ET1)   

	         COPY$ SYSTEM-TO-VARIABLE,VAR='I1',LENGTH=2,                   *
	               FIELD=(VALUE-OF,CURRENT-FOREACH-INDEX),TYPE=REPLACE
	         COPY$ SYSTEM-TO-VARIABLE,VAR='V1',                            *
	               FIELD=(VALUE-OF,CURRENT-FOREACH-VARIABLE),TYPE=REPLACE
	         ERROR$ 0,'TOTO: ','*I1','==','*V1'
	         ENDFOR$ LOOP1                  

	*
	* loop to print the screen:

	LOOP2    FOREACH$ VALUE-IN-SCREEN,SCREEN=(1,1,80,24)
	         COPY$ SCREEN-TO-VARIABLE,SCREEN=(=,01,80),VAR='screenL',      X
	               TYPE=REPLACE
	         COPY$ SYSTEM-TO-VARIABLE,VAR='L1',LENGTH=2,                   *
	               FIELD=(VALUE-OF,CURRENT-LINE),TYPE=REPLACE
	         ERROR$ 0,'line ','*L1','==','*screenL'
	         ENDFOR$ LOOP2                  


	NOTES:
		- yellow colour above are new statements
		- FOREACH$ must have a label, and this label must match the ENDFOR$ parameter.
		- FOREACH$ VALUE-IN-SCREEN updates CURRENT-SCREEN-POSITION ( '=' sign in COPY$ and CASE$)
		- 


	------------------------
	jeu. avr.-28-2016  18:21

	5393A CASE$ CURRENT-FOREACH-VARIABLE-OF was not working

	==>
	correct typo


5395 OPTION-DEFAULT-COMPATIBILITY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	This complements 5340 APPLICATION-OPTION by allowing the automatic setting of 'compatibility' as the default APPLICATION-OPTION.



	exemples:

	setting a default local to the page:

	{{{ SET-LOCAL-OPTIONS (OPTION-DEFAULT-COMPATIBILITY) }}} 



	unsetting the default:

	{{{ UNSET-LOCAL-OPTIONS (OPTION-DEFAULT-COMPATIBILITY) }}}


	setting a global default:

	HTSET1=(OPTION-DEFAULT-COMPATIBILITY),   (one can also use HTSET2 HTSET3 or HTSET4 parameters of the VIRTCT)


	==>

	When this option is set then {{{ VALUE-OF (APPLICATION-OPTION) }}} will return 'compatibility' (without quotes) whenever the active transaction application option starts with a blank.


5397 COPY$ in FOREACH$
^^^^^^^^^^^^^^^^^^^^^^

	Follows 5393 FOREACH$ : add two COPY$ variants to allow refereing to the variable of a FOREACH$.


	In the example below, the value of VAR1 which is copied is the current value in the FOREACH$ loop.



	LOOP1    FOREACH$ VALUE-IN-VARIABLE,VAR='VAR1'
	       
	         COPY$ VARIABLE-TO-SCREEN,VAR='VAR1',FOREACH=LOOP1,            *            
	               SCREEN=(=,=,=)
	       
	         COPY$ VARIABLE-TO-VARIABLE,VAR=('VAR1','VAR2'),FOREACH=LOOP1, * 
	               OFFSET=8,LENGTH=5,PAD=' '                  

	       
	         ENDFOR$ LOOP1 



Miscellaneous:
--------------

5251 New toolbar button to toggle the 3278T mode on/off.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	 * The 3278T button is hidden by default, and can be shown by selecting the right option in the user settings dialog.
	 * The '§' character has also been removed from the list of escaped character. 

	This was requested by W&W because with the 1141 charset, § can be encoded both as $7C (normal) and $DC (graphic). We have no way to preserve the original  encoding when editing an existing line, and W&W favors $7C over $DC.
	Updated the CSS to have the language toolbar button displayed using the style of the other toolbar buttons


5253 Add UNLOAD command to unload ARBO.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	After the introduction of VSAM LSR in VIRTEL the VIRCONF program fails to open the ARBO ACB when VIRTEL is running. This didn't happen before. To compensate
	for this an UNLOAD command has been added to VIRTEL which performs a ARBO UNLOAD.


	usage:

	F virtel,unload
	 
	This command invokes the VIRCONF program which unloads the ARBO file. The following DD statement must be added to the Virtel procedure:-
	 
	//SYSPUNCH DD  DSN=SP000.VIRTELxx.VIRCONF.SYSIN,DISP=(,CATLG),   
	//             UNIT=SYSDA,VOL=SER=SPT308,SPACE=(TRK,(5,1)),
	//             DCB=(RECFM=FB,LRECL=80,BLKSIZE=6080)


	or alternatively:

	//SYSPUNCH DD SYSOUT=B


5295 Diagnostic Memory display feature
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	The Memory display feature is a memory diagnostic tool created to trap invalid memory free requests. Such request can lead to
	ABEND0C4s. Virtel memory requests (PRENDRE and RENDRE) are tracked in a diagnostic storage area located above the bar.
	The area is 1MB in size and can contain 65536 active storage requests. An active storage request is a getmain'd pending a 
	freemain (RENDRE). The feature is supported by the following command:-

	F VIRTEL,MEMDISPLAY

	This produces a break down of the VIRTEL subpools:-

	F SPTHOLTV,MEMDISPLAY
	                                  
	VIR0200I MEMDISPLAY                                    
	VIR0271I DISPLAY     763                               
	SP1=00024478 SP2=00000CCC SP3=00090DE0 SP4=000027E4    
	    00910091     00030009     02430294     00090011    
	SP5=00029293 SP6=0004DCF4 SP7=00000000 SP8=00000000    
	    00A404C7     01370137     00000000     00000002    
	POOL CONTROL BLOCK. SUBPOOL=1                          
	PAG=00108000 NFQ=00108008 #FQ=00000001 FRE=0000B2A0    
	PAG=000F8000 NFQ=000F8008 #FQ=00000001 FRE=00000080    
	PAG=000E8000 NFQ=000E8008 #FQ=00000001 FRE=00000078    
	POOL CONTROL BLOCK. SUBPOOL=2                          
	PAG=1EC14000 NFQ=1EC14008 #FQ=00000004 FRE=0000F2F0    
	POOL CONTROL BLOCK. SUBPOOL=3                          
	PAG=1ECC4000 NFQ=1ECC4008 #FQ=00000002 FRE=00006408    
	PAG=1ED54000 NFQ=1ED54008 #FQ=00000002 FRE=00001750    
	PAG=1EC74000 NFQ=1EC74008 #FQ=00000001 FRE=00000878    
	PAG=1ED04000 NFQ=1ED04008 #FQ=00000001 FRE=00000878    
	PAG=1ED94000 NFQ=1ED94008 #FQ=00000002 FRE=00002768    
	PAG=1ECF4000 NFQ=1ECF4008 #FQ=00000002 FRE=000017F0    
	PAG=1EE04000 NFQ=1EE04008 #FQ=00000001 FRE=00000878    
	PAG=1ED74000 NFQ=1ED74008 #FQ=00000001 FRE=00000878    
	PAG=1ECE4000 NFQ=1ECE4008 #FQ=00000001 FRE=00000878    
	PAG=1EC64000 NFQ=1EC64008 #FQ=00000001 FRE=00000878    
	POOL CONTROL BLOCK. SUBPOOL=4                          
	PAG=1EC04000 NFQ=1EC04008 #FQ=00000003 FRE=0000D750    
	POOL CONTROL BLOCK. SUBPOOL=5                          
	PAG=1ED24000 NFQ=1ED24008 #FQ=00000001 FRE=0000A1D8    
	PAG=1ED14000 NFQ=1ED14008 #FQ=00000001 FRE=000043B8    
	PAG=1EC54000 NFQ=1EC54008 #FQ=00000001 FRE=000043B8    
	PAG=1EBB4000 NFQ=1EBB4008 #FQ=00000001 FRE=000043B8    
	POOL CONTROL BLOCK. SUBPOOL=6                          
	PAG=1EBF4000 NFQ=1EBF4008 #FQ=00000003 FRE=00000D40    
	PAG=1EBE4000 NFQ=1EBE4008 #FQ=00000001 FRE=00000088    
	PAG=1EBD4000 NFQ=1EBD4008 #FQ=00000001 FRE=000000B8    
	PAG=1EBC4000 NFQ=1EBC4008 #FQ=00000001 FRE=000000D0    
	PAG=1EBA4000 NFQ=1EBA4008 #FQ=00000001 FRE=00000108    
	POOL CONTROL BLOCK. SUBPOOL=7                          
	PAG=00000000 NFQ=00000000 #FQ=00000000 FRE=00000000    
	POOL CONTROL BLOCK. SUBPOOL=8                          
	PAG=00000000 NFQ=00000000 #FQ=00000000 FRE=00000000    
	ALLOC=0001213K, FREE=0000314K, TOTAL=0001536K          
	VIR0272I END   

	Enablement/Dis-enablement
	The memory diagnostic tool is only activated through the following TCT paramerter

	MEMORY=(ABOVE,MEMHST),

	The memory diagnostic tool can be deactivated by the following command:-

	F VIRTEL,MEMDISPLAY,DISABLE

	Operation
	With the memory diagnostic tool active the following command be used to summarize the VIRTEL subpool active allocated memory:-

	F VIRTEL,MEMDISPLAY

	The following will be displayed:-

	F SPTHOLTV,MEMDISPLAY                                 
	VIR0200I MEMDISPLAY                                   
	VIR0271I DISPLAY     978                              
	SP1=00024478 SP2=00001044 SP3=0008E35F SP4=00002F61   
	    00910091     00040009     02380294     000B0011   
	SP5=000317DC SP6=0004DF73 SP7=00000000 SP8=00000220   
	    00C504C7     01370137     00000000     00000002   
	POOL CONTROL BLOCK. SUBPOOL=1                         
	PAG=00109000 NFQ=00109008 #FQ=00000001 FRE=0000B2A0   
	PAG=000F9000 NFQ=000F9008 #FQ=00000001 FRE=00000080   
	PAG=000E9000 NFQ=000E9008 #FQ=00000001 FRE=00000078   
	POOL CONTROL BLOCK. SUBPOOL=2                         
	PAG=1EC14000 NFQ=1EC14008 #FQ=00000005 FRE=0000EF68   
	POOL CONTROL BLOCK. SUBPOOL=3                         
	PAG=1ECD4000 NFQ=1ECD4008 #FQ=00000002 FRE=00009DF8   
	PAG=1ED54000 NFQ=1ED54008 #FQ=00000002 FRE=00001750   
	PAG=1EC84000 NFQ=1EC84008 #FQ=00000001 FRE=00000878   
	PAG=1ED04000 NFQ=1ED04008 #FQ=00000001 FRE=00000878   
	PAG=1ED94000 NFQ=1ED94008 #FQ=00000002 FRE=00002768   
	PAG=1ECF4000 NFQ=1ECF4008 #FQ=00000001 FRE=00000878   
	PAG=1EE04000 NFQ=1EE04008 #FQ=00000001 FRE=00000878   
	PAG=1ED74000 NFQ=1ED74008 #FQ=00000001 FRE=00000878   
	PAG=1ECE4000 NFQ=1ECE4008 #FQ=00000001 FRE=00000878   
	PAG=1EC64000 NFQ=1EC64008 #FQ=00000001 FRE=00000878   
	POOL CONTROL BLOCK. SUBPOOL=4                         
	PAG=1EC04000 NFQ=1EC04008 #FQ=00000004 FRE=0000CFA0   
	POOL CONTROL BLOCK. SUBPOOL=5                         
	PAG=1ECA4000 NFQ=1ECA4008 #FQ=00000002 FRE=0000D870   
	PAG=1ED14000 NFQ=1ED14008 #FQ=00000001 FRE=000043B8   
	PAG=1ED24000 NFQ=1ED24008 #FQ=00000001 FRE=000043B8   
	PAG=1EC74000 NFQ=1EC74008 #FQ=00000001 FRE=0000A1D8   
	PAG=1EC54000 NFQ=1EC54008 #FQ=00000001 FRE=0000A1D8   
	PAG=1EBB4000 NFQ=1EBB4008 #FQ=00000001 FRE=000043B8   
	POOL CONTROL BLOCK. SUBPOOL=6                         
	PAG=1EBF4000 NFQ=1EBF4008 #FQ=00000002 FRE=00000A50   
	PAG=1EBE4000 NFQ=1EBE4008 #FQ=00000001 FRE=00000088   
	PAG=1EBD4000 NFQ=1EBD4008 #FQ=00000001 FRE=000000B8   
	PAG=1EBC4000 NFQ=1EBC4008 #FQ=00000001 FRE=000000D0   
	PAG=1EBA4000 NFQ=1EBA4008 #FQ=00000001 FRE=00000108   
	POOL CONTROL BLOCK. SUBPOOL=7                         
	PAG=00000000 NFQ=00000000 #FQ=00000000 FRE=00000000   
	POOL CONTROL BLOCK. SUBPOOL=8                         
	PAG=1ECB4000 NFQ=1ECB4008 #FQ=00000001 FRE=0000FDB0   
	ALLOC=0001240K, FREE=0000479K, TOTAL=0001728K         
	VIR0272I END                                          

	The displace rsponse is split into a summary section for each subpool and the a detailed allocated page block and free queue element
	display for each subpool.

	In the sumary display, each subpool has two displayed values. The top value is the amount of storage currently allocated and the value below
	represents the current allocation in 1K chunks and a peak allocation in 1K chunks. So for SP5 we can see that there is an allocated value of
	317DC bytes, represented by 00C5 in 1K chunks, and a peak value of  04C7 in 1K chunks.  

	At the bottom of the display is a line which provide allocated, free and total values. 

	Documentation

	Messages

	VIRT0085I INVALID MEMORY FREE REQUEST. ADDR=aaaaaaaa,  SUBPOOL=ss, CALLER=aaaaaaaa'
	Module	: VIR0000

	Meaning :
	The Virtel memory request is invalid because:-
	The subpool is invalid.
	The address to be freed is outside the assciated subpool pages.
	The address to be freed is not found in the DSA table.

	Action :	Virtel contines but you should contact technical support. Schedule a restart of Virtel.     

	   
	VIRT0086E GETMAIN FAILED. MEMORY DSA DISABLED.
	Module	:VIR0000

	Meaning:
	Virtel was ubale to GETMAIN storage "above the bar" for the DSA table.   

	Action:	Increase MEMLIMIT= in the JCL to provide more "above the bar" storage. Virtel contines but you should contact support support
	if the problem continues. Suggest a default of MEMLIMIT=2G.


	VIRT0087E FATAL DSA TABEL ERROR
	Module	:VIR0000

	Meaning:
	The DSA memory table has been corrupted or has been invalidated. Memory diagnostics disabled.

	Action:	Virtel contines but you should contact support support. Schedule a restart of Virtel.


	VIRT0088E DSA TABLE FULL. MEMORY DIAGS. DISABLED
	Module	:VIR0000

	Meaning:
	The DSA memory table is full and cannot store further entries. Memory diagnostics disabled.

	Action:	Virtel contines but you should contact support support. Schedule a restart of Virtel.
	                                   

	Installation

	MEMORY parameter

	MEMORY=(BELOW/ABOVE(DEBUG | MEMHST | ALLOW64BITS)

	MEMORY=(ABOVE,MEMHST) turns on the Virtel memory diagnostic tool. This should only be implemented
	when advised to do so by Technical Support. Performance degredation might occur due to the additional monitoring
	services. This will depend on VIRTEL demand. 

	Example:-

	MEMORY=(ABOVE,MEMHST,ALLOW64BITS)		Use Virtel memory management with memory diagnostic tool and above the bar storarge.

5325 Modifies Virtel (4.53 and up) so that the customers USSTAB MSG10 buffer can be displayed by Virtel.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

5327 Fix problems with System Logger interface.
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	VIR0002A erroneously terminates after connecting to Systems Logger Structure.

	Default stream name and structure name can now be overridden in TCT with following parameters:-

	LOGX=(structure_name,stream_name)

	Defaults are : 	Stream name = LOGGER.VIRTEL
			Structure name = VIRTEL_LOG.1

	Documentation Changes

	VIR0239I 		LOGGER: command STRNAM='structure name' FULL. Structure offloaded.
	Module		VIR0002A
	Meaning		Virtel has offloaded the Logger structure.
	Action		None


	VIR0240W 	LOGGER: command STRNAM='structure name' FULL. RC=return code, RS=reason code
	Module		VIR0002A
	Meaning		An error has occured in processing a logstream request. Logger functions will be disable
			and Virtel will default to CONSOLE mode of operations.
	Action		Contact technical support

5330 Implement the SNAPMSG enhancement
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	This allows a SNAP or DUMP to be taken whenever a particuler message number is issued. The command always enables an additional search field to be specified. The command can be defined within the TCT using
	the SNAPMSG= keyword. 

	Command format
	F VIRTEL,SNAPMSG=msgno[,search],[S|A]
	Default search is none  
	Default action is SNAP

	TCT keyword
	SNAPMSG=(msgno,search,action)                                   
	                                                         
	Constraints                                             
	All msgno are 8 characters               
	Search field has amaximum of 10 Characters. Anything beyond this will be ignored.
	Actions: S = SNAP or A = ABEND.
	Virtel will abend with a U0999 abend code, reason code 15 if the ABEND action is used.

	Messages
	'VIR0262W SNAPMSG TRIGGERED - VIRTEL ABENDED | SNAP TAKEN',
	Module		: VIR0002
	Meaning		: A message has been trapped by the SNAPMSG function. Action taken will be either a SNAP dump or an ABEND of VirteL.
			  Action is determined by TCT parameters or the action set in the SNAPMSG= command.

	Examples:

	TCT: 
	SNAPMSG=(VIR2102W,USSTAB,S),         			Snap message VIR2102W with search field USSTAB

	Command:
	F VIRTEL,SNAPMSG=VIR2102W,USSX,A			Abend VIRTEL fi message VIR2102W is caught with search field USSX

	Response: 
	15.35.51 JOB05133  VIR0200I SNAPMSG=VIR2102W,USSX,A                                                                     
	15.35.58 JOB05133  VIRHT51I HTTP-CLI CONNECTING CLVTA078 TO 192.168.092.061:49878                                       
	15.35.58 JOB05133  VIR2102W UNABLE TO LOAD THE TRANSACTION USSTAB USSX    . DEFAULT USSTAB USSVIRT WILL BE USED.        
	15.35.58 JOB05133  VIR0055W SNAPMSG TRIGGERED - VIRTEL ABENDED                                                          
	15.35.58 JOB05133  VIR0700W ERROR IN TASK MAIN PSW= 078C1000 800E54FE                                                   
	15.35.58 JOB05133  VIR0400 DATE=14 Dec 2015  TIME= 15:35:58   TASK=MAIN  ABEND=ASRA  TERM=CLVTA078  APPLICATION=APPLHOLT
	                            VERSION=4.55  MVS                                                                           
	15.35.58 JOB05133  VIR0016W ABEND ASRA TERM=CLVTA078 PROG=         OFFSET=+0000                                         
	15.35.58 JOB05133  VIR0016W PSW = 078C1000 800E54FE 0002000D 00000000                                                   
	15.35.58 JOB05133  VIR0016W R7  = VIR0010  +39C2                                                                        
	15.35.58 JOB05133  VIR0016W R8  = VIR0021W +1000                                                                        
	15.35.58 JOB05133  VIR0016W R10 = VIR0099  +0000                                                                        
	15.35.58 JOB05133  $HASP375 SPTHOLTV ESTIMATE EXCEEDED BY              78,000  LINES                                    
	15.35.58 JOB05133  $HASP375 SPTHOLTV ESTIMATE EXCEEDED BY              84,000  LINES                                    
	15.35.59 JOB05133  $HASP375 SPTHOLTV ESTIMATE EXCEEDED BY              90,000  LINES                                    
	15.35.59 JOB05133  $HASP375 SPTHOLTV ESTIMATE EXCEEDED BY              96,000  LINES                                    
	15.36.00 JOB05133  $HASP375 SPTHOLTV ESTIMATE EXCEEDED BY             102,000  LINES                                    
	15.36.00 JOB05133  $HASP375 SPTHOLTV ESTIMATE EXCEEDED BY             108,000  LINES                                    
	15.36.00 JOB05133  $HASP375 SPTHOLTV ESTIMATE EXCEEDED BY             114,000  LINES                                    
	15.36.01 JOB05133  $HASP375 SPTHOLTV ESTIMATE EXCEEDED BY             120,000  LINES                                    
	15.36.01 JOB05133  $HASP375 SPTHOLTV ESTIMATE EXCEEDED BY             126,000  LINES                                    
	15.36.02 JOB05133  $HASP375 SPTHOLTV ESTIMATE EXCEEDED BY             132,000  LINES                                    
	15.36.02 JOB05133  VIR0038I SNAP COMPLETE                                                                               
	15.36.03 JOB05133  $HASP375 SPTHOLTV ESTIMATE EXCEEDED BY             138,000  LINES                                    
	15.36.04 JOB05133  IEA995I SYMPTOM DUMP OUTPUT  953                                                                     
	   953               USER COMPLETION CODE=0999 REASON CODE=0000000F                                                     
	   953              TIME=15.35.58  SEQ=04869  CPU=0000  ASID=001C                                                       
	   953              PSW AT TIME OF ERROR  078C1000   800E54FE  ILC 2  INTC 0D                                           
	   953                ACTIVE LOAD MODULE           ADDRESS=000E5178  OFFSET=00000386                                    
	   953                NAME=VIR0002A                                                                                     
	   953                DATA AT PSW  000E54F8 - 00181610  0A0D9240  A7A7D208                                              
	   953                GR 0: C4000000   1: C40003E7                                                                      
	   953                   2: 220B987C   3: 1EBF8278                                                                      
	   953                   4: 00035A4B   5: 00035A79                                                                      
	   953                   6: 00000000   7: 1EA8972A                                                                      
	   953                   8: 1EC6DDF0   9: 1EC0B778                                                                      
	   953                   A: 00036100   B: 1EBC4668                                                                      
	   953                   C: 000E5178   D: 0011CCE8                                                                      
	   953                   E: 0000002E   F: 0000000F                                                                      
	   953              END OF SYMPTOM DUMP                                                                                 


5331 Logger Extraction program
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	VIR0002B is a program that can be run to extract the VIRTEL records from the System Logger. The VIRTEL log is wriiten to 
	the system logger when LOG=LOGGER is specified in the TCT. 

	Messages 
	VIR0280I 	Parameter Error
	Module		: VIR0002B
	Meaning		:Invalid parameters in PARM field.
	Action		:Correct PARM field and provide valid parameters.

	VIR0281E 	System Logger Error. xxxxxxxx.  Return Code xx, Reason code nnnn
	Module		: VIR0002B
	Meaning		:Logger service has failed in routine xxxxxxxx
	Action		:Contact technical support.

	VIR0282W 	No records in range specified
	Module		: VIR0002B
	Meaning		:The parameters provided in the PARM field did not select any records from the log.
	Action		:Check that valid parameters have been provided.

	VIR0283W 	The log stream is empty
	Module		: VIR0002B
	Meaning		:The log stream has no Virtel records.
	Action		:None.

	VIR0284W 	Records are not available. xxxxxxxx. Return code xx,  Reason code xxxx
	Module		: VIR0002B
	Meaning		:Logger service failed to extract any records due to an error in routine xxxxxxxx.
	Action		:Correct technical support.

	VIR0285E 	Unable to open DDNAME VIRLOG
	Module		: VIR0002B
	Meaning		:The VIRLOG output DDNAME failed to open.
	Action		:Correct the JCL and rerun the job.


	Details.

	JCL Parms:                                                  
	                (>nnn)                                   
	  COPY   [-------------------]                           
	          (fromdate[,todate])                            
	                                                          
	                (>nnn)                                   
	  DELETE [-------------------]                           
	                (date)                                   
	                                                          
	                                                          
	  Date format = yyyyddd                                   
	                                                          
	  Examples:                                               
	                                                          
	  COPY            	Copy all records                        
	  COPY(>2)        	Copy records older than 2 days          
	  COPY(>0)        	Copy upto yesterday                     
	  DELETE(>2)      	Delete records older than 2 days        
	  COPY(2015047)   	Copy records from 2015.047              
	  COPY(2015047,2015048) 	Copy records from 2015.047        
	                        	thru to 2015.048                  
	  DELETE(2015047) 	Delete records prior to 2015.047        
	                                                          
	  COPY(>0),DELETE(>1)  	Will copy records from the previous
	                       	and earlier, and will then delete  
	                       	from 2 days ago leaving about 24   
	                       	hours of data in the log stream.   
	                                                          
	 SAMPLE JCL:                                              
	 //*                                                      
	 //* DESCRIPTION                                          
	 //*                                                      
	 //LOGGER   PROC P=                                       
	 //S01 EXEC PGM=VIR0002B,PARM='&P'                        
	 //STEPLIB DD DSN=VIRTEL.LOADLIB,DISP=SHR                 
	 //VIRLOG   DD SYSOUT=*,DCB=BLKSIZE=25500                 
	 // PEND                                                  
	 //S01 EXEC LOGGER,P='DELETE(>2)'                         
	                                                          
	                                                          
	 VIRLOG DCB LRECL=255,BLKSIZE=25500,RECFM=VB              

 
5332 JCL Override parameters IP= and CLONE=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 	

	The purpose of this change is to lower the coupling between the TCT, ARBO and any instance of Virtel so that there is less dependency on the parameters defined
	in the ARBO and TCT for any one VIRTEL instance. This change enables JCL parameters to override parameters found in the TCT and ARBO.  

	IP=nnn.nnn.nnn.nnn keyword in JCL PARM

	Currently the IP HOME address used by VIRTEL can be derived from:

	a) Explicity in the LINE definition in the ARBO statements
	b) Default to the IP stack HOME address. The TCP/IP GETHOSTID function is used to obtain this address.

	This change implements the possibility to override option (b) with the ability to specify the IP address as a keyword
	in the JCL PARM field.

	//S01 EXEC PGM=VIR0000,PARM="01,MYAPPL,,192.168.0.123"

	The @HOSTID routine will be modified so that a check is made to see if the user has provided a
	IP= keyword address, if so this will be returned to the @HOSTID caller rather than the GETHOSTID address.

	This reduces the need to specify the HOME address in the ARBO for inbound lines therby reducing the coupling between
	Virtel instance and ARBO structures. Inbound address can just define the port via the :port structure rather than nnn.nnn.nnn.nnn:port. The
	IP= keyword will provide the nnn.nnn.nnn.nnn address structure for a particular instance of Virtel.

	This also allows VIRTEL to utilize a multi TCP/IP stack environment without the need for duplicated ARBO files.

	CLONE=NN keyword in the JCL PARM

	Currently, VIRTEL makes use of the System Symbolic &SYSCLONE to enable substition of the "+" character with the two character symbolic value. This can be used the the TCT APPLID field and 
	the terminal relay name. The purpose is to facilitate the common use of an ARBO file across multiple instances of VIRTEL. This feature, however, only supports one instance of VIRTEL per LPAR.
	When multiple instances are required on any one LPAR the System Symbolic &SYSCLONE and SYSPLUS=YES feature do not provide sufficient uniqeness and consequently multiple ARBO files
	may be required. This feature endeavours to remove that restriction by providing an overide through the use of the CLONE=nn in the JCL parm.

	When specified, the CLONE value will override the IBM system symbolic value and will be used to replace the "plus" character as defined in the APPLID or terminal relay names. 

	JCL example

	//S01 EXEC PGM=VIR0000,PARM='EH,,,192.168.170.30,00'

	This will start Virtel with the TCT called VIRTCTEH, use a default home address of 192.168.170.30 and override and "+" character with the value "00".

	The APPLID=APPLEH+ keyword, as defined in the TCT, will become APPLID=APPLEH00

	The CLONE= value replaces the IBM symbolic value so the SYSCLONE-SYMBOL will now represent this value in scenario statements suchs as:
		 
		VALUE-OF (SYSCLONE-SYMBOL)

		or

		COPY$ SYSTEM-TO-VARIABLE,VAR='VAR1',                          *
	               FIELD=(VALUE-OF,SYSCLONE-SYMBOL)   



	The CLONE= value will also overide any &SYSCLONE symbolic that may be specified in dataset names within the TCT. For example

		STATDSN=(SP000.SPVIREH.SYS&&SYSCLONE..STATA, STATS=MULTI*
		SP000.SPVIREH.SYS&&SYSCLONE..STATB),         STATS=MULTI*

	 as specified in the STATDSN keyword of the TCT will allocate and use datasets SP000.SPVIREH.SYS00.STATA and SP00.SPVIREH.SYS00.STATB.


	New Messages

	VIR0098E INVALID JCL PARM. JOB TERMINATING.

	Module		:VIR0000
	Meaning		:The JCL PARM field is incorrect. Virtel cannot continue.
	Action		: Correct the VIRTEL JCL PARM field. 	 

	VIR0089W HOST IPADDR. OVERRIDDEN FROM PARM WITH IP=nnn.nnn.nnn.nnn

	Module		:VIR0000
	Meaning		:The ARBO didn't specify an IP address for this line. GETHOSTID would have been used but this 
			been overidden by the IP=address specified in the JCL PARM.
	Action		: Virtel will use the IP address in the JCL PARM rather than default to the IP address returned by GETHOSTID. 	 


	D VIRTEL,LINES command response updated

	VIR0202I ALLOCATED IP ADDRESS =nnn.nnn.nnn.nnn                                                 

	Module		:VIR0002
	Meaning		:An additional message has been added to the F VIRTEL,LINES command to indicate the the 
			IP address for lines that default to GETHOSTID will be overidden with the IP= address specified in the
			JCL PARM of the Virtel started task.
	Action		: Virtel will use the IP address in the JCL PARM rather than default to the IP address returned by GETHOSTID. 	 


5334 Diagnostic enhancements
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	This change implements the following diagnostic enhancements.

	External Trace buffers.

	Ability to offload trace buffers to a dataset.

	External trace buffers
	The current VIT trace buffer is 200K which is insufficient to capture time related problems. 200K holds a couple of seconds worth of trace data at the most. This change 
	implements logic which moves the trace buffer external storage and chains them together. When a trace buffer fills it is automatically moved to external storage 
	above the 2GB storage bar. When taking a snap all trace buffers are printed, first those above the bar and finally the current trace buffer. This enhancement
	provides additional trace and diagnostic material covering a longer time span.

	The external or historical trace facility is controlled by the TRACEON= TCT parameter or the TRACE command. The Virtel Internal Tracing has several catatgories which control the amount
	of trace data. The cataegories are:-

	No tracing
	Minimal tracing. No data elements
	Tracing with data elements
	Tracing with data elements and external archive

	The active tracing catagory is displayed in the TRACE display message F VIRTEL,TRACE,DISPLAY

	F SPVIREH,TRACE,D                                              
	VIR0200I TRACE,D                                               
	VIR0208I VIRTEL INTERNAL TRACE = YYY. EXT. BUFFERS = 0001/00FF.
	VIR0213I NO ACTIVE TRACES                                      

	Message VIR0208I indicates the VIT status through a three character Y | N display and also provides information about the current number of external
	buffers used and the maximum available The VIT display indicators are as follows.

	Y|N	No tracing or minimal tracing
	Y|N	Data elements traced
	Y|N	External Archive active

	In the above example, YYY indicates full tracing (Data Elements) with trace archive active. The default setting is YYN which is the eqivalent of TRACE=ON. 
	By default external archive tracing is not turned on.	
	 
	TCT option

	TRACEON= ON | OFF | (Y|N,Y|N,Y|N)

	Default = ON	Equivalent VIT = YYN	Tracing ON

	OFF		Equivalent VIT = NNN	Tracing OFF

	TRACEON=(n,n,n) 	n = Y|N			Set Tracing options

	TRACEON=(N,N,N)			Tracing OFF
	TRACEON=(Y,N,N)			Minimal tracing, no data elements
	TRACEON=(Y,Y,N)	Default		Full tracing, no archive	.
	TRACEON=(Y,Y,Y)			Full tracing with archive

	Command Option.

	The VIT tracing cataegories can be set through the F VIRTEL,TRACE command

	F VIRTEL,TRACE,VIT=nnn			nnn correspond to the three Y|N indicators.

	Example.

	F VIRTEL,TRACE,VIT=YYY			Turn on full VIT tracing plus external buffer archive.

	Ability to offload trace buffers to a dataset.

	With the external VIT trace facility comes the ability to offload the trace buffers to a dataset. This offload capability can be triggered
	when the maximum number of external trace buffers have been reached, as identified in message VIR0208I, or through an operator
	command - F VIRTEL,TRACE,VIT=OFFLOAD.

	Setting up for trace "OFFLOAD".

	The trace buffers are offloaded to a GDG dataset which means historical trace data can be kept. To set up the GDG see the below. This 
	job can also be found in the SAMPLIB dataset as member DEFTRGDG.

	//*                                                        
	//* DEFINE THE TRACE GDG DATASET                           
	//*                                                        
	//DELETE   EXEC PGM=IDCAMS                                 
	//SYSPRINT DD SYSOUT=*                                     
	 DELETE VIRTEL.TRACE.GDG GDG                               
	 DELETE VIRTEL.TRACE.GDG.DSCB NVSAM                        
	 SET MAXCC=0                                               
	//ALLOC1   EXEC PGM=IEFBR14                                
	//FILE     DD DSN=VIRTEL.TRACE.GDG.DSCB,                   
	//            UNIT=3390,DISP=(NEW,CATLG),                  
	//            SPACE=(TRK,(0,0)),VOL=SER=VVVVVV,            
	//            DCB=BLKSIZE=13300                            
	//*                                                        
	//ALLOC2   EXEC PGM=IDCAMS                                 
	//SYSPRINT  DD SYSOUT=*                                    
	//SYSIN     DD *                                           
	 DEF GDG(NAME(VIRTEL.TRACE.GDG) LIMIT(5) SCRATCH NOEMPTY)  
	/*                                                         

	TCT option

	The following TCT options have been added to support the OFFLOAD facility. They are described below:-


	TRCXDSN=gdgdsn		Define the GDG dataset name to be used for the OFFLOAD
					datasets. the default is VIRTEL.TRACE.GDG. 

	TRCXBUF=(nnn[,CLEAR|OFFLOAD])	Define the number of external trace buffers and action to be taken
					when that number is reached.
					Maximum is 999, minimum=1. Default = 255.
					Action is either CLEAR (Default) or OFFLOAD.

	TCT Example

	TRCXBUF=(10,OFFLOAD),        		EXT. TRACE BUFFERS
	TRCXDSN=SP000.SPVIREH.TRACE.GDG,    	OFFLOAD DSN
	TRACEON=(Y,Y,Y),        			TRACE WITH EXT.HISTORY      
	    
	Note.

	If external buffering is not active any offload command will be rejected.as invalid. 

	New or altered Messages

	VIR0208I VIRTEL INTERNAL TRACE = xxx. EXT. BUFFERS = yyyy/zzzz.
	Module		:VIR0002
	Meaning		:Provides information about the Virtel Internal Trace status.
			xxx = VIT status where x is either a Y or N.
			x..	No tracing or minimal tracing.
			.x.	Full tracing but no archiving
			..x	Full tracing with external archiving	 
				 	
	Action		: None. 	

	VIR0072E TRACE TABLE ARCHIVE ERROR. ARCHIVE DISABLED.  RC=xx, RE=xx
	Module		:VIR0000
	Meaning		:Virtel was unable to archive the VIT current buffer. The return and reason codes are displayed. Archive will
			be disabled.
	Action		: Contact Technical Support. 	      

	VIR0073I TRACE TABLE ARCHIVE OFFLOADED
	Module		:VIR0004
	Meaning		:The maximum number of external VIT buffers has been reached and a VIT offload has been
			triggered.
	Action		: None. 	 

	VIR0079E UNABLE TO ALLOCATE OFFLOAD DATASET. R15=RC, R0=RE,DSN=gdgdsname
	Module		:VIR0004
	Meaning		:Virtel was unable to allocate the offload GDG. The dynamic allocation return and reason codes are displayed.
	Action		: Check the SVC99 codes to determine why the GDG could not be allocated. Check that the correct GDG base
			name is being. For additional support contact Technical Support. 

5365 Add DOC directory
^^^^^^^^^^^^^^^^^^^^^^

	Thu Feb-11-2016  16:58

	Upload the ARBO load configuration file to add the "DOC" directory and remove the "VSR" directory.

	The "DOC" directory will contain the Administration and other documentation files.				 


5403 Virtel shutdown modifications - critical datasets
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 

Reported by Colman:-

VIR0024I OPENING FILE VIRSWAP
IEC161I 037(050,006,IGG0CLE5)-002,VIRTELS,VIRTELS,VIRSWAP,,,  
VIR0023E ERROR 94 OPENING FILE VIRSWAP     

This error should gracefully close VIRTEL at startup rather than continue. Although FCTDSID is set to "*" to indicate the VSAM file 
hasn't been opened succesfully this is never tested in VIR0001 or by macro REQVSAM. VIR0001 is only ever passed the RPL.
An VSAM I/O on this ACB will result in an ABEND0C1 as the VSAM API interface has never been created.

Virtel will now post the ECBFIN if any error occurs and issue the following updated message:-

VIR0023E ERROR 00 OPENING FILE VIRSWAP . VIRTEL CLOSING.

-----------------------
jeu. mai-26-2016  18:20

5403A VSAM Open Error terminate Virtel only if file is 'vital'.

change the initial version of this update to:

	- only stop Virtel if the error is for a dataset that is vital to Virtel: currently VIRARBO and VIRSWAP
	- terminate immediately instead of posting ECBFIN which allowed the complete startup to continue.
	- issue the 'VIRTEL CLOSING' extension to message VIR0023E only when Virtel will not continue.


for instance:

cannot open file GIEVMO but startup continues:

 VIR0024I OPENING FILE GIEVMO          
 IEC130I GIEVMO   DD STATEMENT MISSING 
 VIR0023E ERROR 80 OPENING FILE GIEVMO 
 VIR0024I OPENING FILE VIRHTML         
 VIR0024I OPENING FILE PLUGTRSF        

cannot open file VIRSWAP, Virtel stops:

 VIR0024I OPENING FILE VIRARBO                              
 VIR0024I OPENING FILE VIRSWAP                              
 IEC130I VIRSWAP  DD STATEMENT MISSING                      
 VIR0023E ERROR 80 OPENING FILE VIRSWAP . VIRTEL CLOSING.   
 VIR0009I SP3VIR5  : SHUT DOWN IN PROGRESS                  
 VIR0024I CLOSING FILE VIRARBO                              
 VIR0024I CLOSING FILE VIRCMP3                              
 VIR0024I CLOSING FILE VIRCAPT                              
 VIR0024I CLOSING FILE GIEVMO   

5410 new Virtel favicon and logo
================================

SVN 4281 and SVN 4282-4283:

Prise en compte du nouveau logo de la charte graphique décliné avec le texte VIRTEL en blanc ("logovirt.png") ou en noir ("logovirtN.png").
Adaptation de la police de caractères dans le bandeau.


SVN 4284:

Insertion du numéro d'update dans l'interface ADMVWM pour être cohérent avec la page WEB2HOST.htm.
Les traitements ont été déplacés dans le fichier "vwa-version.js".
Ainsi, pour insérer le numéro d'update dans une interface, il suffit d'ajouter ce fichier, et de mettre les identifiants convenus dans le DOM de la page.

-----------------------
lun. mai-30-2016  10:36

5410A replace @level@ with a span id="level" 

SVN 4286:
Suite de la révision SVN 4284 pour intégrer "web2ajax.htm" dans la manière commune de prendre en compte l'affichage du niveau d'update.                            



MQSeries:
---------

5358 allow MQ3= and MQ4= in virtct
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^



5257 VIRSV V3R3 modifications
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	19/02/15     Sauvegarde des sources dans SP000.SAVSV.V3R3M3.SOURCE.
	             (VIRTEL 454).

	17/03/15     Correction édition erreur EXCI 203.
	             Sources modifié: VIRPEXC3.
	             Programme réassemblé: VIRPEXC3, VIRPEXC2.

	             Suppression OI.
	             Sources modifié: VSVMHOUR (copié de V3-R4 le 04/03/15)
	             Programme réassemblé: VSVTTRAC.

	24/03/15     Correction premier message d'une transaction.
	             Sources modifié: VIRPEXC3, VIRPEXC, VIRPEXCI.
	             Programme réassemblé: VIRPEXC3, VIRPEXC, VIRPEXCI.

	01/04/15     Création de SPRODUIT.VIRSV.V3R3M4.LOADLIB
	             Sauvegarde des sources dans SP000.SAVSV.V3R3M4.SOURCE.

	             Suppression OI, NI et suppression code obsolète.
	             Sources modifié: VSVQUEUE (copié de V3-R4 le 21/04/15)
	             Programme réassemblé: assemblage général.

	30/04/15     Ajout du code 12 dans VSVQUEUE.

	04/05/15     Distinction code 11 (ECB) et code 12 (P.E.) dans VSVQUEUE.

	             Traitement des CR 11 et 12 de VSVQUEUE.                  .
	             Sources modifié: VSVTTRAC (copié de V3-R4)
	             Programme réassemblé: assemblage général.

	07/05/15     Duplication modification du 09/10/14 et du 15/10/14
	             pour les messages de session et de transaction.
	             Sources modifié: VSVTSURV
	             Programme réassemblé: VSVTSURV.

	01/06/15     Code retour par erreur non zéro provoquant 0C4 dans Virtel
	             Source modifié: VSVPREQS
	             Programme réassemblé: VSVPREQS.	



Virtel 4.56
===========

VIRTEL Universal Protocol:
--------------------------

VIRTEL Web Access:
------------------

5425 VIRPLEX - VSAMTYP=WRITER
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

	Allows updates in a Virplex without necessitating the stop of the participating Virtel's, like the previous Virplex support did (cf 5385 VIRPLEX - complements ).


	The setup:

	-1-	several Virtel's sharing the same Virarbo.

	-2-	one of them has VSAMTYP=WRITER in its VIRTCT; the others have VSAMTYP=READONLY

	-3-	the READONLY Virtels are accessed on a 'client' HTTP ligne (eg CLIHTTP). The port for this ligne is shared between them using, for instance, the portshare statement in the TCPPARMS(PROFILE). 

	-4-	the WRITER Virtel is accessed on a 'service' line (eg W2H-HTTP) 

	-5-	the VIRTCT for the WRITER Virtel uses IGNLU=CLIHTTP to forbid the client line useage.

	-6-	the VIRTCT for the READONLY Virtels uses IGNLU=W2H-HTTP similarly

	-7-	both HTTP lines have the condition: COND='VIRPLEX-LINE(=VIRTEL=)' 

	-8-	for each Virtel, eg with applid=SPVIRE00 , a line is defined with PROTOCOL=QUICKLNK, and ID=SPVIRE00, and NAME=SPVIRE00, (that is line name = Virtel name)

	-9-	share options for VSAM files modified to (2,3)

	-10-	remove LSR option in TCT. Should now be MACRF=(SEQ,DIR) for files used within Virplex. For example ARBO and SAMP.


VIRTEL Web Modernisation & intergration:
----------------------------------------

Miscellaneous:
--------------

5425A corrections and wtos
^^^^^^^^^^^^^^^^^^^^^^^^^^

	- Remove LSR option from ACB for files included inside the VIRTERM macro (VIRARBO, VIRHTML and VIRCMP3) - then dynamically re-add LSR for auto files if VSAMTYP is neither readonly nor writer
	- correction: only the first client line was synchronized: SYNCHRO1 will no longer stop after an error
	- correction: the CAC1 request contained an incomplete directory name: add VPXCLEUSER which was missing
	- rewrite wto message VIRHT03I to announce VSAMTYP:

	 VIRHT02I LINE HTTP-CLI (C-HTTP  ) HAS URL http://192.168.170.31:41902             
	 VIRHT03I HTTP LINE HTTP-CLI (C-HTTP  ), IS A VIRPLEX SERVER WITH VSAMTYP=READONLY 

	 VIRHT02I LINE HTTP-W2H (W-HTTP  ) HAS URL http://192.168.170.39:41001            
	 VIRHT03I HTTP LINE HTTP-W2H (W-HTTP  ), IS A VIRPLEX SERVER WITH VSAMTYP=WRITER  

5423 MAXSOC increased
^^^^^^^^^^^^^^^^^^^^^

	Mon Jun-20-2016  18:12

	In previous versions of Virtel the MAXSOC value on the TCPx parameter in the TCT was defaulted to TCP/IP default value of 50. This is insufficent.
	If no MAXSOC value is specified in the TCPx statement a default value of 1000 will be used.

	5417A cosmetic - reset release level to 4.55