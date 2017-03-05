==============================
Virtel 4.53 Installation Guide
==============================

|image0|

|image1|

**VIRTEL Installation**

Version : 4.53

Release Date : 24 Sep 2014 Publication Date : 13/10/2014

Syspertec Communication

196, Bureaux de la Colline 92213 Saint-Cloud Cedex Tél. : +33 (0) 1 46 02 60 42

`www.syspertec.com <http://www.syspertec.com/>`__

NOTICE::

    Reproduction, transfer, distribution, or storage, in any form, of all or any part of 
    the contents of this document, except by prior authorization of SysperTec 
    Communication, is prohibited.

    Every possible effort has been made by SysperTec Communication to ensure that this document 
    is complete and relevant. In no case can SysperTec Communication be held responsible for 
    any damages, direct or indirect, caused by errors or omissions in this document.

    As SysperTec Communication uses a continuous development methodology; the information 
    contained in this document may be subject to change without notice. Nothing in this 
    document should be construed in any manner as conferring a right to use, in whole or in 
    part, the products or trademarks quoted herein.

    "SysperTec Communication" and "VIRTEL" are registered trademarks. Names of other products 
    and companies mentioned in this document may be trademarks or registered trademarks of 
    their respective owners.    

**Table of contents**

1. Summary of Amendments
========================

1.1 Virtel version 4.53 (24 Sep 2014)
-------------------------------------

1.2 Virtel version 4.52 (4 Dec 2013)
------------------------------------

1.3 Virtel version 4.51 (18 Jul 2013)
-------------------------------------

1.4 Virtel version 4.50 (30 Jun 2013)
-------------------------------------

1.5 Virtel version 4.49 (30 Apr 2013)
-------------------------------------

1.6 Virtel version 4.48 (27 Nov 2012)
-------------------------------------

1.7 Virtel version 4.47 (21 May 2012)
-------------------------------------

2. Introduction
===============

2.1 VIRTEL modules
------------------

2.2 Required environment
------------------------

2.2.1 MVS environment
^^^^^^^^^^^^^^^^^^^^^

2.2.2 VSE environment
^^^^^^^^^^^^^^^^^^^^^

2.2.3 Workstation pre-requisites
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3. Installing VIRTEL under MVS
==============================

3.1 Installation procedure
----------------------

3.1.1 Restoring from XMIT file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3.1.2 Applying PTFs
^^^^^^^^^^^^^^^^^^^

3.1.3 Upgrading a previous release
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3.2 Executing VIRTEL in an MVS environment
------------------------------------------

3.2.1 Required and optional files for VIRTEL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3.2.2 APF authorisation, userid, and priority
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

3.2.3 Executing VIRTEL
^^^^^^^^^^^^^^^^^^^^^^

3.2.4 Stopping VIRTEL
^^^^^^^^^^^^^^^^^^^^^

3.3 MVS installation check-list
-------------------------------

4. Installing VIRTEL under VSE
==============================

4.1 Installation procedure
--------------------------

4.1.1 Loading the installation jobs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.2 Defining the library
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.3 Loading the executable modules
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.4 Loading the source modules
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.5 Defining the VIRARBO and VIRSWAP files
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.6 Initialisation of the VIRARBO file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.7 Defining the VIRSTAT file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.8 Defining the VIRCMP3 file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.9 Defining the VIRCAPT file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.10 Defining the SAMPTRF file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.11 Defining the HTMLTRF file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.12 Loading the SAMPTRF file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.13 Defining the VIRHTML file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.14 Assembling the VIRTCT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.15 Assembling the MODVIRT mode table
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.16 Updating the VIRARBO file (ARBOLOAD)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.17 Cataloging the VTAM application book
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.1.18 Defining the CICS resources
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.2 Executing VIRTEL in a VSE environment
-----------------------------------------

4.2.1 Specifying the TCP/IP partition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.2.2 Stopping VIRTEL
^^^^^^^^^^^^^^^^^^^^^

4.3 Applying PTFs 40
--------------------

4.3.1 Loading from a 3480 cartridge
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

4.3.2 Application of the PTFs
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

5. VTAM parameters
==================

5.1 VTAM parameters
-------------------

5.2 Definition of the VIRTEL primary ACB
------------------------------------------

5.3 Defining the VTAM application relays
------------------------------------------

5.4 MODETAB for Minitel, X25, and APPC
----------------------------------------

5.5 USSTAB for Minitels and PC’s
--------------------------------

5.6 CICS definitions
--------------------

5.6.1 VIRTEL Web Access Terminals
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

5.6.2 Minitel Terminals
^^^^^^^^^^^^^^^^^^^^^^^

6. VIRTCT
=========

6.1 Introduction 47
-------------------

6.2 Parameters of the VIRTCT
----------------------------

6.2.1 ACCUEIL parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.2 ADDR1 parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.3 ADDR2 parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.4 AIC parameter
^^^^^^^^^^^^^^^^^^^

6.2.5 ANNUL parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.6 APPLID parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.7 APPSTAT parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.8 ARBO parameter
^^^^^^^^^^^^^^^^^^^^

6.2.9 BATCH1 parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.10 BATCH2 parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.11 BFVSAM parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.12 BUFDATA parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.13 BUFSIZE parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.14 CHARSET parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.15 CODE parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.16 COMPANY parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.17 COMPR3 parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.18 CORRECT parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.19 COUNTRY parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.20 CRYPT1 parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.21 CRYPT2 parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.22 DEFENTR parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.23 DEFUTF8 parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.24 DIRECT parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.25 DONTSWA parameter (MVS only)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

6.2.26 EXIT1 parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.27 EXIT2 parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.28 EXIT3 parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.29 EXIT4 parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.30 EXIT5 parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.31 EXIT6 parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.32 EXIT7 parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.33 EXIT8 parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.34 EXPIRE parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.35 FASTC parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.36 FCAPT parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.37 FCMP3 parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.38 GATE parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.39 GMT parameter
^^^^^^^^^^^^^^^^^^^^

6.2.40 GRNAME parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.41 GTLOAD parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.42 GTPRFE1 parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.43 GTPRFE2 parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.44 GTVSAM parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.45 GTVSKIP parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.46 GUIDE parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.47 HTFORWD parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.48 HTHEADR parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.49 HTMINI parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.50 TPARM parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.51 HTSET1 to HTSET4 parameters
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

6.2.52 HTVSAM parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.53 IBERTEX parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.54 IGNLU parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.55 LANG parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.56 LICENCE parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.57 LOCK parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.58 MARK parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.59 MAXAPPL parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.60 MEMORY parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.61 MINITEL parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.62 MQ1 parameter
^^^^^^^^^^^^^^^^^^^^

6.2.63 MQ2 parameter
^^^^^^^^^^^^^^^^^^^^

6.2.64 MULTI parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.65 NBCVC parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.66 NBDYNAM parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.67 NBTERM parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.68 NUMTASK parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.69 OTMAPRM parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.70 OSCORE parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.71 PACKET parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.72 PASSTCK parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2 73 PREZ900 parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2 74 PRFSECU parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.75 PWPROT parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.76 RACAPPL parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.77 RAPPL parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.78 REALM parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.79 REPET parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.80 RESO parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.81 RETOUR parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.82 RNODE parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.83 SECUR parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.84 SILENCE parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.85 SNAPW parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.86 SOMMR parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.87 STATDSN parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.88 STATS parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.89 STRNO parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.90 SUITE parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.91 SWAP parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.92 SYSPLUS parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.93 TCP1 parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.94 TCP2 parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.95 TIMEOUT parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.96 TIMERQS parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.97 TITRE1 parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.98 TITRE2 parameter
^^^^^^^^^^^^^^^^^^^^^^^

6.2.99 TRACALL parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.100 TRACBIG parameter
^^^^^^^^^^^^^^^^^^^^^^^^^

6.2.101 TRACEB parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.102 TRACEOJ parameter
^^^^^^^^^^^^^^^^^^^^^^^^^

6.2.103 TRACEON parameter
^^^^^^^^^^^^^^^^^^^^^^^^^

6.2.104 TRACTIM parameter
^^^^^^^^^^^^^^^^^^^^^^^^^

6.2.105 TRAN parameter
^^^^^^^^^^^^^^^^^^^^^^

6.2.106 UFILE1 to UFILE20 parameters
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

6.2.107 VIRSECU parameter
^^^^^^^^^^^^^^^^^^^^^^^^^

6.2.108 VIRSV1 parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.109 VSAMTYP parameter
^^^^^^^^^^^^^^^^^^^^^^^^^

6.2.110 VTKEYS parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.111 VTOVER parameter
^^^^^^^^^^^^^^^^^^^^^^^^

6.2.112 XM1 parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.113 XM2 parameter
^^^^^^^^^^^^^^^^^^^^^

6.2.114 ZAPH parameter
^^^^^^^^^^^^^^^^^^^^^^

6.3 Additional parameters for VSAM files
----------------------------------------

6.4 Additional parameters for batch files
-----------------------------------------

6.5 Example of the VIRTCT
-------------------------

6.6 Assembling the VIRTCT
-------------------------

6.6.1 MVS example
^^^^^^^^^^^^^^^^^

6.6.2 VSE example
^^^^^^^^^^^^^^^^^

6.7 Dynamic VIRTCT overrides
----------------------------

6.8 Applying patches via the VIRTCT
-----------------------------------

7. VIRCONF
==========

7.1 Introduction
----------------

7.2 JCL
-------

7.2.1 Creating and uploading a new VIRARBO file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

7.2.2 Updating a VIRARBO file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

7.2.3 Unloading a VIRARBO file
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

7.2.4 Verify control card syntax
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

7.2.5 Multi-language support
^^^^^^^^^^^^^^^^^^^^^^^^^^^^

8. Security
===========

8.1 How to activate RACF security
---------------------------------

8.1.1 Modify the VIRTCT
^^^^^^^^^^^^^^^^^^^^^^^

8.1.2 Add RACF definitions
^^^^^^^^^^^^^^^^^^^^^^^^^^

8.1.3 Refine RACF definitions
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

8.2 How to activate ACF2 security
---------------------------------

8.2.1 Modify the VIRTCT
^^^^^^^^^^^^^^^^^^^^^^^

8.2.2 Determine the ACF2 resource type
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

8.2.3 Add ACF2 definitions
^^^^^^^^^^^^^^^^^^^^^^^^^^

8.3 How to activas Top Secret (TSS) security
--------------------------------------------

8.3.1 Modify the VIRTCT
^^^^^^^^^^^^^^^^^^^^^^^

**Summary of Amendments**  

VIRTEL Web Access:

-  Allow FR-850 charset for IND$FILE transfer

-  Limit IND$FILE file upload to HTPARM(2) parameter value

-  Macro management enhancements for multi files synchronisation

-  Outsourcing of all messages for multi-language support

-  Support of cut and paste in I-Frame mode for Firefox, and Chrome

-  Additional HTML tags:

   -  VALUE-OF URL and QUERY

VIRTEL Web Integration:

-  Additional commands for scenarios:

   -  ACTION$ REFRESH-TERMINAL

   -  HANDLE$ ABEND

   -  HANDLE$ LOOP

   -  PERFORM$ subroutine

   -  LABEL$

Miscellaneous:

-  Increased CISIZE for the data portion of the TRSF's files

-  Modification of SHR options for ARBO file

-  SMF support for statistics records

-  Support of multi lines for WTO

-  TRACTIM=CPU CPU time in snap

-  Allows to specify a country code in the VIRTCT VIRSV1= second
   sub-parameter

-  Allows BLDVRP hiperspace option in VIRTCT

-  Miscellaneous editorial corrections and enhancements

-  Additional system commands:

   -  SNAPMSG command to trap VIRHT6xE message

VIRTEL Universal Protocol:

-  OTMAPRM parameter to specify security parameters for RESUME TPIPE

-  Modifiable exit name for RESUME TPIPE

-  Selection of transaction name for RESUME TPIPE VIRTEL Web Access:

-  Macro management enhancements

-  Size limit for IND$FILE upload

-  Support for BLINK attribute in IE8+, Firefox, and Chrome

-  Additional HTML tags:

   -  VALUE-OF URL and QUERY

VIRTEL Web Modernisation:

-  Timeout specifiable for SEND$ TO-LINE

-  Additional commands for scenarios:

   -  COPY$ SYSTEM-TO-VARIABLE URL and QUERY

   -  SEND$ MAXTIME

Miscellaneous:

-  VIRCONF documentation in English

-  Modernised configuration interface

-  Support for pre-zSeries processors

-  Unique identification for VIRTEL startup message

-  Customizable VIRTEL application name for RACF (RACAPPL)

-  Miscellaneous editorial corrections and enhancements

VIRTEL Universal Protocol:

-  Protocol ICONNECT (RESUME TPIPE) for communication with IMS VIRTEL
   Web Access:

-  Additional HTML tags:

   -  NAME-OF VIRTEL-VERSION

VIRTEL Web Modernisation:

-  Additional commands for scenarios:

   -  COPY$ SYSTEM-TO-VARIABLE VIRTEL-VERSION

Miscellaneous:

-  Open and close printers on demand

-  Repeating terminal definitions in hexadecimal and alphanumeric

-  Display printer names by F VIRTEL,L=line,D command

-  New command F VIRTEL,RELAYS

-  Miscellaneous editorial corrections and enhancements

VIRTEL Web Access:

-  Passticket support

-  New Web Access Settings:

   -  Shift+Enter, Ctrl+Enter

   -  Line spacing, Character spacing

-  Ctrl-A to mark whole 3270 screen for copy

-  Support for 3270 Graphic Escape characters

-  Downloadable fonts

-  Print SCS-to-PDF

-  Query support for SCS printers

-  Printer autoconnect

-  Miscellaneous ergonomic enhancements VIRTEL Web Modernisation:

-  Additional commands for scenarios:

   -  CONVERT$ EBCDIC-TO-UPPERCASE, EBCDIC-TO-LOWERCASE

   -  COPY$ PASSTICKET

MQSeries:

-  Unique correlator for MQ requests

-  Message type REPLY for MQ responses Miscellaneous:

-  Miscellaneous editorial corrections and enhancements

VIRTEL Web Access:

-  Codepages 0037 and 1047 included as standard

-  New Web Access Settings:

   -  Adapt font size ratio

   -  Additional keyboard remappings for Alt+Ins, Alt+Home, and Alt+F1

   -  ChgCur key to change cursor shape

-  Settings page in French and German

-  Administrator can hide specific settings

-  Additional HTML tags:

   -  CREATE-VARIABLE-IF TRACING-SCENARIO

   -  SET-HEADER

-  Allow Virtel session code to be stored in cookie

-  Custom hotspot recognition

-  Custom logo for Web Access and Application menus

-  Drag and drop upload summary report

-  Miscellaneous ergonomic enhancements VIRTEL Web Modernisation:

-  Additional commands for scenarios:

   -  COPY$ SYSTEM-TO-VARIABLE USER-SECURITY-PROFILE

   -  DEBUG$

   -  SET$ SIGNON

   -  VIRSV$ TRANSACTION OPTION=CLOSE

SYSPLEX support:

-  Allow read-only sharing of VSAM files Miscellaneous:

-  Miscellaneous editorial corrections and enhancements

VIRTEL Universal Protocol:

-  Menu program VIR0021J VIRTEL Web Access:

-  Connection of non-predefined VTAM LU names

-  Support for expired passwords

-  Site-specific Javascript (custom.js)

-  REALM parameter to reduce multiple signon

-  Codepage 1047 for C programming

-  Codepage override by URL

-  New Web Access Settings:

   -  End key

   -  Remap caret to logical not

-  Additional HTML tags:

   -  CREATE-VARIABLE-FROM (allows a rectangle to be copied from the 3270 screen)

-  Miscellaneous ergonomic enhancements VIRTEL Web Modernisation:

-  Support for scenarios stored in VSAM

-  Additional commands for scenarios:

   -  ACTION$ PROCESS-RESPONSE

   -  COPY$ VARIABLE-TO-SYSTEM PASSWORD

   -  IF$ SCREEN-IS-BLANK

   -  IF$ SCREEN-IS-UNFORMATTED

    VIRTEL Web Integration:

-  New programs CALL VIRSETAI, VIRSETVI for IMS SYSPLEX support:

-  SYSCLONE parameter in LU names

-  Dynamic VIRTCT overrides Miscellaneous:

-  Restart VIRSV service by console command

-  Patch application via the VIRTCT

-  Miscellaneous editorial corrections and enhancements

VIRTEL Universal Protocol:

-  Native TCP/IP protocol VIRTEL Web Access

-  Support for 3270 FieldMark and Dup characters

-  Keystroke buffering

-  New Web Access Settings:

   -  Move cursor on activate

   -  Omit nulls from input

   -  Select word by double-click

   -  Highlight input fields

   -  Keep keypad and macro pad open

   -  Field mark and Dup

-  Additional HTML tags:

   -  DELETE-ALL-VARIABLES (allows the variable pool to be reset from within page template)

-  SET-INITIAL-TIMEOUT (allows an initial timeout to be specified within a page)

-  SET-LOCAL-OPTIONS JSON-ESCAPES (allows generation of JSON page templates)

-  SET-LOCAL-OPTIONS TRACE-LINE, TRACE-RELAY (allows traces to be activated from a page template)

-  Upload by drag and drop (Chrome only)

-  Save and restore file transfer parameters

-  Long polling reduces load on IP network

-  Customizable user help page for Web Access

-  Site customization of colors and logo (custom.css)

-  Miscellaneous ergonomic enhancements VIRTEL Web Modernisation:

-  Screen redesigner upgrade

-  Additional commands for scenarios:

   -  CASE$ VARIABLE

   -  COPY$ LIST-TO-VARIABLE

   -  COPY$ VARIABLE-TO-SYSTEM NAME-OF DIRECTORY

   -  FILTER$ VARIABLE-TO-VARIABLE

   -  MAP$ EXECUTE and RETURN$

Miscellaneous:

-  Logon screen for VTAM applications

-  Latin-2 translate tables for Eastern European countries

-  Miscellaneous editorial corrections and enhancements

Introduction
============

    The functionality of VIRTEL is divided into components known as
    “modules”. The following is a list of the VIRTEL modules:

-  The VIRTEL base kernel

-  VIRTEL Multi-Session

-  VIRTEL Security

-  VIRTEL Web Access

-  VIRTEL Web Modernisation

-  VIRTEL Web Integration

-  VIRTEL Application - Application

-  VIRTEL XOT

-  VIRTEL Minitel / 3270

-  VIRTEL Compression

-  VIRTEL PC / VT100

-  VIRTEL Network Manager (VTAM console)

-  VIRTEL Incoming calls SMTP

-  VIRTEL Incoming calls Minitel

-  VIRTEL Incoming calls PC

-  VIRTEL Incoming calls VTxxx

-  VIRTEL Outgoing calls SMTP

-  VIRTEL Outgoing calls Videotex 3270

-  VIRTEL Outgoing calls 3174 switched X25

-  VIRTEL Outgoing calls VTxxx

-  VIRTEL VIRAPI, APPC

-  VIRTEL LECAM

-  VIRTEL VIRPASS

    The VIRTEL product contains support for the base kernel and all
    modules. The functionality of each module is activated either by
    setting specific parameters in the VIRTCT or by the activation of
    appropriate configuration definitions in the VIRARBO file.

Please refer to your license agreement for the particular terms and conditions under which you are authorised to use the various VIRTEL modules.
------------------------------------------------------------------------------------------------------------------------------------------------

    VIRTEL operates in the MVS or VSE environments. Throughout the
    VIRTEL documentation, the term “MVS” should be understood to include
    OS/390 and z/OS, and the term “VSE” should be understood to include
    VSE/ESA and z/VSE.

    In the MVS environment, VIRTEL runs under the OS/390 or z/OS
    operating systems. If the VIRTEL MQ interface is used, then MQSeries
    Version 6 or later is required. Support for the cryptographic
    functions of VIRTEL requires ICSF Version HCR7740 or later.

    In the VSE environment, VIRTEL runs under the VSE/ESA or z/VSE
    operating systems. TCP/IP access (XOT, VIRTEL Web Access) requires
    VSE/ESA 2.5.1 or later, or any version of z/VSE.

    VIRTEL Web Access requires a standard web browser on the user’s
    workstation. Supported browsers include:

-  Microsoft Internet Explorer Version 6 or above

-  Firefox Version 15 or above (for Windows 7 or Vista)

-  Firefox Version 17 or above (for Windows XP)

-  Chrome Version 23 or above

-  Opera Version 15 or above

-  Safari Version 5 or above

    VIRTEL Web Access requires JavaScript to be enabled in the browser.

Installing VIRTEL under
=======================

    **MVS**

    In the MVS environment, VIRTEL is delivered as a zipped XMIT file
    containing the VIRTEL datasets compressed in DF/ DSS dump format.
    The following sections provide details of the installation method.

    A quick “installation check-list” to start the VIRTEL Web Access
    function for MVS can be found at the end of this section.

    All the VSAM and non-VSAM datasets required for the installation of
    VIRTEL are contained in a zipped XMIT file which can be downloaded
    from the Syspertec file server. The size of the zipped file is
    approximately 2MB. Two JCL files ($ALOCDSU and $RESTDSU) are also
    included in the zip file. The procedure for obtaining and uploading
    the file is as follows:

    Login to the Syspertec file server
    `http://ftp.syspertec.com <http://ftp.syspertec.com/>`__ using the
    userid and password supplied to you by Syspertec. Navigate to the
    “Public” – “VIRTEL 4.53” – “Products” folder and download the
    virtel453mvs.zip file. Unzip this file into a folder on your
    workstation.

    Run the job $ALOCDSU to allocate a sequential file named
    userid.TRANSFER.XMIT with DCB attributes (RECFM=FB, LRECL=80):

+----------------+-------------------------------------------------------+----------+
|     //\*--\*   |     BINARY FILE TRANSFER - STEP NO.1                  | \*--\*   |
+================+=======================================================+==========+
|     //\*--\*   |                                                       | \*--\*   |
+----------------+-------------------------------------------------------+----------+
|     //\*--\*   |     Function : Allocate a sequential XMIT type file   | \*--\*   |
+----------------+-------------------------------------------------------+----------+
|     //\*--\*   |                                                       | \*--\*   |
+----------------+-------------------------------------------------------+----------+

    *JCL for allocating an XMIT file (MVS)*

    The parameters SET VOLM=SPT001 and SET UNIT=3390 at the start of
    this job should be changed as appropriate to match the volume on
    which the userid.TRANSFER.XMIT dataset is to be allocated.

    Using FTP or IND$FILE, upload the file virtel453mvs.xmit to the host
    transfer file created in step 1. It is very important to ensure that
    the upload is performed in binary mode. The following is an example
    of an FTP session to perform the upload:

    *Figure 2‑2 FTP session for uploading an XMIT file (MVS)*

    Run the job $RESTDSU to unpack the transfer file and to restore the
    VIRTEL datasets by means of the ADRDSSU utility program:

    //SPRESDSU JOB 1,MSGCLASS=X,CLASS=A,NOTIFY=&SYSUID

    //\*-------------------------------------------------------------------\*

    //\*--\* Binary File Transfer - STEP No 3 \*--\*

    //\*--\* \*--\*

    //\*--\* Function : Reception and reload of the files \*--\*

    //\*--\* \*--\*

    //\*--\* Replace '??????' by target volume serial number \*--\*

    //\*--\* Replace 'yourqual' by target DSN high-level qualifier
    \*--\*

    //\*-------------------------------------------------------------------\*

    //\*-------------------------------------------------------------------\*

    //\* Reception of the .XMIT File \*

    //\*-------------------------------------------------------------------\*

    //BATCHTS EXEC PGM=IKJEFT1A,REGION=4M

    //SYSPRINT DD SYSOUT=\*

    //SYSTSPRT DD SYSOUT=\*

    //XMITFILE DD DSN=&SYSUID..TRANSFER.XMIT,DISP=OLD

    //SYSTSIN DD \*

    RECEIVE INFILE(XMITFILE) DA(TRANSFER.DSSDUMP)

    //\*

    //\*-------------------------------------------------------------------\*

    //\* Reload of the initial files \*

    //\*-------------------------------------------------------------------\*

    //DSSREST EXEC PGM=ADRDSSU,REGION=6M,COND=(0,NE)

    //SYSPRINT DD SYSOUT=\*

    //DUMPFILE DD DSN=&SYSUID..TRANSFER.DSSDUMP,DISP=(OLD,DELETE)
    RESTORE -

    DS(INCLUDE(SPRODUIT.VIRTEL.BASE\*.\*\*)) - OUTDYNAM(??????,3390) /\*
    <==== VOLUME, UNIT ===== \*/ - RENAMEUNC( -

    (SPRODUIT.VIRTEL.BASE453.LOADLIB, - yourqual.VIRT453.LOADLIB), -

    (SPRODUIT.VIRTEL.BASE453.MACLIB, -

    yourqual.VIRT453.MACLIB), - (SPRODUIT.VIRTEL.BASE453.SAMPLIB, -

    yourqual.VIRT453.SAMPLIB), - (SPRODUIT.VIRTEL.BASE453.SERVLIB, -

    yourqual.VIRT453.SERVLIB), - (SPRODUIT.VIRTEL.BASE453.DBRMLIB, -

    yourqual.VIRT453.DBRMLIB), - (SPRODUIT.VIRTEL.BASE453.CNTL, -

    yourqual.VIRT453.CNTL), - (SPRODUIT.VIRTEL.BASE453.SAMP.TRSF, -

    yourqual.VIRT453.SAMP.TRSF), -
    (SPRODUIT.VIRTEL.BASE453.CONFGEN.MACLIB, -

    yourqual.VIRT453.CONFGEN.MACLIB), -
    (SPRODUIT.VIRTEL.BASE453.FA29API.MACLIB, -

    yourqual.VIRT453.FA29API.MACLIB), -
    (SPRODUIT.VIRTEL.BASE453.SCRNAPI.MACLIB, -

    yourqual.VIRT453.SCRNAPI.MACLIB), -
    (SPRODUIT.VIRTEL.BASE453.VIRAPI.MACLIB, -

    yourqual.VIRT453.VIRAPI.MACLIB), - (SPRODUIT.VIRTEL.BASE453.ARBO, -

    yourqual.VIRT453.ARBO), - (SPRODUIT.VIRTEL.BASE453.CAPT, -

    yourqual.VIRT453.CAPT), - (SPRODUIT.VIRTEL.BASE453.CMP3, -

    yourqual.VIRT453.CMP3), - (SPRODUIT.VIRTEL.BASE453.HTML, -

    yourqual.VIRT453.HTML), - (SPRODUIT.VIRTEL.BASE453.HTML.TRSF, -

    yourqual.VIRT453.HTML.TRSF), - (SPRODUIT.VIRTEL.BASE453.PLUG.TRSF, -

    *JCL for restoring from an XMIT file (MVS)*

    The following changes should be made to this job before submitting
    it:

-  If the VIRTEL datasets are not to be managed by SMS, alter the
   statement OUTDYNAM(??????,3390) to specify the volume on which the
   datasets are to be allocated.

-  If the VIRTEL datasets are to be managed by SMS, remove the
   NULLSTORCLAS BYPASSACS(\*\*) statement and replace it by
   STORCLAS(classname) where classname is the name of the SMS storage
   class on which the VIRTEL datasets are to be allocated. Do not delete
   the OUTDYNAM parameter, ADRDSSU requires it even though its value is
   ignored for SMS.

-  In the RENAMEUNC parameter, replace yourqual by the high-level
   qualifiers to be used for your VIRTEL datasets.

-  The ADMIN and TOL(ENQF) parameters may be uncommented if you are
   authorized to the necessary STGADMIN profiles.

    As a general rule the application of PTFs is necessary and
    recommended. PTFs are maintenance files which must be applied to the
    VIRTEL LOADLIB to correct problems which have been discovered
    subsequent to the building of the VIRTEL 4.53 release, or to add new
    function which will be included as standard in the next release. A
    second type of PTF consists of elements such as HTML pages, style
    sheets, and JavaScript files, which must be uploaded into the VIRTEL
    directories in the SAMPTRSF VSAM file. This type of PTF may
    sometimes be supplied as a complete replacement for the SAMPTRSF
    file in the form of a DF/DSS dump in XMIT format.

    To download PTFs from the Syspertec file server, use your web
    browser to login to the file server as described 13, navigate to the
    “Public” – “VIRTEL 4.53” – “PTFS for version 4.53” folder, and
    download the allptfs-mvs453.txt file. If the file does not exist,
    then there are no PTFs to be applied.

    Alternatively, you may receive the allptfs-mvs453.txt file by e-mail
    from Syspertec support.

    The allptfs-mvs453.txt file should be uploaded in text format to
    member PTF453MV of the VIRTEL CNTL library.

    For PTFs which contain elements to be uploaded to VIRTEL, first
    unzip the elements to a directory on your workstation. Then use the
    “Upload” link from the VIRTEL Web Access page at
    http://n.n.n.n:41001 to upload the elements one by one to the
    W2H-DIR directory.

    In the case of a PTF containing a replacement SAMPTRSF file in
    DF/DSS XMIT format, use the procedure previously described ($ALOCDSU
    and $RESTDSU) to upload the file in binary and retrieve the SAMPTRSF
    VSAM file.

    The recovered PTFs are applied to the VIRTEL LOADLIB by using
    AMASPZAP with the IGNIDRFULL parameter. The ZAPJCL member in the
    VIRTEL CNTL library (shown below) performs the apply. This job
    should complete with return code 0000 or 0004.

    *Member ZAPJCL for applying PTFs (MVS)*

    VIRTEL must be stopped and restarted to allow the newly-applied PTFs
    to take effect. The list of PTFs applied is displayed near the
    beginning of the SYSMSGLG dataset during VIRTEL startup by message
    VIR0018I, as shown in the following example:

    *Validation of the VIRTEL PTF level*

    If you already have a previous release of VIRTEL installed (version
    4.00 or later) then you only need the datasets shown in the figure
    below:

    *Datasets upgraded during release change*

    For the remaining datasets, shown in the figure below, you should
    continue to use your existing datasets, as these may contain
    customer-specific configuration information which you do not want to
    overwrite:

    *Datasets to be retained from previous release*

    Note: it is also possible to copy your existing files into the files
    of the new release using IDCAMS REPRO (or by ARBOLOAD for the
    VIRARBO file).

    The procedure for upgrading from a previous release of VIRTEL
    (version 4.00 or later) is as follows. Customers upgrading from
    earlier releases of VIRTEL should contact Syspertec for technical
    support.

1.  Upload and unpack the virtel453mvs.xmit file as described in the
    previous section.

2.  Apply PTFs as described in the previous section.

3.  Copy your VIRTCTnn from the old VIRTnnn.CNTL library to the new
    VIRT453.CNTL

4.  Reassemble your VIRTCTnn module using the ASMTCT job in VIRT453.CNTL

5.  If you have any scenario or user exit modules, copy them to the
    VIRT453.CNTL library and reassemble them using the ASMSCEN and
    ASMEXIT jobs respectively.

6.  Add the new VIRT453.LOADLIB library to the system APF list in the
    MVS PARMLIB and use the SETPROG command to authorize the
    VIRT453.LOADLIB library.

7.  Edit your VIRTEL procedure in the MVS PROCLIB, to ensure that the
    STEPLIB, DFHRPL, and SERVLIB DD statements reference the new
    VIRT453.LOADLIB, and that the SAMPTRSF DD statement references the
    new VIRT453.SAMP.TRSF dataset.

8.  If upgrading from a version prior to VIRTEL 4.43, add a VIRTRACE DD
    statement to the VIRTEL procedure, as shown in the next section.

9.  If you have modified the default values for the VIRTEL Web Access
    Settings (as described in the VIRTEL Web Access Guide), upload your
    customized w2hparm.js file into the CLI-DIR directory and check that
    the CLI-03P transaction (under the CLIWHOST entry point) references
    CLI-DIR in the “Application” field. If you do not find a CLI-03P
    transaction, run job CUSTCSS from the VIRTEL SAMPLIB.

10. Stop and restart VIRTEL.

    VIRTEL can run as a JOB or as an STC. An example JCL procedure is
    contained in member VIRTEL4 of the VIRTEL SAMPLIB. If VIRTEL is to
    be run as an STC, this member must be copied into a system PROCLIB
    and renamed as VIRTEL:

+----------------+-----------------------------------+--------------------------------+
|     //VIRTEL   |     PROC QUAL=yourqual.VIRT453,   |                                |
+================+===================================+================================+
|     //\*       |     QUALMQ=CSQ600,                |     <-- MQSeries qualifier     |
+----------------+-----------------------------------+--------------------------------+
|     //         |     APPLID=,                      |     <-- Default is in VIRTCT   |
+----------------+-----------------------------------+--------------------------------+
|     //         |     TCT=01                        |     <-- Suffix of VIRTCT       |
+----------------+-----------------------------------+--------------------------------+

    *VIRTEL started task JCL procedure (MVS)*

-  Files STEPLIB, DFHRPL are always required

-  Files VIRARBO, VIRSWAP are always required

-  File SERVLIB must be present if the VIRSV1 parameter is coded in the
   VIRTCT

-  File VIRSTAT must be present if the parameter STATS=YES is coded in
   the VIRTCT

-  File VIRCMP3 must be present if the parameter COMPR3=AUTO or
   COMPR3=FIXED is coded in the VIRTCT

-  File VIRCAPT must be present if the parameter FCAPT=VIRCAPT is coded
   in the VIRTCT

-  File VIRHTML must be present if the parameter HTVSAM=VIRHTML is coded
   in the VIRTCT (parameter required for clients wishing to use e-mail,
   VIRTEL Web Access, or the Videotex Plug-In function)

-  Files SAMPTRSF, HTMLTRSF must be present if referenced by the
   parameters UFILEn (and their corresponding ACBs) in the VIRTCT
   (required for clients wishing to use VIRTEL Web Access functions)

-  File PLUGTRSF must be present if referenced by a parameter UFILEn
   (and its corresponding ACB) in the VIRTCT (required for clients
   wishing to use the Videotex Plug-In function)

-  Files SYSOUT, VIRLOG, VIRTRACE, SYSPRINT, SYSUDUMP are always
   required

-  The libraries SCSQANLE, SCSQAUTH must be concatenated to the STEPLIB
   unless these libraries are in the system link list or LPA list (only
   for clients wishing to use VIRTEL with MQSeries)

-  The CSF.SCSFMOD0 library must be concatenated to the STEPLIB or must
   be present in the system link list (only if the CRYPTn=(...,ICSF,...)
   parameter is coded in the VIRTCT)

    VIRTEL must run from an APF-authorized library if either of the
    following is true:

-  External security (RACF, TOP SECRET, or ACF2) is selected by means of
   the SECUR parameter of the VIRTCT

-  VIRTEL is made non-swappable by means of the DONTSWA parameter of the
   VIRTCT

    Normally VIRTEL is started in APF-authorized mode via the VIR6000
    module, and in this case all of the libraries specified in the
    STEPLIB and DFHRPL concatenations must be APF-authorised. For
    certain specialised applications (Videotex server), the DFHRPL
    concatenation may include screen image libraries which cannot be APF
    authorised. In this case it is possible to start VIRTEL via the
    module VIR0APF which can be isolated in an authorised library. In
    this way, the other libraries declared in DFHRPL do not necessarily
    need to be APF-authorized.

    VIRTEL must be run under a userid which has an OMVS segment defined
    in its profile. If VIRTEL is started as an STC, define a profile in
    the RACF STARTED class (or equivalent if using another security
    product) to assign the VIRTEL STC to the appropriate userid.

    It is necessary for VIRTEL to run at the same priority as VTAM and
    TCP/IP. This is usually done by assigning VIRTEL to service class
    SYSSTC in the workload manager. It is also recommended that VIRTEL
    run non swappable (DONTSWA=YES in the VIRTCT).

    VIRTEL is started by executing the command S VIRTEL from the system
    console. Message VIR0000I indicates that the product started
    properly.

    VIRTEL may be stopped by issuing the following command: P VIRTEL

    Here is a standard “check-list” to start the WEB to HOST VIRTEL
    function:

1. Download the following files from our FTP server
   (http://ftp.syspertec.com)

   -  Virtel453mvs.zip.

   -  allptfs-mvs453.txt if available.

-  virtel453updtnnnn.zip if available.

1. Run job $ALOCDSU to create the TRANSFER.XMIT file.

2. Upload the virtel453mvs.xmit file to the TRANSFER.XMIT file in binary
   mode.

3. Edit job $RESTDSU specifying the high-level qualifiers and SMS or
   volume serial information for the VIRTEL datasets. Run job $RESTDSU
   to create the VIRTEL datasets yourqual.VIRT453.xxxxxx

4. Apply the PTFs in the allptfs-mvs453.txt file using job ZAPJCL in the
   VIRTEL CNTL library. If this file does not exist, skip this step.

5. Use the SETPROG APF command to add the VIRTEL LOADLIB to your system
   APF authorized program library list: SETPROG
   APF,ADD,DSN=yourqual.VIRT453.LOADLIB,VOL=volser

6. Edit member VIRTCT01 in the VIRTEL CNTL library :

1. Set the APPLID= parameter to the VTAM ACBNAME you will use to log on
   to VIRTEL (the suggested value is APPLID=VIRTEL)

2. The TCP1= parameter must match the jobname of your z/OS TCP/IP stack
   (the suggested value TCPIP is usually correct)

3. If you prefer VIRTEL to display English language panels, then set
   LANG='E'

4. (e) Set the COUNTRY and DEFUTF8 parameters according to your country
   (see `“Parameters of the VIRTCT”, <#_bookmark71>`__ `page
   47 <#_bookmark71>`__)

5. Set the COMPANY ADDR1 ADDR2 LICENCE EXPIRE CODE parameters using the
   license key supplied to you by Syspertec.

1. Run the job ASMTCT in the VIRTEL CNTL library to assemble VIRTCT01
   into VIRT453.LOADLIB.

2. Edit member ARBOLOAD in the VIRTEL CNTL library:

1. Change LANG=EN to LANG=FR if French language is desired

2. Set LOAD= the name of your VIRTEL LOADLIB

3. Set SAMP= the name of your VIRTEL SAMPLIB

4. Set ARBO= the name of your VIRTEL ARBO file

5. Set VTAMLST= the name of a your VIRTEL CNTL library. The job will
   create a sample VTAMLST member in this library.

6. CHANGE ALL 'DBDCCICS' 'xxxxxx'

    where xxxxxx is the APPLID of your CICS system.

1. Sf you changed the APPLID of VIRTEL in step 4 from its default value
   VIRTEL, then you must also change the ACBNAME= parameter in step
   VTAMDEF near the end of the ARBOLOAD job. The value of ACBNAME= in
   ARBOLOAD must match the value of APPLID= in VIRTCT01.

    Submit the ARBOLOAD job. This creates your VIRTEL configuration (the
    ARBO file) and a sample VTAMLST member VIRTAPPL.

    Note: If you need to rerun the ARBOLOAD job, you must change
    PARM='LOAD,NOREPL' to PARM='LOAD,REPL'

    If you wish to completely start over from the beginning, you can run
    the job ARBOBASE to delete and reinitialize the ARBO file, followed
    by a rerun of the ARBOLOAD job.

1. Submit the job ASMMOD from the VIRTEL CNTL library. This job
   assembles the VIRTEL logon mode table (MODVIRT) into your
   SYS1.VTAMLIB dataset. You will need to set the QUAL= parameter to
   match the high-level qualifiers of your SAMPLIB dataset.

2. Copy the VIRTAPPL member (created by the ARBOLOAD job in step 8) from
   the VIRTEL CNTL library into your SYS1.VTAMLST dataset. Now activate
   the VTAMLST member using this command:

    V NET,ACT,ID=VIRTAPPL

1. Edit the procedure VIRTEL4 in your VIRTEL CNTL library so that the
   high-level qualifiers match the names you used when you loaded the
   files in step 4. Copy the procedure to your system PROCLIB, renaming
   it as VIRTEL.

2. Ask your security administrator to create a userid for the VIRTEL
   started task, and to authorize this userid to access the datasets you
   created in step 3. This userid must also have an OMVS segment which
   authorizes VIRTEL to use TCP/IP. Your security administrator can use
   the job RACFSTC in the VIRTEL SAMPLIB as an example.

3. Start VIRTEL

4. You can now logon to VIRTEL from a 3270 terminal using the APPLID
   specified in the VIRTCT01, and you can display the VIRTEL Web Access
   menu in your web browser using URL http://n.n.n.n:41001 where n.n.n.n
   is the IP address of your z/OS system.

5. Apply any "update"maintenance from the file virtel453updtnnnn.zip
   file according the instructions in theReadme- updtnnnn.txt file
   included in the zip file. If the zip file does not exist, skip this
   step.

6. The supplied system is configured with security disabled. If you
   wish, you can activate external security using RACF, ACF2, or TOP
   SECRET; please refer to the “security chapter”, page 0.

Installing VIRTEL under VSE
===========================

    Installation of VIRTEL under VSE consists of the following steps.
    Each step is described in detail in the sections which follow.

-  Load the installation jobs into the POWER READER QUEUE

-  Define the VIRT453.SUBLIB sublibrary

-  Load the CIL and SSL libraries

-  Define the files VIRARBO, VIRSWAP and VIRSTAT

-  Define the files VIRCMP3, VIRCAPT and SAMPTRF

-  Define the files HTMLTRF and VIRHTML

-  Assemble the VIRTCT

-  Assemble the VTAM mode table

-  Update the VIRARBO file (ARBOLOAD)

-  Define the VTAM application relays

-  Define the VIRTEL start procedure

    The installation jobs are delivered on an unlabeled 3480 tape
    cartridge. To load the installation jobs into the POWER reader
    queue, enter the command S RDR,cuu at the VSE console (where cuu
    represents the address of the tape drive on which you have mounted
    the cartridge). The following jobs will be loaded into your Reader
    Queue with DISP=L, CLASS=0:

VIRTLIB
-------

    define the VIRT453.SUBLIB sublibrary

VIRTCIL
-------

    load executable modules into the CIL

VIRTSSL
-------

    load source modules into the SSL

VIRAPI
------

    load the VIRAPI macro library

VIRFA29
-------

    load the FA29 macro library

VIRSAPI
-------

    load the SCRNAPI macro library

VIRTVS
------

    define the VSAM files, comprising the following steps:

VIRTVS1
-------

    define VIRARBO and VIRSWAP files

VIRTVS2
-------

    initialise VIRARBO file

VIRTVS3
-------

    define VIRSTAT file

VIRTVS4
-------

    define VIRCMP3 file

VIRTVS5
-------

    define VIRCAPT file

VIRTVS6
-------

    define SAMPTRF file

VIRTVS7
-------

    define HTMLTRF file

VIRTVS8
-------

    load SAMPTRF file

VIRTVS9
-------

    define VIRHTML file

VIRTCT
------

    VIRTEL parameter table assembly example

VIRCONF
-------

    VIRARBO batch update (ARBOLOAD)

VIRMOD
------

    VTAM mode table assembly

VIRTAPPL
--------

    VTAM application major node example

VIRGROUP
--------

    CICS resource definition example

VIRTEL
------

    VIRTEL execution JCL example

    Note: You will need to modify certain of the installation jobs
    before submitting them. Once the jobs have been read onto the POWER
    queue, you can copy them to an ICCF library (using ICCF option 3224
    Operations - Manage Batch Queues – Input Queue – Copy to Primary
    Library) or read them into your VM machine for editing.

    Jobs VIRTLIB, VIRTCIL, VIRTSSL, VIRTVS, VIRTCT, VIRMOD, and VIRTAPPL
    must be executed as described below.

    Execute jobs VIRTLIB, VIRTCIL and VIRTSSL to create a new
    VIRT453.SUBLIB. Change your VIRTEL execution JCL to reference the
    new sublibrary You can retain your existing VSAM files.

    The files required for VIRTEL Web Access base functions are loaded
    in steps VIRTVS6, VIRTVS7, VIRTVS8, and VIRTVS9 of job VIRTVS. If
    you wish to use VIRTEL Host-Web Services to script your 3270
    applications, run job VIRSAPI also.

    Customers wishing to use VIRTEL Application-to-Application functions
    should also run jobs VIRFA29 and VIRAPI.

    *VIRTLIB : JCL to define the sublibrary (VSE)*

    Job VIRTLIB contains an example of JCL to define the library which
    will contain the VIRTEL executable modules and source books. This
    job is provided as an example, and may need to be modified prior to
    execution. The name VIRTnnn.SUBLIB indicates the VIRTEL version, for
    example VIRT453.SUBLIB for version 4.53. Parameters VOLUMES(SYSWK1),
    and possibly the cluster name and catalog name, may need to be
    modified.

    *VIRTCIL : JCL to load the executable modules (VSE)*

    Start the job to load the executable modules by entering the POWER
    command R RDR,VIRTCIL

    When this job executes, a // PAUSE card will ask you to enter a
    LIBDEF statement to specify the name of the library into which the
    modules are to be loaded. Enter // LIBDEF PHASE,CATALOG=xxxxx where
    xxxxx represents the name of the sublibrary you defined in the
    previous job.

    *VIRTSSL : JCL to load the source modules (VSE)*

    Start the job to load the source modules by entering the POWER
    command R RDR,VIRTSSL followed by R RDR,VIRFA29 then R RDR,VIRAPI
    and R RDR,VIRSAPI as necessary.

    When these jobs execute, a // PAUSE card will ask you to enter a
    SETPARM statement specifying the name of the library into which the
    modules are to be loaded. Enter // SETPARM SUB='xxxxxxx' where
    xxxxxxx represents the name of the sublibrary you defined in the
    first job.

    *VIRFA29 : JCL to load the FA29 macros (VSE)*

    *VIRAPI : JCL to load the VIRAPI macros (VSE)*

    *VIRSAPI : JCL to load the SCRNAPI macros (VSE)*

    // JOB VIRTVS

    // SETPARM TAPE=590

    \*
    \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

-  \* AT THE PAUSE, ENTER THE UNIT ADDRESS OF THE TAPE DRIVE \*

-  \* FOR THE VIRTEL INSTALLATION TAPE \*

    \* \* \*

-  \* EXAMPLE: // SETPARM TAPE=590 \*

    \* \* \*

    \*
    \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

    // PAUSE ENTER YOUR SETPARM CARD AS SHOWN ABOVE

    \*
    \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

-  \* VIRTVS1 \* DEFINITION OF VIRARBO AND VIRSWAP FILES \*

    \*
    \*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*\*

    // DLBL IJSYSUC,'VSESP.USER.CATALOG',,VSAM

    // EXEC IDCAMS,SIZE=AUTO

    DELETE (VIRTEL.ARBO ) -

    CLUSTER - PURGE -

    CATALOG (VSESP.USER.CATALOG ) SET MAXCC=0

    DEFINE CLUSTER ( -

    NAME (VIRTEL.ARBO ) -

    RECORDS(500 100) -

    SHAREOPTIONS (4 3) -

    RECSZ (600 4089) - VOLUMES (SYSWK1) - KEYS (9 0) -

    TO (99366))-

DATA (NAME (VIRTEL.ARBO.DATA )) -

    INDEX (NAME (VIRTEL.ARBO.INDEX )) - CATALOG (VSESP.USER.CATALOG )

    IF LASTCC NE 0 THEN CANCEL JOB

    DELETE (VIRTEL.SWAP ) -

    CLUSTER - PURGE -

    CATALOG (VSESP.USER.CATALOG ) SET MAXCC=0

    DEFINE CLUSTER ( -

    NAME (VIRTEL.SWAP ) -

    RECORDS(200 50) -

    SHAREOPTIONS (2 3) -

    RECSZ (600 4089) - VOLUMES (SYSWK1) -

    *VIRTVS1 : JCL to define the VIRARBO and VIRSWAP files (VSE)*

    Step VIRTVS1 of job VIRTVS contains an example of defining the
    VIRARBO and VIRSWAP files. This job is provided as an example, and
    may need to be modified prior to execution. The parameters SETPARM
    TAPE=590 and VOLUMES(SYSWK1), and possible the catalog name, may
    need to be modified.

    *VIRTVS2 : JCL to initialise the VIRARBO file (VSE)*

    Step VIRTVS2 of job VIRTVS loads the base configuration definitions
    into the VIRARBO file. The default language is English. To load the
    French language version of the base configuration, change the // MTC
    FSF,SYS004,2 card to // MTC FSF,SYS004,1 before submitting this job.

    *VIRTVS3 : JCL to define the VIRSTAT file (VSE)*

    Step VIRTVS3 of job VIRTVS contains an example of defining the
    VIRSTAT file. This job is provided as an example, and may need to be
    modified prior to execution. The VIRSTAT file is required unless the
    STATS parameter of the VIRTCT is set to NO.

    *VIRTVS4 : JCL to define the VIRCMP3 file (VSE)*

    Step VIRTVS4 of job VIRTVS contains an example of defining the
    VIRCMP3 file. This job is provided as an example, and may need to be
    modified prior to execution. The VIRCMP3 file is used by the level 3
    compression feature of VIRTEL/PC, and is required unless the COMPR3
    parameter of the VIRTCT is set to NO.

    *VIRTVS5 : JCL to define the VIRCAPT file (VSE)*

    Step VIRTVS5 of job VIRTVS contains an example of defining the
    VIRCAPT file. This job is provided as an example, and may need to be
    modified prior to execution. The VIRCAPT file is used by the
    videotext page capture feature, and is referenced by the FCAPT
    parameter of the VIRTCT.

    *VIRTVS6 : JCL to define the SAMPTRF file (VSE)*

    Step VIRTVS6 of job VIRTVS contains an example of defining the
    SAMPTRF file. This job is provided as an example, and may need to be
    modified prior to execution. The SAMPTRF file contains sample HTML
    page templates and other elements for the VIRTEL Web Access feature,
    and is referenced by the UFILEx parameter of the VIRTCT.

    *VIRTVS7 : JCL to define the HTMLTRF file (VSE)*

    Step VIRTVS7 of job VIRTVS contains an example of defining the
    HTMLTRF file. This job is provided as an example, and may need to be
    modified prior to execution. The HTMLTRF file is used by the VIRTEL
    Web Access feature to store HTML pages, and is referenced by the
    UFILEx parameter of the VIRTCT.

    *VIRTVS8 : JCL to load the SAMPTRF file (VSE)*

    Step VIRTVS8 of job VIRTVS contains and example of the JCL required
    to load the sample HTML pages into the SAMPTRF file. This job is
    required for sites using VIRTEL Web Access.

    *VIRTVS9 : JCL to define the VIRHTML file (VSE)*

    Step VIRTVS9 of job VIRTVS contains an example of defining the
    VIRHTML file. This job is provided as an example, and may need to be
    modified prior to execution. The VIRHTML file is used by the VIRTEL
    Web Access feature to store the names of E-mail correspondents, and
    is referenced by the HTVSAM parameter of the VIRTCT.

    Job VIRTCTUS contains an example of assembling the VIRTEL parameter
    table (the VIRTCT). Since the VIRTCT parameters are common across
    the VSE, MVS and VM environments, please refer to section VIRTCT 47.

    Users in France should use job VIRTCTFR instead of VIRTCTUS

    *VIRMOD : Assembling the MODVIRT mode table (VSE)*

    Job VIRMOD contains an example of the JCL required to assemble the
    VTAM mode table (MODVIRT) supplied with VIRTEL.

    *VIRCONF : ARBOLOAD job to update the VIRARBO file (VSE)*

    Job VIRCONF contains an example of a job to load configuration
    elements into the VIRARBO file. This is the equivalent of the MVS
    job known as ARBOLOAD. Before running this job, you will need to
    make the following modifications:

-  Select the desired features (for example, WEB=YES, XOT=YES)

-  Change all ‘DBDCCICS’ to the APPLID of your CICS system

    Users in France may also change LANG=EN to LANG=FR to generate
    French language versions of the configuration elements

    *VIRTAPPL : Cataloging the application major node (VSE)*

    Job VIRTAPPL contains an example of cataloging the VTAM application
    book. The VTAM application node VIRTAPPL must be activated before
    starting VIRTEL. This job is provided as an example, and may need to
    be modified prior to execution.

    *VIRGROUP : Defining the CICS resources (VSE)*

    Job VIRGROUP contains an example of defining the the CICS resources
    which are correspond to the relays and virtual printers used by
    VIRTEL Web Access. This job is provided as an example, and may need
    to be modified prior to execution.

    Job VIRTEL contains an example of the VSE startup JCL for VIRTEL.
    Program VIR0000 reads a parameter card indicating the suffix of the
    VIRTCT to be used. This suffix must be two characters long and must
    start in column 1 of the parameter card. In the example supplied,
    the suffix is 01, indicating that parameter table VIRTCT01 is to be
    used. The TCT suffix may optionally be followed by a comma and the
    VTAM APPLID. If the APPLID is not specified then the value in the
    VIRTCT is used.

    The partition used must have a size of at least 1.5MB and must have
    1MB of GETVIS. The priority of the VIRTEL partition must be
    immediately below that of VTAM.

    *VIRTEL startup JCL (VSE)*

    If you have more than one TCP/IP stack, you can use the OPTION
    SYSPARM='nn' statement to specify the ID of the TCP/ IP stack.
    VIRTEL will attempt to connect to the TCP/IP partition which has
    PARM='ID=nn' in its JCL. If OPTION is not specified, VIRTEL will
    attempt to connect to the default TCP/IP whose ID is 00.

    To stop VIRTEL, enter the command:

    MSG xx,DATA=STOP

    where xx is the identifier of the partition in which VIRTEL is
    running.

    Under certain circumstances it may be necessary to apply maintenance
    in the form of PTFs. These may be distributed either by e-mail, or
    on a 3480 cartridge.

    PTFs are supplied on an unlabeled tape. The tape contains the PTFs
    to be applied at your site and has been generated by DITTO. The
    record length is 81 and the blocksize is 8100. To load the PTFs from
    the tape, enter the command DITTO TC cuu where cuu is the address of
    your tape unit. The contents of the tape will be placed in the VSE
    Punch. Copy the contents of the Punch into a library and add the
    necessary execution JCL before submitting the job.

    To apply the PTFs, use the following JCL:

    *JCL for applying PTFs (VSE)*

VTAM parameters
===============

    This section describes the VTAM definitions required for VIRTEL. The
    same definitions are used in both the MVS and VSE environments.

    The primary ACB is defined by means of a VTAM APPL statement:

applnamere
----------

    presents the name of the ACB as it is defined in the APPLID
    statement of the VIRTCT.

    An example of a VTAM application node is provided in member VIRTAPPL
    of the VIRTEL SAMPLIB dataset for MVS, or in the VIRTAPPL
    installation job for VSE.

    Each terminal which logs on to a VTAM application via VIRTEL
    requires an application relay. An application relay is a VTAM LU,
    defined by means of a VTAM APPL card, which VIRTEL uses to represent
    the terminal when connecting to the VTAM application. These APPL
    cards are defined as follows:

relaynam
--------

    Represents the name of the relay associated with the terminal. This
    name must match the name specified in the “Relay” field of the
    VIRTEL terminal definition.

tablenam
--------

    Is the name of the logon mode table. For VIRTEL Web Access, use the
    standard IBM-supplied table ISTINCLM. For other types of relay, use
    the MODVIRT table supplied by VIRTEL.

modename
--------

    Is the name of the LOGMODE to be used for communication with the
    host application. For VIRTEL Web Access, use a standard IBM-supplied
    logmode such as SNX32702. For 3270 emulation via Minitel, use
    DLOGREL which is defined in the MODVIRT table supplied by VIRTEL.

EAS=1
-----

    Since each application relay only uses one session, specification of
    this parameter may reduce common area storage requirements.

    If you intend to use Minitel, X25, or APPC, then a mode table named
    MODVIRT must be assembled and link-edited into the library from
    which VTAM loads its mode tables. For MVS, a sample job is provided
    in the ASMMOD member of the VIRTEL SAMPLIB. For VSE, sample JCL is
    provided in the VIRMOD installation job.

    The source for the MODVIRT mode table is defined as follows:

    *VTAM logon mode table MODVIRT*

    For Minitel and VIRTEL/PC it may be necessary to provide a
    customized USS table in the VTAM library. An example USS table is
    shown in the figure below. A USS table is not necessary for VIRTEL
    Web Access access.

    *VTAM USS table*

    When a Minitel or VIRTEL Web Access terminal logs on via VIRTEL to
    CICS, the application relay LU represents the terminal as seen by
    CICS. The relay LU must therefore be referenced in the CICS CSD
    file, or alternatively configured by the AUTOINSTALL program of your
    site that will decide which TYPETERM to assign to which relay.

    The following example shows CSD definitions for VIRTEL Web Access
    terminals. The NETNAME parameter must match the “Relay” name
    specified in the definition of the VIRTEL terminals attached to the
    HTTP line. For more details, refer to the section entitled
    “Definition of an HTTP line” in the VIRTEL Configuration Reference
    documentation.

    *CICS definitions for VIRTEL Web Access terminals*

    In order to access CICS applications, each Minitel must have an
    entry defined in the TCT or CSD. Specify the name of the relay LU
    associated with the terminal on the NETNAME parameter in the
    terminal definition.

    It is recommended that you do not use automatic initialisation of
    the 'good morning' message in the CICS TCT as it may conflict with
    VIRTEL’s ability to call a specific CICS transaction.

    FOrmfeed ==> No No ! Yes

    HOrizform ==> No No ! Yes

    VErticalform ==> No No ! Yes

    TEXTKybd ==> No No ! Yes

    TEXTPrint ==> No No ! Yes

    Query ==> No No ! Cold ! All

    OUtline ==> No No ! Yes

    SOsi ==> No No ! Yes

    BAcktrans ==> No No ! Yes CGcsgid ==> 00000 , 00000 0-65535

    SESSION PROPERTIES

    AScii ==> No No ! 7 ! 8

    SENdsize ==> 00000 0-30720

    RECEivesize ==> 00256 0-30720

    BRacket : Yes Yes ! No LOGMode ==>

    DIAGNOSTIC DISPLAY

    ERRLastline ==> No No ! Yes

    ERRIntensify ==> No No ! Yes ERRColor ==> NO

    ERRHilight ==> No No ! Blink !Reverse !Und OPERATIONAL PROPERTIES

    AUTOConnect ==> No No ! Yes ! All

    ATi ==> Yes No ! Yes

    TTi ==> Yes Yes ! No

    CReatesess ==> Yes No ! Yes

    RELreq ==> Yes No ! Yes

    DIscreq ==> Yes Yes ! No

    Nepclass ==> 000 0-255

    SIgnoff ==> Yes Yes ! No ! Logoff

    Xrfsignoff ==> Noforce Noforce ! Force MESSAGE RECEIVING PROPERTIES

    ROutedmsgs ==> All ! None ! Specific

    LOGOnmsg ==> No No ! Yes APPLICATION FEATURES

    BUildchain : Yes No ! Yes

    USerarealen ==> 0 0-255

    Ioarealen ==> 04096 , 04096 0-32767

    UCtran ==> Yes No ! Yes ! Tranid RECOVERY

    RECOVOption ==> Sysdefault
    Sysdefault!Clearconv!Releasesess!Uncondrel!None RECOVNotify ==> None
    None ! Message

    OVERTYPE TO MODIFY CICS RELEASE=0330

    CEDA ALter

    TErminal : I408

    Group : VIRTEL Description ==>

    AUTINSTModel ==> No No ! Yes ! Only AUTINSTName ==>

    TERMINAL IDENTIFIERS

    TYpeterm ==> VIRTMINI

    NEtname ==> VIRMI408

    CONSOle ==> No No ! 0-127 ! 129-250 CONSName ==>

    REMOTESystem ==> REMOTEName ==>

    Modename ==> ASSOCIATED PRINTERS

    PRINTER ==>

    PRINTERCopy ==> No No ! Yes ALTPRINTEr ==>

    ALTPRINTCopy ==> No No ! Yes PIPELINE PROPERTIES

+---------------------+--------------+--------------------+
|     POol            |     ==>      |                    |
+=====================+==============+====================+
|     TAsklimit       |     ==> No   |     No ! 1-32767   |
+---------------------+--------------+--------------------+
| OPERATOR DEFAULTS   |
+---------------------+--------------+--------------------+
|     OPERId          |     :        |                    |
+---------------------+--------------+--------------------+
|     OPERPriority    |     : 000    |     0-255          |
+---------------------+--------------+--------------------+
|     OPERRsl         |     : 0      |     0-24,          |
+---------------------+--------------+--------------------+

! Mixidpe

    *CICS definitions for Minitel terminals*

VIRTCT
======

    All the general information necessary for VIRTEL to run is contained
    in a table known as the VIRTCT. After initialising the different
    parameters, this table must be assembled and link edited with the
    name VIRTCTxx, where xx are the two characters that identify the
    VIRTCT at start up time to the system. This xx value will be
    contained in the parameter of the PARM operand of the VIRTEL start
    procedure in MVS, or behind the EXEC card in the VSE environment.

    The VIRTCT must be assembled before VIRTEL can be run. At the time
    of the assembly the VIRTEL macro library VIRT4XX.MACLIB must be
    on-line. Options RENT and REUS must not be specified when assembling
    the VIRTCT for an MVS environment. The resulting phase or load
    module must be placed in the library containing the other phases or
    load modules required by VIRTEL.

    For MVS, a sample VIRTCT source member is provided in the VIRTCT01
    member of the VIRTEL SAMPLIB, and the assembly and link-edit JCL is
    in member ASMTCT. For VSE, a sample VIRTCT with assembly and
    link-edit JCL is in the VIRTCT installation job.

    Some parameters have a default value taken by VIRTEL and do not need
    to be coded in your table.

YES
---

    Terminals not defined in VIRTEL may be connected in ACCUEIL mode.
    That means the terminals will have access to all functions,
    excepting dialogue with another application (relay). The maximum
    number of terminals accepted in ACCUEIL mode is a function of the
    parameter of the operand NBDYNAM.

NO
--

    Terminals not defined in VIRTEL may not be connected.

KEEP
----

    Allows the Multi-Session screen to be used as a dynamic USSTAB
    without the terminals being associated with the application relays
    (See the heading ‘Using the dynamic USSTAB’ in the ‘VIRTEL
    Multi-Session’ chapter only available in French)

    The address line 1 of the client as specified in the key at the time
    of installation. This parameter is unique to each client and
    functions in relation to the following parameters ADDR2, COMPANY,
    LICENSE, EXPIRE and CODE

    The address line 2 of the client as specified in the key at the time
    of installation. This parameter is unique to each client and
    functions in relation to the following parameters ADDR1, COMPANY,
    LICENSE, EXPIRE and CODE

    This parameter determines the value returned by the
    APPLICATION-IS-CONNECTED condition of the CREATE-VARIABLE- IF tag
    (see “Signon and password management” in the VIRTEL Web Access
    Guide). This in turn affects the window title of the VIRTEL Web
    Access screen. The following values are possible:

APPLID
------

    The tag returns the VTAM applid of the host application.

TRANSACT
--------

    The tag returns the external name of the VIRTEL transaction used to
    access the host application.

xx
--

    The 3270 AID function key which will be transmitted to the
    application when the Minitel user presses the [ANNULATION] key. This
    parameter allows the user to define a general parameter by default
    which may be modified in the definition of the sub-server nodes.

    ANNUL=00 allows the cursor to be placed at the start of the field
    with erasure of the field.

nappl
-----

    The name of the primary VIRTEL ACB.

    The APPLID parameter specifies the label or ACBNAME parameter of the
    VTAM APPL for the primary VIRTEL ACB. The value specified here can
    be overridden in the VIRTEL startup JCL (se`e “Executing VIRTEL in
    an MVS environment”, <#_bookmark22>`__ `page 21 <#_bookmark22>`__ or
    `“Executing VIRTEL in a VSE environment”, page 39 <#_bookmark50>`__
    for details).

    When no primary VTAM ACB is required (for example, in the VIRTCT for
    a VIRTEL Batch job), then this parameter may be coded as
    APPLID=\*NOAPPL\*

    If SYSPLUS=YES is specified, a '+' character in the APPLID will be
    replaced by the value of the SYSCLONE system symbol. SYSCLONE is
    specified in the IEASYMxx member of SYS1.PARMLIB, and identifies the
    particular LPAR that VIRTEL is running on in a sysplex environment.

YES
---

    The status of the applications (active or non active) is tested at
    the time of access to the VIRTEL Web Access Application Selection
    Menu and the VIRTEL Multi-Session screen. For VIRTEL Web Access the
    status of each application is indicated by a color (see “Application
    Selection Menu” in the VIRTEL Web Access Guide). For VIRTEL
    Multi-Session the test is based on the value contained in the
    “STATUS” field of the application definition screen. The function
    key allowing access to the application will only appear if the
    application is active.

NO
--

    The function key allowing access to the application is always
    present.

YES
---

    The program for managing the Minitel tree structure will function as
    a VIRTEL internal sub-application.

NO
--

    The tree structure management software will not function.

    This parameter defines the batch processing characteristics for all
    lines which specify type BATCH1.

indd
----

    The batch input DD name (for example, SYSIN).

indcb
-----

    The label of the DCB macro defining the batch input file. This DCB
    macro must appear later in the VIRTCT (see `“Additional parameters
    for batch files”, page 78 <#_bookmark306>`__).

outdd
-----

    The batch output DD name (for example, SYSPRINT).

outdcb
------

    The label of the DCB macro defining the batch output file. This DCB
    macro must appear later in the VIRTCT (see `“Additional parameters
    for batch files”, page 78 <#_bookmark306>`__).

    This parameter defines the batch processing characteristics for all
    lines which specify type BATCH2. The subparameters are the same as
    those of the BATCH1 parameter.

n
-

    Size of VSAM buffer (“CI size”) used by VIRTEL for reading files
    such as GTVSAM. As a general rule, this value is calculated by
    VIRTEL and should not be modified. The size is normally 8192.

n
-

    The number of VSAM buffers in the pool allocated for file access.

n
-

    The size of the largest VTAM message that may pass through VIRTEL.
    Generally this value should not be modified. The size is generally
    8192.

    The CHARSET parameter allows tables of non-standard character sets
    to be loaded into VIRTEL at startup time. DBCS tables, because of
    their size, are not loaded by default into VIRTEL and must be
    explicitly requested using this parameter. The standard and
    non-standard tables are used for EBCDIC - UTF-8 translation and can
    be specified by the SET-OUTPUT-ENCODING-UTF-8 tag and by the DEFUTF8
    parameter of the VIRTCT. Refer to the description of the DEFUTF8
    parameter 55 for the list of standard tables which are always loaded
    into VIRTEL.

charset
-------

    The following non-standard tables can be loaded:

-  IBM933A: Korean host mixed

-  IBM1364: Korean host mixed extended

-  IBM1388: Chinese simplified SBCS et DBCS

-  IBM1390: Japanese Katakana-Kanji

-  IBM1399: Japanese Latin-Kanji

xxxxxxx
-------

    Is the code calculated for the client as it is specified in the
    installation key at the time of the installation. This code is
    unique for each client and functions in relation to the following
    parameters: ADDR1, ADDR2, COMPANY, LICENSE, and EXPIRE.

    The name of the company as it is specified in the installation key
    at the time of the installation. This code is unique for each client
    and functions in relation to the following parameters: ADDR1, ADDR2,
    LICENSE, EXPIRE and CODE.

NO
--

    Level 3 compression for PC’s will not be used.

AUTO
----

    Level 3 compression for PC’s will be used. VIRTEL will run in
    learning mode as well as processing screen types.

FIXED
-----

    Level 3 compression for PC’s will be used. VIRTEL will only run
    processing screen types.

xx
--

    The 3270 AID function key which will be transmitted to the
    application when the Minitel user presses the [CORRECTION] key in a
    blank field.

    CORRECT=00 places the cursor at the start of the field without
    sending anything to the application.

xxx
---

    Country name indicating which translation table is to be used for
    translation between EBCDIC and ASCII when UTF-8 is not specified.

    Possible values are:

+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+
+----+----+----+----+

    Note: The values shown in parentheses in the table above are
    accepted for compatibility with previous versions of VIRTEL.

    The COUNTRY parameter is not used when displaying web pages which
    contain a {{{SET-OUTPUT-ENCODING-UTF-8}}} tag. In this case VIRTEL
    uses an EBCDIC-to-UTF-8 translate table determined by the “DEFUTF8
    parameter”, page 0 or specified in the tag itself.

    This parameter defines the characteristics of the encryption
    performed by VIRTEL for page templates which specify the
    cryptographic identifier name1.

name1
-----

    A name which serves to identify this set of encryption parameters.
    This name will be referenced in the PUBLIC-KEY and
    ENCRYPTION-PARAMETERS tags in the HTML page template which uses
    encrypted fields.

algs
----

    The symmetric encryption algorithm to be used by VIRTEL for data
    encryption. The following values can be specified:

NONE
----

    (default value) No encryption

DES
---

    Data Encryption Standard (8 byte key)

2TDEA
-----

    Triple Data Encryption Algorithm, keying option 2 (16 byte key)

3TDEA
-----

    Triple Data Encryption Algorithm, keying option 3 (24 byte key)

AES-128
-------

    Advanced Encryption Standard, key size 128 bits (16 byte key)

AES-192
-------

    Advanced Encryption Standard, key size 192 bits (24 byte key)

AES-256
-------

    Advanced Encryption Standard, key size 256 bits (32 byte key)

    Note: in this version of VIRTEL, only NONE, DES, 2TDEA, and 3TDEA
    are supported

algp
----

    The asymmetric encryption algorithm to be used by VIRTEL for
    encryption of session keys. The following values can be specified:

NONE
----

    (default value) No encryption

RSA-512
-------

    RSA public key encryption (512 bit key)

RSA-1024
--------

    RSA public key encryption (1024 bit key)

RSA-2048
--------

    RSA public key encryption (2048 bit key)

RSA-4096
--------

    RSA public key encryption (4096 bit key)

    Note: in this version of VIRTEL, only NONE, RSA-512, and RSA-1024
    are supported

engine
------

    The name of the encryption engine to be used. The following values
    can be specified:

ICSF
----

    VIRTEL uses the Integrated Cryptographic Service Facility of z/OS

NO-ENCRYPTION
-------------

    (default value) VIRTEL uses an internal null-encryption engine. In
    this case, NONE must be specified or defaulted for the cryptographic
    algorithms.

encoding
--------

    The representation which VIRTEL will use for encrypted text. The
    following values can be specified:

HEX
---

    (default value) Encrypted data is represented in hexadecimal

BASE64
------

    Encrypted data is represented in base64 format Note: in this version
    of VIRTEL, only HEX is supported

chaining
--------

    The chaining method to be used for symmetric encryption. The
    following values can be specified:

CBC
---

    (default value) Cipher block chaining will be used

ECB
---

    Electronic codebook will be used

    Note: in this version of VIRTEL, only CBC is supported

padding
-------

    The padding method to be used for symmetric encryption. The
    following values can be specified:

PKCS7
-----

    (default value) Public Key Cryptographic Standard #7 padding

X9.23
-----

    ANSI X9.23 padding method

ISO10126
--------

    Padding method using random padding bytes

    Note: in this version of VIRTEL, only PKCS7 is supported

    This parameter defines the characteristics of the encryption
    performed by VIRTEL for page templates which specify the
    cryptographic identifier name2. The subparameters are the same as
    those of CRYPT1.

xxxxxxxx
--------

    The name of the entry point taken by default at connection time by a
    3270 terminal. This parameter may for example be used for 3270
    connections functioning in ACCUEIL mode.

yyyyyyyy
--------

    The name of the default entry point for X25 asynchronous
    connections.

xxxxxxx
-------

    Name of the default character set for EBCDIC to UTF-8 translation.
    This character set is used when an HTML or XML page contains a
    SET-OUTPUT-ENCODING-UTF-8 tag without a character set name. Any one
    of the following values may be specified:

+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+
+----+----+

    The values listed above are the names of the standard tables which
    are always available in VIRTEL. Additional tables may be loaded at
    startup time by means of the “CHARSET parameter”, page 0.

xx
--

    Hex code of the character of the 3270 keyboard that will be used to
    switch directly from one session to another. If DIRECT=00 then this
    function will be disabled.

YES
---

    VIRTEL will attempt to set itself non-swappable. This option is only
    available if VIRTEL is run from an APF-authorized library.

NO
--

    VIRTEL remains swappable

    Note: When VIRTEL is executed via program VIR6000, it is always
    non-swappable

xx
--

    Is the name of the VIREXxx module that will be called to process an
    incoming call packet. This exit will only function for lines running
    in GATE mode.

xx
--

    Is the name of the VIREXxx module that will be called when a Minitel
    sub-server node connects. If the line used is set to GATE mode this
    exit will process call packet CUD.

xx
--

    Is the name of the VIREXxx module that will be called at connection
    time to a VTAM application from a multi-session screen.

xx
--

    Is the name of the VIREXxx module that will be used to filter
    messages when a VTAM application is accessed either from the
    multi-session screen or from a Minitel sub-server node.

xx
--

    Is the name of the VIREXxx module that will be called to process
    outgoing call packets.

xx
--

    Is the name of the VIREXxx module that will be called to process
    messages bound for host applications.

xx
--

    Is the name of the VIREXxx module that will be used to calculate the
    connection costs for external server calls.

xx
--

    Is the name of the VIREXxx module that will be used to process the
    incoming call connection packet for the HTTP server.

(YYYY,MM,JJ)
------------

    Is the expiry date of the contract specified in the key at
    installation time. This parameter is unique for each client and
    functions in relation with the following parameters: ADDR1, ADDR2,
    COMPANY, LICENSE and CODE.

    This parameter specifies whether VIRTEL will use the Fast Connect
    mode of NPSI for X25 communications.

YES
---

    Indicates that Fast Connect mode will be used

NO
--

    Indicates that Fast Connect mode will not be used.

xxxxxxx
-------

    Is the DD name of the file used to save screen images captured
    during an external server call. To enable the screen image capture
    facility, specify FCAPT=VIRCAPT and include a VIRCAPT DD/DLBL
    statement in the VIRTEL JCL procedure. If the FCAPT parameter is
    omitted, the screen image capture facility is disabled.

xxxxxxx
-------

    Indicates the DD name of the file containing the screen types used
    in level 3 compression. To enable the level 3 compression facility,
    specify FCMP3=VIRCMP3 and include a VIRCMP3 DD/DLBL statement in the
    VIRTEL JCL procedure. The COMPR3 parameter specifies the type of
    compression. If COMPR3=NO is specified then the FCMP3 parameter is
    ignored and the VIRCMP3 file is not required.

GENERAL
-------

    Activates support for all types of terminal.

NO
--

    Activates support for incoming Minitel calls only.

    This parameter indicates the timezone adjustments which VIRTEL must
    take into account in order to generate the correct standard
    conformant timestamps in SMTP and HTTP headers. This parameter is
    also used to generate timestamps in local time for the VIRLOG and
    VIRSTAT files.

x
-

    The first subparameter is the number of hours which must be added to
    the system TOD clock value to arrive at GMT. Negative values
    indicate that the TOD clock is ahead of GMT, positive values
    indicate that the TOD clock is behind GMT. For systems which run
    with TOD=GMT this subparameter is 0.

y
-

    The second subparameter is the number of hours which must be added
    to GMT to arrive at the local time. Negative values indicate that
    local time is behind GMT (west), positive values indicate that local
    time is ahead of GMT (east).

    For example, USA EASTERN DAYLIGHT SAVINGS TIME with the TOD clock
    set to GMT should be coded as GMT=(0,-4). If the TOD clock is set to
    CENTRAL EUROPEAN TIME (GMT+1) and the local time is EUROPEAN SUMMER
    TIME (GMT+2) then this parameter should be coded as GMT=(-1,+2).
    GMT=(-1,+1) indicates that both TOD clock and local time are CENTRAL
    EUROPEAN TIME.

    To avoid the need to modify the GMT parameter when daylight savings
    time is in effect, you may specify GMT=SYSTZ or GMT=(x,SYSTZ)

GMT=SYSTZ
---------

    indicates that the TOD clock is set to GMT and that VIRTEL will
    obtain the timezone difference by inspecting the system local time
    offset. For z/OS the local time offset is specified in the CLOCKxx
    member of the system PARMLIB, which may be modified by the SET CLOCK
    command in the event of a transition between winter and summer time.
    For VSE the local time offset is specified by the SET ZONEDEF
    command in the $IPL procedure.

GMT=(x,SYSTZ)
-------------

    indicates that the TOD clock is set to GMT-x, and VIRTEL will use
    the system local time offset to calculate the timezone difference.
    In this case, x is the number of hours which must be added to the
    TOD clock value to arrive at GMT, and VIRTEL considers the local
    time to be GMT + w – x where w is the system local time offset.
    GMT=SYSTZ is equivalent to GMT=(0,SYSTZ).

grname
------

    The VTAM generic resource name for VIRTEL.

    If GRNAME is specified, VIRTEL will identify itself to VTAM using
    the specified generic resource name. The VTAM generic resources
    function allows the assignment of a generic resource name to a group
    of application programs that all provide the same function. VTAM
    automatically distributes sessions among these application programs
    rather than assigning all sessions to a single resource. Note: Use
    of generic resources requires a coupling facility structure.

nn
--

    Indicates the number of GTM map load modules.

xn
--

    Indicates the base screen codes used in the $%F commands of GTM.
    Each code references one of the ‘ym’ prefixes defined in the GTPRFE2
    parameter. The number of codes defined in GTPRFE1 may not exceed the
    number of prefixes defined in the GTPRFE2 parameter.

ym
--

    Indicates base screen prefixes associated with the code ‘xn’ defined
    in the GTPRFE1 parameter. The number of prefixes defined in the
    GTPRFE2 parameter must equal the number of codes defined in GTPRFE1
    + 1; the last position contains the prefix to be used if no code is
    specified in the $%F command or if the specified code does not
    exist.

filename
--------

    Is the name of the VSAM file containing the GTM maps when these are
    contained in a VMO file.

keylen
------

    length of the VSAM key

rkp
---

    position relative to zero of the key in the record

acbcard
-------

    Name of the ACB macro referenced, if the VMO file is described by a
    UFILEn parameter in the VIRTCT.

n
-

    Is the displacement used to localise the data in the VSAM record
    being read.

xx
--

    The 3270 AID function key which will be transmitted to the
    application when the Minitel user presses the [GUIDE] key. This
    parameter allows the definition of a general value by default that
    may be modified when defining the sub- server nodes.

    GUIDE=00 allows the [GUIDE] key to display a pad offering further
    choices.

(proxy1,...)
------------

    Specifies the IP address(es) of one or more proxy servers which
    forward HTTP requests to VIRTEL on behalf of clients. For all
    requests received from these proxies, VIRTEL obtains the client’s IP
    address from the iv-remote-address: or the X-Forwarded-For: HTTP
    header generated by the proxy. This function may also be activated
    on a per-line basis by specifying the proxy address in the “Calling
    DTE” field of a rule (see “Rules” in the VIRTEL Connectivity
    Reference manual).

    Note: IP addresses must include leading zeroes. For example,
    HTFORWD=(192.168.001.020,010.001.001.020)

(h1,h2,...)
-----------

    Specifies the names of up to 5 additional HTTP headers whose value
    is to be made available to scenarios. The names must be specified in
    upper case in this parameter, although the headers in the HTTP
    request may be upper or lower case. Refer to the description of the
    COPY$ SYSTEM-TO-VARIABLE instruction in the VIRTEL Web Access Guide
    for further details.

    The HTMINI parameter allows control over messages sent by VIRTEL Web
    Access applications. Certain applications may send several 3270
    messages which together make up a complete screen. VIRTEL attempts
    to combine such messages into a single transmission to the browser,
    in order to avoid the need for the user to press ENTER to retrieve
    each message sent by the application.

    VIRTEL considers that a message is possibly incomplete if the
    following conditions are true:

-  The flag “restore keyboard” flag is not set in the 3270 WCC

-  The “start printer” flag is not set in the 3270 WCC

-  The message length is less than or equal to len bytes

-  [STRIKEOUT:The message does not contain an “insert cursor” command]
   [R.Bowler : "Text hidden because the presence of an insert cursor
   command no longer inhibits the operation of the HTMINI parameter (see
   updt2717 in Virtel 4.23)"]

    After the arrival of a possibly incomplete message, VIRTEL waits for
    time hundreths of a second. If no other message has arrived during
    this interval, the possibly incomplete message is sent to the
    browser anyway. Otherwise, the possibly incomplete message is
    combined with the following message before sending it to the
    browser.

    This parameter allows you to override various VIRTEL Web Access
    settings. If HTPARM is specified, then all sub- parameters must be
    coded. The sub-parameters are:

n1
--

    HTTP segment size. Do not change from the default value of 30000
    unless advised by VIRTEL support.

n2
--

    Maximum file size (in bytes) allowed for an IND$FILE upload. The
    default value 4096000 permits a maximum upload size of approximately
    4MB. If the size is exceeded the user will see HTTP response code
    “413 Request Entity Too Large”.

    These parameters allow various HTML processing options to be set as
    defaults. Each parameter has the form HTSETx = (option, option, ...)
    where option can take the values listed below:

HTSET1
------

    MAXLENGTH, ID, BLANK-BINARY-ZEROES, HTML-ESCAPES,
    JAVASCRIPT-ESCAPES, XML-ESCAPES, AUTO-INCREMENT- VARIABLES

HTSET2
------

    NO-ADD-TO-CHECKBOX, NO-ADD-TO-LISTBOX, DO-NOT-IGNORE-BINARY-ZEROES

HTSET3
------

    Reserved for future use

HTSET4
------

    Reserved for future use

    These processing options can be enabled or disabled within
    individual page templates via the SET-LOCAL-OPTIONS and
    UNSET-LOCAL-OPTIONS tags. Refer to the description of these tags in
    the VIRTEL Web Access Guide for the further details and for the
    meaning of each option.

xxxxxxxx
--------

    Indicates the DD name in the VIRTEL JCL procedure of the VSAM file
    used to store the names of the e-mail correspondents for VIRTEL Web
    Access applications. Installations using the VIRTEL Web Access
    feature must specify HTVSAM=VIRHTML and include a VIRHTML DD/DLBL
    statement in the VIRTEL JCL procedure. If no HTTP or SMTP lines are
    defined in the VIRTEL configuration, then the HTVSAM parameter may
    be omitted, and the VIRHTML file is not required.

YES
---

    Supports the CEPT1 (Spanish Minitel) standard.

NO
--

    Does not support the CEPT1 standard.

LuMchx
------

    The IGNLU parameter contains a list of line names which are not to
    be activated at VIRTEL startup time.

    Specifies the language in which the VIRTEL administration panels are
    displayed. The following values are possible:

' '
---

    French language.

'E'
---

    English language.

    Note : The apostrophes are required.

    Is the number of the licence attributed to the client as it is
    specified in the installation key at the time of the installation.
    This code is unique for each client and functions in relation to the
    following parameters: ADDR1, ADDR2, COMPANY, EXPIRE and CODE.

n
-

    Inactivity delay in minutes, after which a VIRTEL will lock a
    terminal and request the user to resubmit his password.

xx
--

    Code of the key enabling selection of fields in a Multi-Session copy
    / paste operation. The default key is ‘end of field’

    : Shift PA2.

n
-

    The maximum number of applications or transactions that may appear
    in the VIRTEL Multi-Session screen. The maximum value allowed is 64.

    Indicates the type of memory management used by VIRTEL

BELOW
-----

    Memory managed by VIRTEL, with memory obtained below the 16 megabyte
    line.

ABOVE
-----

    Memory is managed by VIRTEL, with memory obtained above the 16
    megabyte line.

NATIVE
------

    Memory managed by MVS or VSE

TEST
----

    NATIVE plus ability to track memory usage.

    MEMORY=ABOVE is recommended under MVS. MEMORY=(ABOVE,DEBUG) consumes
    more resources and is intended for debugging of memory corruption
    errors. NATIVE may produce a smaller real storage footprint for some
    HTML applications with very large numbers of terminals defined. TEST
    allows monitoring of memory usage by module via sub-application F4.
    TEST also produces a report of allocated memory via the output of
    the SNAP command.

YES
---

    The Minitel environment for outgoing call handling will be
    established.

NO
--

    No Minitels and no outgoing calls.

    This parameter defines the characteristics of the connection to the
    message-queue manager (MQSeries) used by all lines which specify
    type MQ1.

mqmname
-------

    The name of the message-queue manager (for example, CSQ1).

prefix
------

    A prefix which VIRTEL will add to all queue names. The prefix must
    be specified in quotes.

pgmname
-------

    The name of the VIRTEL MQ interface program used for this
    connection. The following values can be specified:

VIR0Q09
-------

    Interface program for MQSeries. This is the default.

    This parameter defines the characteristics of the connection to the
    message-queue manager (MQSeries) used by all lines which specify
    type MQ2. The subparameters are the same as those of the MQ1
    parameter.

YES
---

    Support for VIRTEL Multi-Session environment.

NO
--

    No Multi-Session.

n
-

    The number of logical channels that are available for processing by
    VIRTEL.

t1
--

    The number of 3270 terminals that may connect via a “dynamic
    terminal definition entry” (welcome mode).

t2
--

    The number of Minitel terminals that may connect via a “dynamic
    terminal definition”.

nbterm
------

    Number of terminals envisaged running in VIRTEL. This parameter
    allows the user to estimate the maximum number events that may be
    waiting for service at any one time.

nn
--

    The number of primary tasks waiting events on the primary VIRTEL
    ACB.

    This parameter defines the data which is passed to OTMA/IMSConnect
    in the header of a RESUME TPIPE request. All of the subparameters
    are optional. Missing subparameters are indicated by a comma.

exitname
--------

    The identifier of the OTMA exit routine. Typical values are
    \*SAMPLE\* or \*SAMPL1\*. If omitted, the default value is

    \*SAMPLE\*.

userid, group, password, applname
---------------------------------

    Security parameters which VIRTEL will place in the userid, group,
    password, and application name fields in the RESUME TPIPE header.

n
-

    The number of kilobytes reserved for memory allocation by the
    operating system (e.g. for loading sub application modules). The
    default value of this parameter is calculated when this macro is
    assembled and is indicated by an MNOTE being issued. This value may
    optionally be reduced but a problem may then arise if all functions
    of the sub applications are used.

n
-

    The size of the packets used for transfer over the packet switched
    network.

    This parameter activates PassTicket support in VIRTEL. The following
    values are possible:

YES
---

    VIRTEL may generate PassTickets for VIRTEL transactions which
    specify 1 or 2 in the PassTicket field If the PASSTCK parameter is
    omitted, VIRTEL will not generate PassTickets.

    Allows VIRTEL to run on a pre-zSeries processor. Possible values
    are:

YES
---

    Specifies that the processor is a 9672, MP2000, MP3000, IS/390, or
    P/390. VIRTEL will not use instructions which are only available on
    z900 or later processors. Note: VIRTEL does not support 9672-G1,
    ES/9000, or any earlier processor.

NO
--

    (default) Specifies that VIRTEL may use all instructions available
    on z900 or later processors.

xxxxxxxx
--------

    Indicates the maximum 8 character prefix associated with the
    resources defined in the security management system if using RACF,
    TOP SECRET or ACF2.

YES
---

    Supports protected field (DARK field) for 80 column Minitels with
    PAD=INTEG coded. This parameter must also be specified in NPSI.

NO
--

    No support for the protected field (DARK field) for 80 column
    Minitels if PAD=INTEG.

    The RACAPPL parameter specifies the VIRTEL application name as it is
    known to RACF. When RACAPPL is present in the VIRTCT, VIRTEL will
    add an APPL= parameter to all RACROUTE VERIFY calls. RACF uses this
    application name for two purposes: (1) to validate that the user is
    authorized to access the VIRTEL application (if the RACF APPL class
    is active) and (2) to validate the user’s passticket using the
    PTKTDATA class (if the user signs on to VIRTEL using a passticket
    instead of a password). The possible values are:

NONE (or omitted)
-----------------

    VIRTEL will not use the APPL= parameter on RACROUTE VERIFY calls. In
    this case RACF will use the default application name (MVSxxxx where
    xxxx is the 4-character SMF identifier of the z/OS system)

APPLID
------

    VIRTEL will use the VTAM APPLID of the VIRTEL started task
    (specified in the APPLID parameter of the VIRTCT) as the value of
    the APPL= parameter for RACF.

GRNAME
------

    VIRTEL will use the VTAM generic resource name of the VIRTEL started
    task (specified in the GRNAME parameter of the VIRTCT) as the value
    of the APPL= parameter for RACF. This setting may be useful in a
    sysplex environment. It allows all VIRTEL STCs in the sysplex to
    present the same application name to RACF.

'name'
------

    VIRTEL will use the specified name as the value of the APPL=
    parameter for RACF. The name must be specified in single quotes.

rappl
-----

    Name of the security management resource class which contains the
    applications resources for the Multi-Session function and for
    external servers. The entities in this resource class are external
    servers and VTAM applications. If resource $$ALLSRV is used, then
    all the servers defined in VIRTEL are authorised.

    This parameter specifies the name presented by VIRTEL to the browser
    in the HTTP basic security signon dialog. The possible values are:

TRANSACT
--------

    the external name of the VIRTEL transaction which is requesting
    security. This causes the browser to issue the signon prompt for
    each transaction the first time the transaction is requested in a
    browser session.

APPLID
------

    the VTAM APPLID of the VIRTEL started task. With this setting VIRTEL
    presents the same realm name for all transactions, and thus the user
    sees only one signon prompt per browser session.

GRNAME
------

    the VTAM generic resource name of the VIRTEL started task. This
    setting may be useful in a sysplex environment. It allows all VIRTEL
    STCs in the sysplex to present the same realm name to the browser.

xx
--

    The 3270 AID function key which will be transmitted to the
    application when a Minitel user presses the [REPETITION] key. This
    parameter allows the definition of a general value by default which
    may be modified in the sub-server node definition. A value of 00
    indicates that the [REPETITION] key will not be transmitted.

YES
---

    VIRTEL’s VTAM network management sub-application will be activated.

NO
--

    The network management sub-application will not be used.

xx
--

    The 3270 AID function key which will be transmitted to the
    application when the Minitel user presses the [RETURN] key. By
    default the [RETURN] key is not transmitted to the application but
    serves to set the cursor to the beginning of the preceding field.
    This parameter allows for the definition of a general value by
    default that may be modified in the definition of the sub-server
    nodes.

rnode
-----

    The name of the security management resource class which contains
    Minitel tree structure nodes, VIRTEL sub- application names,
    internal names of transactions associated with entry points, and
    directory names for file transfer.

    For the MVS environment, the following options can be specified:

NO
--

    No security software is used to control access.

VIRTEL
------

    VIRTEL’s internal security management feature is used.

(RACROUTE,RACF)
---------------

    IBM’s security management product is used (via SAF).

(RACROUTE,TOPS)
---------------

    The TOP SECRET security management product is used (via SAF).

(RACROUTE,ACF2)
---------------

    The ACF2 security management system is used (via SAF).

    For the VSE environment, the following options can be specified:

NO
--

    No security software is used to control access.

VIRTEL
------

    VIRTEL’s internal security management feature is used.

RACROUTE
--------

    (for z/VSE Version 3 or later) VIRTEL uses the VSE Basic Security
    Manager (via SAF), or the External Security Manager if specified in
    the VSE IPL parameters.

    The following options are retained for compatibility with previous
    releases:

RACF
----

    RACF without SAF.

TOPS
----

    TOP SECRET without SAF.

ACF2
----

    ACF2 with ACFDIAG (Only for VM). For MVS, this is treated as
    (RACROUTE,ACF2).

RACROUTE
--------

    Multi product interface security (via SAF).

    If MEMORY=ABOVE, RACF without SAF and TOPS without SAF are not
    supported.

YES
---

    Inhibits the sending of asynchronous terminal connection and
    disconnection messages to the log (VIR0026W, VIR0028W, VIR0051I,
    VIR0052I, VIR0505I, VIR0507I, VIR1551I, VIRHT51I, VIRNA51I,
    VIRPF28I, VIRPF51I, VIRPF52I,

    VIRPF99I, VIRQ912W, VIRQ922W, VIRT912W, VIRT922W). Also, messages
    VIR0002W and VIR0914E will be

    suppressed on a REQSESS request.

NO
--

    Enables the sending of asynchronous terminal connection and
    disconnection messages to the log.

    The VIRTEL command SILENCE can be used to dynamically modify this
    parameter.

    Indicates the default presentation format for SNAP and other dumps
    (80 or 132 columns). This parameter can be dynamically modified by
    the VIRTEL SNAPW command.

xx
--

    The 3270 AID function key which will be transmitted to the
    application when the minitel user presses the [SUMMARY] key. By
    default, the [SUMMARY] key is not transmitted to the application but
    serves to return the user to the tree structure. This parameter
    allows for the definition of a default which may be modified in the
    sub-server node definition. Where the value specified is a ‘01’, use
    of the [SUMMARY] key sets the cursor on the first field to be
    entered in the current screen.

dsn1,...
--------

    Dataset names of the files to be used for recording statistics if
    the parameter STATS=MULTI is specified. From 2 to 10 datasets can be
    specified. The datasets must be cataloged.

YES
---

    Statistics recording is active. Statistics will be written to a
    single file defined in the VIRSTAT DD or DLBL statement in the
    VIRTEL started task JCL. VIRTEL must be stopped periodically to
    allow the statistics to be copied to a history file. The VIRSTAT
    file is overwritten each time VIRTEL is started.

NO
--

    Statistics will not be recorded.

MULTI
-----

    Statistics recording is active. Statistics are written to one of the
    datasets defined in the STATDSN parameter of the VIRTCT. VIRTEL
    rotates the datasets by switching automatically to the next dataset
    when the current dataset becomes full. A batch job can then be used
    to copy the statistics to an archive file without stopping VIRTEL.
    Message VIR0603I can be used by an automated operator to trigger the
    submission of the batch job. After copying the

    statistics, the batch job must empty the dataset by writing an EOF
    marker at the beginning, which allows VIRTEL to reuse the dataset
    (see member STATCOPY in the VIRTEL SAMPLIB).

    The VIRTEL STAT command allows the console operator to display the
    status of the VIRSTATx datasets, or to force VIRTEL to switch to the
    next statistics dataset.

    If all of the statistics datasets are full, there are two options:

STATS=(MULTI,TERMINATE)
-----------------------

    VIRTEL terminates, to avoid the possibility of losing any further
    statistics

STATS=(MULTI,CONTINUE)(default)
-------------------------------

    VIRTEL continues, without recording any further statistics. To
    restart statistics recording, run a STATCOPY batch job to empty at
    least one VIRSTATx dataset, then issue the STAT,I command.

    The STATS=MULTI option is only available in the MVS environment.

SMF
---

    Statistics recording is active. Statistics are written into SMF.

    The VIRTEL STAT command allows the console operator to display the
    status of the VIRSTATx datasets, or to force VIRTEL to switch to the
    next statistics dataset.

    The SMF record format is the same as the current STATS record but
    prefixed by the standard SMF header.

STATS=SMF
---------

    The default SMF record number is 223.

STATS=(SMF,nnn)
---------------

    The SMF record number used will be nnn. The specified number must be
    between 128 and 255.

    The STATS=SMF/(SMF,nnn) option is only available in the MVS
    environment.

n
-

    Number of concurrent accesses to VSAM files.

xx
--

    The 3270 AID function key which will be transmitted to the
    application when the Minitel user presses the [SUITE] function key.
    By default the [SUITE] function key is not transmitted to the
    application but serves to set the cursor to the following field.
    This parameter allows the definition of a general value by default
    that may be modified in the definition of the sub server node.

Pnn
---

    Identifies the 3270 function key that causes VIRTEL to return to the
    multi-session menu (for SNA terminals, the ATTN key also performs
    this function). This parameter may take the following parameter
    values P1 to P24, PA1, PA2, or CLR.

YES
---

    VIRTEL will retrieve certain system symbols from z/OS. Whenever the
    '+' character appears in the APPLID parameter or in a terminal relay
    name, VIRTEL will replace the '+' by the value of the SYSCLONE
    symbol.

NO
--

    System symbols will not be retrieved, the '+' character will not be
    substituted in LU names, and the xxx-SYMBOL functionality of the
    NAME-OF tag and the COPY$ SYSTEM-TO-VARIABLE instruction is not
    active (see VIRTEL Web Access Guide).

    This parameter defines the characteristics of the connection to the
    TCP/IP stack used by all lines which specify type TCP1.

tcpname
-------

    The name of the TCP/IP stack. This name should match the
    TCPIPJOBNAME parameter in the TCPIP.TCPIP.DATA file of the TCP/IP
    stack, or the name of the TCP/IP started task itself if TCPIPJOBNAME
    is not specified. The value ANY indicates that a connection can be
    established which any TCP/IP stack. This parameter is ignored by the
    TCP/IP for VSE stack.

maxsock
-------

    In MVS, this is the maximum number of sockets for each type TCP1
    line defined in VIRTEL. If this subparameter is not specified,
    TCP/IP determines the number (50 by default). The maximum value
    allowed by VIRTEL is 65535. However, for customers using older
    versions of MVS (z/OS V1R4 or earlier), the TCP/IP stack enforces an
    upper limit of 2000 on this subparameter. Also, the value of the
    MAXFILEPROC parameter in PARMLIB member BPXPRMxx must exceed the
    maxsock value.

    In VSE, this is the total maximum number of sockets for all VIRTEL
    lines of type TCP1. The TCP/IP for VSE stack currently ignores the
    value specified here, and uses a fixed value of 8001 instead.

pgmname
-------

    The name of the VIRTEL TCP/IP interface program used for this
    connection. The following values can be specified:

VIR0T09
-------

    Interface program using ASYNC=EXIT mode. This is the default for MVS
    systems.

VIR0T10
-------

    Interface program using ASYNC=ECB mode. This is the default for VSE
    systems.

adsname
-------

    The name which VIRTEL uses to identify itself to TCP/IP. The value
    \* indicates that VIRTEL uses its VTAM APPLID as the address space
    identifier. The default value is blank, which means that TCP/IP will
    assign the name of the VIRTEL started task as the address space
    identifier. This parameter is ignored by the TCP/IP for VSE stack.

    This parameter defines the characteristics of the connection to the
    TCP/IP stack used by all lines which specify type TCP2. The
    subparameters are the same as those of TCP1.

n
-

    Indicates in minutes the time-out after which a terminal connected
    to an external server will be force disconnected if no line activity
    is seen. A value of 0 means that the terminal will not be
    disconnected even if no activity is detected. The value specified
    here applies only when the “User time out” field in the external
    server definition is set to zero (see “Parameters of the external
    server” in the VIRTEL Connectivity Reference manual).

    This parameter indicates the timeout values (in seconds) used by
    VIRTEL when attempting to establish an outbound connection using the
    Application-to-Application API (FA29 structured field). If this
    parameter is specified, then all four sub-parameters must be coded.
    The sub-parameters are:

n1
--

    Timeout for VTAM connections.

n2
--

    Timeout for X25 connections.

n3
--

    Timeout for TCP/IP connections.

n4
--

    Reserved for future use.

ccccc
-----

    The first line of the Multi-Session menu screen.

ccccc
-----

    The second line of the Multi-Session menu screen.

p1,p2,...
---------

    Additional categories of trace data to be included in the VIRTEL
    internal trace. One or more of the following values may be coded in
    any order:

HTTP
----

    Additional trace data for HTTP server

VSAM
----

    Additional trace data for VSAM I/O requests

XM
--

    Additional trace data for Cross-Memory communication

    n

    The number of entries reserved for the VIRTEL internal trace. The
    value indicated corresponds to n times 256 entries.

nn
--

    The number of 1K buffers reserved for buffer data associated with
    entries in the VIRTEL internal trace. From VIRTEL

    4.20 onwards, trace data is allocated above the 16MB line if
    possible.

STANDARD
--------

    An automatic SNAP of the VIRTEL internal trace table will be
    produced at the start of VIRTEL termination.

YES
---

    An automatic SNAP of the VIRTEL internal trace table will be
    produced at the end of VIRTEL termination.

NO
--

    No SNAP at VIRTEL termination.

YES
---

    The VIRTEL internal trace is active.

NO
--

    The VIRTEL internal trace is not active.

    VIRTEL uses the TOD clock to timestamp each entry in its internal
    trace table. This parameter specifies whether or not the SNAP
    command should adjust the timestamps to match the local time used in
    the system message log. Possible values are:

CPU
---

    The last column in the SNAP trace, instead of the local time or TOD
    time in 1/10000 of a second, contains the total used CPU time for
    the current TCB in 1/10000 of a second.

    CPU option only works on z/OS and on a machine having support for
    the ECTG (Extract CPU Time) instruction (i.e. Z9-109 and above).

LOCAL
-----

    The SNAP command adjusts the timestamps in the internal trace table
    so that they display as local time. This is the recommended setting.

TOD
---

    Timestamps are not adjusted for local time.

    This parameter should be coded in the same way as for the X25MCH
    macro in NPSI.

    These parameters define the VSAM files used by VIRTEL for HTML
    directories. Each parameter has the form UFILEx = (ddname, acbcard,
    rkp, keylen, mode) where:

-  ddname is the DD name of the file as specified in the VIRTEL start
   procedure.

-  acbcard is the name of the ACB macro defining the access
   characteristics of the transfer file. This ACB macro must appear
   later in the VIRTCT (se`e “Additional parameters for VSAM files”,
   page 78 <#_bookmark305>`__).

-  rkp represents the relative position of the key in hexadecimal. This
   value must match the value specified in the DEFINE CLUSTER.

-  keylen represents the length of the key in hexadecimal. This value
   must match the value specified in the DEFINE CLUSTER.

-  mode represents one of the following values (in hexadecimal):

00
--

    read-only mode

01
--

    read/write mode

05
--

    read-only mode or read/write mode, depending on the value of the
    `“VSAMTYP parameter”, page 76 <#_bookmark293>`__ in the VIRTCT).

    The UFILEx parameters must be defined in sequence with no
    intervening gaps in the suffix number x.

YES
---

    The VIRTEL internal security sub-application is available. To use
    VIRTEL security, specify VIRSECU=YES with SECUR=VIRTEL. The
    combination SECUR=NO, VIRSECU=YES allows online definition of Virtel
    security without security being active.

NO
--

    VIRTEL internal security is not available.

    This parameter defines the characteristics of the interface to the
    VIRSV service request manager for service programs called from a
    scenario via the VIRSV$ instruction.

vsvname
-------

    Name of the service request manager. Must be VIRSV.

READONLY
--------

    This parameter, if specified in the VIRTCT, allows the VIRTEL
    started task to be run in read-only mode for VSAM files, to be used
    in production mode, especially in a sysplex environment. Except for
    the VIRSWAP work file, all other VSAM files used by VIRTEL can be
    opened in read-only mode.

NORMAL
------

    By default VIRTEL opens files in read/write mode to allow the
    possibility of updating certain VSAM files, such as the VIRARBO file
    for example.

    Note: VSAMTYP=READONLY takes effect only if the appropriate values
    have been specified in the MACRF parameter of the ACB (see
    `“Additional parameters for VSAM files”, page 78 <#_bookmark305>`__)
    and in the MODE subparameter of the UFILEx parameter of the VIRTCT
    (see `“UFILE1 to UFILE20”, page 75 <#_bookmark287>`__).

xxxxxxxx
--------

    The name of a table added to the end of the VIRTCT allowing for
    redefinition of the function keys for VT100. Please refer to the
    member VTSAMPLE in SAMPLIB.

xxxxxxxx
--------

    The name of a table added to the end of the VIRTCT allowing for
    dynamic override of certain parameters in the VIRTCT. Please refer
    to the section `“Dynamic VIRTCT overrides”, page
    81 <#_bookmark312>`__ for further details.

    This parameter defines the characteristics of the connection to the
    cross-memory manager (VIRXM) used by all lines which specify type
    XM1.

    Note: Cross-memory is supported only on MVS systems (OS/390 or
    z/OS). The VIRXM product from Syspertec must also be installed.

xmname
------

    The name of the cross-memory manager started task (VIRXM).

pgmname
-------

    The name of the VIRTEL XM interface program used for this
    connection. The following values can be specified:

VIR0X09
-------

    Interface program for MVS systems. This is the default.

    This parameter defines the characteristics of the connection to the
    cross-memory manager (VIRXM) used by all lines which specify type
    XM2. The subparameters are the same as those of the XM1 parameter.

xxxxxxxx
--------

    The name of a table added to the end of the VIRTCT allowing for one
    or more patches to be applied at startup. Please refer to the
    section `“Applying patches via the VIRTCT”, page
    82 <#_bookmark313>`__ for further details.

    VIRTEL uses VSAM files for storing HTML pages and for VIRTEL/PC file
    transfer. These VSAM files must be defined in the VIRTCT by means of
    a parameter UFILEx and an ACBHx macro for each file. The ACB macros
    must be coded in the VIRTCT before the END card. The formats of
    these macros are as follows:

-  The label ACBHx must match the acbname subparameter as specified in
   the UFILEx parameter of the VIRTCT.

-  dddddddd represents the ddname of the file as it is known in the
   VIRTEL start up procedure.

-  pn represents the authorisations granted to the transfer file. The
   permitted values are: SEQ,DIR,OUT,LSR (for read/ write mode) or
   SEQ,DIR,IN,LSR (for read-only mode).

-  The value OUT should be omitted from MACRF if you want the mode
   (read-only or read/write) to be determined by the value of the
   VSAMTYP parameter in the VIRTCT (se`e “VSAMTYP parameter”, page
   76 <#_bookmark293>`__).

    VIRTEL uses sequential files for batch input and output when the
    BATCHx parameter is defined in the VIRTCT, and a batch line is
    present in the configuration. These sequential files must be defined
    in the VIRTCT by means of a pair of DCB/DCBE macros for each file.
    The DCB/DCBE macros must be coded in the VIRTCT before the END card.
    The formats of these macros are as follows:

    where:

label
-----

    corresponds to the DCB label specified in the BATCHx parameter

ddname
------

    corresponds to the DD name specified in the BATCHx parameter.

    For input files:

-  lrecl is 80

-  recfm is FB

-  macrf is GL. For output files:

-  lrecl is 133

-  recfm is FBA

-  macrf is PM.

    EODAD=0 should be specified for input files.

    The example below shows how to code DCB/DCBE macros when the BATCH1
    parameter is specified as BATCH1=(SYSIN1,DCBI1,SYSOUT1,DCBO1)

+--------------------------------+----------------+------+
|     DCBI1 DCB DDNAME=SYSIN1,   |     SYSIN DD   | \*   |
+================================+================+======+
|     DCBE=DCBI1X,               |                | \*   |
+--------------------------------+----------------+------+
|     LRECL=80,                  |                | \*   |
+--------------------------------+----------------+------+
|     DSORG=PS,                  |                | \*   |
+--------------------------------+----------------+------+

+--------------+------------------+----------------------------+---------------+------+
|              |     RECFM=FB,    |                            | \*            |
+==============+==================+============================+===============+======+
|              |     MACRF=(GL)   |                            |               |
+--------------+------------------+----------------------------+---------------+------+
|     DCBI1X   |     DCBE         |     EODAD=0,RMODE31=BUFF   |               |      |
+--------------+------------------+----------------------------+---------------+------+
|     DCBO1    |     DCB          |     DDNAME=SYSOUT1,        | SYSPRINT DD   | \*   |
+--------------+------------------+----------------------------+---------------+------+
|              |                  |     DCBE=DCBO1X,           |               | \*   |
+--------------+------------------+----------------------------+---------------+------+
|              |                  |     LRECL=133,             |               | \*   |
+--------------+------------------+----------------------------+---------------+------+
|              |                  |     DSORG=PS,              |               | \*   |
+--------------+------------------+----------------------------+---------------+------+
|              |                  |     RECFM=FBA,             |               | \*   |
+--------------+------------------+----------------------------+---------------+------+
|              |                  |     MACRF=(PM)             |               |      |
+--------------+------------------+----------------------------+---------------+------+
|     DCBO1X   |     DCBE         |     RMODE31=BUFF           |               |      |
+--------------+------------------+----------------------------+---------------+------+

    An example of the VIRTCT is supplied in member VIRTCT01 in the
    VIRTEL SAMPLIB for MVS, and in the installation job VIRTCT for VSE:

    PRINT GEN

    VIRTERM TYPE=INITIAL,APPLID=VIRTEL, \* COMPR3=AUTO, \*

    LANG=' ', LANGUAGE FOR USER MESSAGES \*

    COUNTRY=FR, EBCDIC-ASCII TRANSLATION \* DEFUTF8=IBM1147, DEFAULT
    OUTPUT ENCODING UTF-8 \* CHARSET=, UTF-8: ADDITIONAL CHARSETS \*

    GMT=SYSTZ, \*

    CRYPT1=(CRYPT3270,NONE,NONE,NO-ENCRYPTION,HEX), \*
    TCP1=(TCPIP,,,250), <------ \*

    HTVSAM=VIRHTML, <------ \*

    BUFSIZE=20000, \*

    ACCUEIL=YES, \*

    DEFENTR=(PC,MINITEL), \*

    FCAPT=VIRCAPT, \*

    RETOUR=00, \*

    SUITE=00, \*

    SOMMR=00, \*

    CORRECT=00, \*

    EXIT1=, \*

    EXIT2=, \*

    EXIT3=, \*

    EXIT5=, \*

    EXIT4=, \*

    EXIT6=, \*

    EXIT7=, \*

    STATS=YES, OU (MULTI,CONTINUE/TERMINATE) \*
    STATDSN=(VIRTEL.STATA,VIRTEL.STATB), SI STATS=MULTI \*
    FCMP3=VIRCMP3, \*

    APPSTAT=YES, \*

    DONTSWA=YES, \*

    NBDYNAM=250, \*

    TRACEB=200,TRACEON=YES,TRACBIG=40, \*

    MULTI=YES,RESO=YES,ARBO=YES,MINITEL=YES, \* VIRSECU=YES,SECUR=NO,
    VIRTEL, (RACROUTE,RACF) \* RAPPL=VIRTSERV,RNODE=VIRTNODE, \*

    LOCK=20000, \*

    TIMEOUT=5, \*

    FASTC=NO, \*

    UFILE1=(SAMPTRSF,ACBH1,0,10,01), \*

    UFILE2=(HTMLTRSF,ACBH2,0,10,01), \*

    UFILE3=(PLUGTRSF,ACBH3,0,10,01), \*

    GATE=GENERAL, \*

    NBCVC=32, \*

    VTKEYS=VTTABLE, VT100 : KEY REDEFINITION \* MEMORY=ABOVE, \*

    COMPANY='VOTRE COMPAGNIE ', VOIR LA CLE \* ADDR1='VOTRE ADRESSE 1 ',
    COMMUNIQUEE \*

+----------------------------------------------------------+----------+---------------------+------+
|     ADDR2='VOTRE ADRESSE 2 LICENCE='TYPE DE LICENCE ',   |     ',   |     PAR SYSPERTEC   | \*   |
|                                                          |          |                     |      |
|                                                          |          |                     | \*   |
+==========================================================+==========+=====================+======+
|     EXPIRE=(2999,12,31),                                 |          |                     | \*   |
+----------------------------------------------------------+----------+---------------------+------+
|     CODE='XXXXXXXX',                                     |          |                     | \*   |
+----------------------------------------------------------+----------+---------------------+------+

+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=D6D7,IS=F1,RETCODE=1   |     PF1                                                                                                                                                                          |
+=======================================================================+================================+==================================================================================================================================================================================+======+
|     KTRAN                                                             |     KEY=D6D8,IS=F2,RETCODE=1   |     PF2                                                                                                                                                                          |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=D6D9,IS=F3,RETCODE=1   |     PF3                                                                                                                                                                          |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=D6E2,IS=F4,RETCODE=1   |     PF4                                                                                                                                                                          |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=D6E3,IS=F5,RETCODE=1   |     PF5                                                                                                                                                                          |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=D6E4,IS=F6,RETCODE=1   |     PF6                                                                                                                                                                          |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=D6E5,IS=F7,RETCODE=1   |     PF7                                                                                                                                                                          |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=D6E6,IS=F8,RETCODE=1   |     PF8                                                                                                                                                                          |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=D6E7,IS=F9,RETCODE=1   |     PF9                                                                                                                                                                          |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=D6E8,IS=7A,RETCODE=1   |     PF10                                                                                                                                                                         |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=D6E9,IS=7B,RETCODE=1   |     PF11                                                                                                                                                                         |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=D64A,IS=7C,RETCODE=1   |     PF12                                                                                                                                                                         |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=D6A7,IS=6D,RETCODE=1   |     CLEAR                                                                                                                                                                        |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=4AC8,IS=6D,RETCODE=1   |     CLEAR                                                                                                                                                                        |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=4AD2,IS=00,RETCODE=2   |     ERASEOF                                                                                                                                                                      |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=4AC1,IS=00,RETCODE=3   |     CURU                                                                                                                                                                         |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=4AC2,IS=00,RETCODE=4   |     CURD                                                                                                                                                                         |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=4AC3,IS=00,RETCODE=5   |     CURR                                                                                                                                                                         |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     KTRAN                                                             |     KEY=4AC4,IS=00,RETCODE=6   |     CURL                                                                                                                                                                         |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     \* ============================================================   |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+
|     ACBH1 ACBH2 ACBH3                                                 |     ACB ACB ACB                |     AM=VSAM,DDNAME=SAMPTRSF,MACRF=(SEQ,DIR,OUT,LSR), STRNO=3 AM=VSAM,DDNAME=HTMLTRSF,MACRF=(SEQ,DIR,OUT,LSR), STRNO=3 AM=VSAM,DDNAME=PLUGTRSF,MACRF=(SEQ,DIR,OUT,LSR), STRNO=3   | \*   |
|                                                                       |                                |                                                                                                                                                                                  |      |
|                                                                       |     END                        |                                                                                                                                                                                  | \*   |
|                                                                       |                                |                                                                                                                                                                                  |      |
|                                                                       |                                |                                                                                                                                                                                  | \*   |
+-----------------------------------------------------------------------+--------------------------------+----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------+------+

    *Example VIRTCT*

    The VIRTCT must be assembled before starting VIRTEL for the first
    time. The VIRTEL macro library must be available to the assembler.
    In the MVS environment, the VIRTCT must be link-edited with the
    NORENT and NOREUS options. The RENT and REUS options must NOT be
    specified in the MVS environment. In the VSE environment,
    PRD1.MACLIB must be specified. The resulting phase or load module
    must be placed in a STEPLIB or SEARCH PHASE library available to the
    VIRTEL started task.

    A sample job for assembling the VIRTCT is supplied in member ASMTCT
    of the VIRTEL SAMPLIB:

    *VIRTCT assembly in MVS*

    A sample job for assembling the VIRTCT is supplied on the
    installation tape:

    *VIRTCT assembly in VSE*

    Data may be passed to the VIRTEL procedure via the start command
    which allows the value of certain parameters in the VIRTCT (APPLID,
    MQ1, MQ2) to be modified. For example :

    The VIRTEL started task procedure should contain the TCT, APPLID,
    and VTOVER parameters which are substituted into the PARM as shown
    below:

    When starting VIRTEL, you may specify values for the TCT, APPLID,
    and VTOVER on the start command as shown in the example below:

    After loading VIRTCT01, VIRTEL will then:

-  replace the APPLID variable by the value AA4AVIRX

-  use the value of the VTOVER variable to replace the specified
   substitution characters % in certain VIRTCT parameters by characters
   extracted from the VTOVER value.

    This functionality requires that the VIRTCT should contain:

-  a new parameter VTOVER=VTDYNAM

-  a new table VTDYNAM consisting of macros VTOVERH and VTOVER

-  the presence of one or more % characters in certain VIRTCT parameters
   which will be substituted by the corresponding characters from the
   VTOVER parameter specified on the start command.

    For example, if the fourth character of the MQ1 and MQ2 Queue
    Manager name and the second three characters of the MQ2 Queue Name
    are variable, the parameters may be defined in the VIRTCT as shown
    below:

+--------------------------+--------------------------------+------+
|     MQ1=(CSQ%),          |     -> wild char in MQ1 parm   | \*   |
+==========================+================================+======+
|     MQ2=(CSQ%,'A%%%'),   |     -> wild char in MQ2 parm   | \*   |
+--------------------------+--------------------------------+------+
|     VTOVER=VTDYNAM,      |     -> new VIRTCT parm         | \*   |
+--------------------------+--------------------------------+------+

    At the end of the VIRTCT, define the VTDYNAM table with the rules
    for substituting data from the VTOVER parameter. For each parameter,
    specify the substitution character(s) to look for (TARGET), and the
    position relative to zero of the characters to be extracted from the
    VTOVER parameter (FROM), as shown in the example below:

    With these definitions and VTOVER='12345', the MQ1 and MQ2
    parameters of the VIRTCT will have the values shown below:

    If an error occurs during substitution, VIRTEL will issue message
    VIR0025E indicating the error code specified in the ERRORC parameter
    of the VTOVER macro.

    The “ZAPH parameter”, page 0 of the VIRTCT allows one or more
    patches to be applied to the VIRTEL kernel after the resident
    modules have been loaded into memory at startup. This parameter is
    intended to be used only under the advice of Syspertec technical
    support personnel.

    For example, if the VIRTCT contains the parameter:

    then it refers to the table MYPTFS coded after the VIRTERM macro,
    for example:

    The format of each ZAPD instruction is as follows:

label
-----

    PTF identifier for message VIR0066I

progname
--------

    program name

offset
------

    offset into program

verify
------

    verify value (hexadecimal digits)

replace
-------

    replacement value (hexadecimal digits)

desc
----

    (optional) description for message VIR0066I

VIRCONF
=======

    The VIRCONF program allows a batch job to manage the VIRARBO file,
    which is the main configuration file for VIRTEL. VIRCONF allows you
    to:

-  Upload a new VIRARBO file using SYSIN cards

-  Add, replace, or suppress one or more definitions within an existing
   VIRARBO file

-  Create new définitions as SYSIN cards using an existing VIRARBO file

-  Scan a SYSIN cards file for checking the right syntax

    Below are some JCL examples to define and upload a new VIRARBO file:

    *VIRCONF JCL in VSE to define and upload a new VIRARBO file*

    *VIRCONF JCL in MVS to define and upload a new VIRARBO file*

    When VIRCONF is executed with PARM=LOAD, control cards are read from
    SYSIPT (VSE) or SYSIN (MVS) and are loaded into the VIRARBO file.

    Below are some JCL examples to add, replace, or delete one or more
    definitions from an existing VIRARBO file:

    *VIRCONF JCL in VSE to update a VIRARBO file*

    *VIRCONF JCL in MVS to update a VIRARBO file*

    Submitting VIRCONF with PARM=LOAD for an existing VIRARBO file
    allows definitions to be added, replaced, or deleted, while keeping
    existing definitions in the VIRARBO file.

    Using PARM='LOAD,NOREPL' parameter allows only new definitions to be
    added, while keeping existing definitions. In this case, VIRCONF
    will ignore any statement with the same name as existing
    definitions, returning a zero return code, except if another error
    was encountered.

    Below are some JCL examples to obtain existing VIRARBO definitions
    in the form of control cards:

    *VIRCONF JCL in VSE to unload a VIRARBO file*

    *VIRCONF JCL in MVS to unload a VIRARBO file*

    When VIRCONF is run with the PARM=UNLOAD parameter, the existing
    VIRARBO definitions are converted into control cards and are written
    to SYSPCH (VSE) or SYSPUNCH (MVS). The created cards issued by
    VIRCONF may be edited and then reused with another VIRCONF job with
    the PARM=LOAD parameter.

    Below are some JCL examples to verify the control card syntax:.

    *VIRCONF JCL in VSE for syntax verification*

    *VIRCONF JCL in MVS for syntax verification*

    Submitting the VIRCONF program with PARM=SCAN allows you to scan the
    SYSIPT (VSE) or SYSIN (MVS) cards for potential syntax errors. There
    is no access to the VIRCONF file.

    When uploading the VIRARBO file, VIRCONF may select one among
    several versions of a control card, based on the LANG=xx parameter
    defined in the JCL. In this way, the same SYSIN file may be used to
    generate several different language versions of the VIRARBO file.
    For example:

    *VIRCONF JCL in VSE for multi-language upload*

    *VIRCONF JCL in MVS for multi-language upload*

    The control card syntax for VIRCONF is similar to the syntax for
    JCL.

-  Each instruction begins on a new card

-  One instruction consists of an “operation code”, followed by a blank
   space, followed by one or more parameters, followed by an optional
   comment

-  The parameters use the keyword=value form and parameters are
   separated with a comma

-  The parameters are ended by a blank character; anything after this
   first blank is treated as a comment.

-  A card beginning with a “\*” is treated as a comment

-  A completely blank card is treated as a comment

-  A card beginning with two characters between parenthesis, for
   instance (EN), will be processed only if these two characters match
   the value of the LANG= parameter specified in the JCL PARM

-  Instructions must be coded between columns 1 to 71. Column 72, if
   non-blank, means that the instruction continues on the next card

-  If a parameter is terminated by a comma followed by a blank, the
   instruction continues at the first non-blank character of next card.
   A non-blank in column 72 is optional in this case

-  A character string between apostrophes or quotes which goes over
   column 71 may be continued on the next card, by putting a non-blank
   character in column 72 and by continuing the string starting on
   column 16 of the next card

-  Each instruction must have at least one “ID=” parameter which is used
   as a key to identify the described entity

-  The values of parameters may in general contain letters (A-Z in upper
   case), digits (0-9), and special characters (.+&$\*-/%\_?:@). Some
   parameters also allow values which contain other special characters,
   letters in lower case, and blank characters, and in this case the
   value must be coded as a character string enclosed in either quotes
   or apostrophes

    You can generate some examples by submitting a job using the
    PARM=UNLOAD parameter (se`e “Unloading a VIRARBO <#_bookmark323>`__
    `file”, page 86 <#_bookmark323>`__) for a specific VIRARBO file, for
    instance the one delivered as VIRARBO base in the standard
    installation process.

    This operation adds or replaces an APPLIC entity in the VIRARBO
    file. The parameters correspond to the various items described under
    the heading “Applications Management” on page 123

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

    This operation deletes an entity of the specified type from the
    VIRARBO file.

+----+----+----+
+----+----+----+
+----+----+----+

    This operation adds or replaces a DEPT entity in the VIRARBO file.
    The parameters correspond to the various items described under the
    heading “Create a department” or “Profile lent to a department”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

    This operation adds or replaces an ENTRY entity in the VIRARBO file.
    The parameters correspond to the various items described under the
    heading “Parameters of the Entry Point”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

    This operation adds or replaces an INDEX entity in the VIRARBO file.
    The parameters correspond to the various items described under the
    heading “Updating the keywords”.

+----+----+----+
+----+----+----+
+----+----+----+

Note [1]
--------

    If the target node name has less than 6 characters, it must be
    padded with blanks and enclosed in quotes.

    This operation adds or replaces a LINE entity in the VIRARBO file.
    The parameters correspond to the various items described under the
    heading “Parameters of the line”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

Note [1]
--------

    This parameter is available only in VIRCONF

    This operation adds or replaces a NODE entity in the VIRARBO file.
    The parameters correspond to the various items described under the
    heading ”Defining a native node”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

    This operation adds or replaces a PC entity in the VIRARBO file. The
    parameters correspond to the various items described under the
    heading “PC management”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

    This operation adds or replaces one entity with PROFILE entity in
    the VIRARBO file. The parameters correspond to the various items
    described under the heading “Defining a profile”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

    This operation adds or replaces a RESOURCE entity in the VIRARBO
    file. The parameters correspond to the various items described under
    the heading “Defining a resource”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

    This operation adds or replaces a RULE entity in the VIRARBO file.
    The parameters correspond to the various items described under the
    heading “Parameters of the rule”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

Note [1]
--------

    The conditions are coded in the form keyword=(condition,value) where
    condition is one of the following:

IGNORE
------

    Ignore

EQUAL
-----

    Is

NOTEQ
-----

    Is not

BEGIN
-----

    Starts with

NOTBEGIN
--------

    Does not

END
---

    Ends with

NOTEND
------

    Does not

Note [2]
--------

    For compatibility with earlier versions, VIRCONF also accepts the
    parameter LINE= as a synonym of RULESET=

    This operation adds or replaces a SERVER entity in the VIRARBO file.
    The parameters correspond to the various items described under the
    heading “Parameters of external server”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

    This operation adds or replaces an SSERV entity in the VIRARBO file.
    The parameters correspond to the various items described under the
    heading “Defining a sub-server node”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

+----+----+----+
+----+----+----+

Note [1]
--------

    Specify either TRANSACT or TIOA, but not both

Note [2]
--------

    \* = Yes

Note [3]
--------

    The key name must be coded according to the table below:

+----+----+----+----+----+----+
+----+----+----+----+----+----+
+----+----+----+----+----+----+
+----+----+----+----+----+----+
+----+----+----+----+----+----+
+----+----+----+----+----+----+
+----+----+----+----+----+----+
+----+----+----+----+----+----+
+----+----+----+----+----+----+
+----+----+----+----+----+----+
+----+----+----+----+----+----+
+----+----+----+----+----+----+
+----+----+----+----+----+----+

    This operation adds or replaces a SUBDIR entity in the VIRARBO file.
    The parameters correspond to the various items described under the
    heading “Parameter of directory”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

    This operation adds or replaces a TERMINAL entity in the VIRARBO
    file. The parameters correspond to the various items described under
    the heading “Parameter of the terminal”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

    This operation adds or replaces a TRANSACT entity in the VIRARBO
    file. The parameters correspond to the various items described under
    the heading “Parameter of the transaction”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

    This operation updates one or more parameters of an entity in the
    VIRARBO file.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

    This operation adds or replaces a USER entity in the VIRARBO file.
    The parameters correspond to the various items described under the
    heading “Managing users”.

+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+
+----+----+----+

Note [1]
--------

    Indicate either PASSWORD (readable password), or PASSCODE (encrypted
    password). PASSWORD allows you to specify the password explicitly;
    if present, it must be coded after the ID parameter. PASSCODE is
    generated by the UNLOAD function; this allows to unload and reload
    the USER records without exposing the password in readable format.

Note [2]
--------

    The PARM='UNLOAD,PLAINTXT' function unloads the password in readable
    format (PASSWORD instead of PASSCODE). To use this function, the
    user that submits this VIRCONF job must be RACF authorized (or by
    another securiyy tool) with READ access for the
    VIRTEL.PASSWORD.DECRYPT resource in the FACILITY class.

Security
========

    Perform the following steps to activate RACF security for VIRTEL in
    the MVS environment.

    In the VIRTCTxx member of the VIRTEL CNTL library,

-  VIRTCTUS = English language.

-  VIRTCTFR = French language. replace the default parameters :

    with the following parameters:

    This tells VIRTEL that its security definitions are stored in the
    FACILITY class, and the resource names are prefixed by “VIRTEL.”.
    You can choose your own prefix for each VIRTEL. Multiple VIRTEL
    started tasks can share the same resource name prefix if their
    security definitions are identical. You can also choose the class
    name, but it must already be defined in RACF with the correct
    attributes. It is recommended to use the FACILITY class which is
    standard in RACF.

    Having updated the VIRTCTxx source member, reassemble and relink the
    VIRTCT into VIRTEL LOADLIB using the sample JCL in member ASMTCT of
    the VIRTEL CNTL library. Be sure to specify the correct member name
    MEMBER=VIRTCTxx in the job. Stop and start VIRTEL to pick up the new
    VIRTCT.

    The following RACF definitions are the minimum you need to get
    started. They simply authorize the VIRTEL administrator (you) to do
    everything. In this job, replace youruserid by the administrator’s
    RACF userid or group name. This JCL can be found in member RACFDEF
    in the VIRTEL SAMPLIB.

    *RACFDEF : JCL to add RACF definitions*

    Later you can refine the definitions so that other VIRTEL users can
    use VIRTEL transactions (such as secured VIRTEL Web Access
    transactions). The following example allows DEMOGRP to use
    transaction W2H-10:

    *RACFDEF : JCL to update RACF definitions*

    For more information about protecting VIRTEL Web Access resources,
    refer to the “Security” section of the VIRTEL Web Access Guide.

    Perform the following steps to activate ACF2 security for VIRTEL in
    the MVS environment.

    In the VIRTCTxx member of the VIRTEL CNTL library, replace the
    default parameters:

    with the following parameters:

    This tells VIRTEL that the security definitions for calls to
    external servers are stored in the VIRTAPPL resource class, and that
    the security definitions for access to VIRTEL transactions,
    directories, and Minitel nodes are stored in the VIRTNODE resource
    class. You can choose your own resource class names for each VIRTEL.
    Multiple VIRTEL started tasks can share the same resource class
    names if their security definitions are identical.

    Having updated the VIRTCTxx source member, reassemble and relink the
    VIRTCT into VIRTEL LOADLIB using the sample JCL in member ASMTCT of
    the VIRTEL CNTL library. Stop and start VIRTEL to pick up the new
    VIRTCT.

    ACF2 maps each 8-character SAF resource class name to a 3-character
    ACF2 resource type. By default, the resource type is the first three
    characters of the resource class name, so classes VIRTAPPL and
    VIRTNODE both map to resource type VIR. You can use the ACF2 CLASMAP
    record to translate the resource classes to different resource types
    if required.

    A example job to add VIRTEL definitions for ACF2 can be found in
    member ACF2DEF in the VIRTEL SAMPLIB. The commands in this job are
    explained in the following paragraphs.

    *ACF2DEF : ACF2 commands to create OMVS segment for VIRTEL*

    This command allows VIRTEL to access the TCP/IP stack.

    *ACF2DEF : ACF2 command to grant administrator permissions*

    This command permits users in group admin-group-name to access all
    VIRTEL transactions and administrator functions.

    *ACF2DEF : ACF2 commands to grant general user permissions*

    These commands permit users in group user-group-name to access
    specific VIRTEL transactions.

    Resource W2H-10 permits specific access to the CICS Web Access
    transaction on port 41001. Resource CLI-\*\*\*\* is a generic
    resource which permits access to customer-defined transactions
    (internal name CLI-nn) on port 41002 and to the directory CLI-DIR.

    *ACF2DEF : ACF2 command to permit access to 3270 Logoff transaction*

    This command permits all users to use the 3270 Logoff transaction,
    whose internal name is PC-0020.

    Perform the following steps to activate TSS security for VIRTEL in
    the MVS environment.

    In the VIRTCTxx member of the VIRTEL CNTL library, replace the
    default parameters:

    with the following parameters:

    This tells VIRTEL that the security definitions for calls to
    external servers are stored in the VIRTAPPL resource class, and that
    the security definitions for access to VIRTEL transactions,
    directories, and Minitel nodes are stored in the VIRTNODE resource
    class. You can choose your own resource class names for each VIRTEL.
    Multiple VIRTEL started tasks can share the same resource class
    names if their security definitions are identical.

    Having updated the VIRTCTxx source member, reassemble and relink the
    VIRTCT into VIRTEL LOADLIB using the sample JCL in member ASMTCT of
    the VIRTEL CNTL library. Stop and start VIRTEL to pick up the new
    VIRTCT.

    A example job to add VIRTEL definitions for TSS can be found in
    member TOPSDEF in the VIRTEL SAMPLIB. The commands in this job are
    explained in the following paragraphs.

    *TOPSDEF : TSS commands to create VIRTEL facility*

    VIRTFAC is the VIRTEL facility name. You may choose your own name,
    but you must replace VIRTFAC in all of the following commands by the
    name you chose. Replace USERnn by the name of an unused user
    facility (for example, USER34).

    *TOPSDEF : TSS commands to create VIRTEL division and department*

    A division and department are created to contain the VIRTEL
    resources. You can choose your own names, or you can use an existing
    division and department. If you choose to use different names then
    the following commands must be modified accordingly.

    *TOPSDEF : TSS commands to create ACID for VIRTEL started task*

    An ACID named VIRTSTC is defined in the BATCH and STC facilities to
    allow VIRTEL to execute in both batch and started task modes. It has
    no password and it belongs to department VIRTDEP.

    The definition in the BATCH facility is not compulsory and is only
    required if VIRTEL might be executed as a batch job.

    *TOPSDEF : TSS commands to associate ACID with VIRTEL started task*

    This command associates the VIRTEL started task with the VIRTSTC
    ACID. VIRTEL is the name of the started task procedure in the system
    or user PROCLIB.

    *TOPSDEF : TSS commands to create OMVS segment for VIRTEL*

    This command allows VIRTEL to access the TCP/IP stack. The name of
    the group (OMVSGRP in this example) should be adapted according to
    your naming conventions.

    *TOPSDEF : TSS commands to define VIRTEL resource classes*

    VIRTEL uses two resource classes for security management.

    The first class, whose name must match the RAPPL parameter of the
    VIRTCT, contains the names of VTAM applications used by VIRTEL
    Multi-Session, and the names of external servers used by VIRTEL
    Outgoing Calls (Videotex).

    The second class, whose name must match the RNODE parameter of the
    VIRTCT, contains node names for VIRTEL Incoming Calls (Minitel), the
    names of sub-applications and directories for VIRTEL administration,
    and the internal names of transactions associated with entry points
    for VIRTEL Web Access.

    *TOPSDEF : TSS commands to define VIRTEL resources*

    AE and SNCF are examples of external servers defined for VIRTEL
    Outgoing Calls (Videotex). VIRTEL permits access to an external
    server if the user is authorized to the corresponding resource name.
    Users who are authorized to the resource named $$ALLSRV may access
    all servers.

    The resources named $$xxxx$$ are used to grant access to the various
    VIRTEL administrator functions. Refer to the VIRTEL Connectivity
    Reference manual for more details.

    The resource named PC is a generic resource which permits access to
    the VIRTEL administrator 3270 interface transactions, whose internal
    name is PC-nnnn. The resource PC-0020 permits specific access to the
    3270 Logoff transaction.

    Resource W2H is a generic resource which permits access to VIRTEL
    Web Access transactions (internal name W2H-nn) and to the directory
    W2H-DIR. The resource W2H-10 permits specific access to the CICS Web
    Access transaction.

    Resource CLI is a generic resource which permits access to
    customer-defined transactions (internal name CLI-nn) and to the
    directory CLI-DIR.

    *TOPSDEF : TSS commands to create VIRTEL administrator profile*

    The VIRTEL administrator profile is named VIRTADP. You may choose a
    different name if required. In this example the administrator is
    granted access to all of the VIRTEL administration functions as well
    as to transactions PC-nnnn, W2H- nn and CLI-nn, and to directories
    W2H-DIR and CLI-DIR.

    *TOPSDEF : TSS commands to create VIRTEL user profile*

    The VIRTEL general user profile is named VIRTUSP. You may choose a
    different name if required. In this example the general user is
    granted access to external servers AE and SNCF, as well as to
    transaction W2H-10.

    *TOPSDEF : TSS command to permit access to 3270 Logoff transaction*

    This command permits all users to use the 3270 Logoff transaction,
    whose internal name is PC-0020.

    *TOPSDEF : TSS command to add general users*

    These commands define userid1 and userid2 as VIRTEL general users by
    adding the VIRTEL user profile to their ACID.

    *TOPSDEF : TSS command to add administrators*

    These commands define admin1 and admin2 as VIRTEL administrators by
    adding the VIRTEL administrator profile to their ACID.

    The VIRTEL load library should normally be APF-authorized. If this
    is not the case, NOAUTH should be specified in the VIRTFAC facility.

Index
=====

    **ACCUEIL**

    VIRTCT parameters `, 47 <#_bookmark73>`__

    **ACF2**

    Security `, 98 <#_bookmark373>`__

    **ADDR1**

    VIRTCT parameters `, 48 <#_bookmark75>`__

    **ADDR2**

    VIRTCT parameters `, 48 <#_bookmark77>`__

    **AIC**

    VIRTCT parameters `, 48 <#_bookmark79>`__

    **ANNUL**

    VIRTCT parameters `, 48 <#_bookmark81>`__

    **APPLIC `, 88 <#_bookmark331>`__ APPLID**

    VIRTCT parameters `, 48 <#_bookmark83>`__

    **Applying to MVS**

    PTF `, 20 <#_bookmark19>`__

    **Applying to VSE**

    PTF `, 40 <#_bookmark56>`__

    **APPSTAT**

    VIRTCT parameters `, 49 <#_bookmark85>`__

    **ARBO**

    VIRTCT parameters `, 49 <#_bookmark87>`__

    **Assembly**

    VIRTCT `, 80 <#_bookmark309>`__

    **BATCH1**

    VIRTCT parameters `, 49 <#_bookmark89>`__

    **BATCH2**

    VIRTCT parameters `, 50 <#_bookmark91>`__

    **BFVSAM**

    VIRTCT parameters `, 50 <#_bookmark93>`__

    **BUFDATA**

    VIRTCT parameters `, 50 <#_bookmark95>`__

    **BUFSIZE**

    VIRTCT parameters `, 50 <#_bookmark97>`__

    **CHARSET**

    VIRTCT parameters `, 50 <#_bookmark99>`__

    **CODE**

    VIRTCT parameters `, 51 <#_bookmark101>`__

    **COMPANY**

    VIRTCT parameters `, 51 <#_bookmark103>`__

    **COMPR3**

    VIRTCT parameters `, 51 <#_bookmark105>`__

    **Configuration**

    Trace `, 74 <#_bookmark276>`__

    **CORRECT**

    VIRTCT parameters `, 51 <#_bookmark107>`__

    **COUNTRY**

    VIRTCT parameters `, 51 <#_bookmark109>`__

    **CRYPT1**

    VIRTCT parameters `, 52 <#_bookmark111>`__

    **CRYPT2**

    VIRTCT parameters `, 54 <#_bookmark113>`__

    **DEFENTR**

    VIRTCT parameters `, 54 <#_bookmark115>`__

    **DEFUTF8**

    VIRTCT parameters `, 54 <#_bookmark117>`__

    **DELETE `, 89 <#_bookmark333>`__**

    **DEPT `, 89 <#_bookmark335>`__ DIRECT**

    VIRTCT parameters `, 55 <#_bookmark119>`__

    **DONTSWA**

    VIRTCT parameters `, 56 <#_bookmark121>`__

    **ENTRY `, 89 <#_bookmark337>`__ EXII1**

    VIRTCT parameters `, 56 <#_bookmark123>`__

    **EXIT2**

    VIRTCT parameters `, 56 <#_bookmark125>`__

    **EXIT3**

    VIRTCT parameters `, 56 <#_bookmark127>`__

    **EXIT4**

    VIRTCT parameters `, 56 <#_bookmark129>`__

    **EXIT5**

    VIRTCT parameters `, 56 <#_bookmark131>`__

    **EXIT6**

    VIRTCT parameters `, 57 <#_bookmark133>`__

    **EXIT7**

    VIRTCT parameters `, 57 <#_bookmark135>`__

    **EXIT8**

    VIRTCT parameters `, 57 <#_bookmark137>`__

    **EXPIRE**

    VIRTCT parameters `, 57 <#_bookmark139>`__

    **FASTC**

    VIRTCT parameters `, 57 <#_bookmark141>`__

    **FCAPT**

    VIRTCT parameters `, 57 <#_bookmark143>`__

    **FCMP3**

    VIRTCT parameters `, 58 <#_bookmark145>`__

    **File**

    Statistics `, 70 <#_bookmark251>`__

    **GATE**

    VIRTCT parameters `, 58 <#_bookmark147>`__

    **GMT**

    VIRTCT parameters `, 58 <#_bookmark149>`__

    **GRNAME**

    VIRTCT parameters `, 59 <#_bookmark151>`__

    **GTLOAD**

    VIRTCT parameters `, 59 <#_bookmark153>`__

    **GTPRFE1**

    VIRTCT parameters `, 59 <#_bookmark155>`__

    **GTPRFE2**

    VIRTCT parameters `, 59 <#_bookmark157>`__

    **GTVSAM**

    VIRTCT parameters `, 60 <#_bookmark159>`__

    **GTVSKIP**

    VIRTCT parameters `, 60 <#_bookmark161>`__

    **GUIDE**

    VIRTCT parameters `, 60 <#_bookmark163>`__

    **HTFORWD**

    VIRTCT parameters `, 60 <#_bookmark165>`__

    **HTHEADR**

    VIRTCT parameters `, 60 <#_bookmark169>`__

    **HTMINI**

    VIRTCT parameters `, 61 <#_bookmark171>`__

    **HTPARM**

    VIRTCT parameters `, 61 <#_bookmark173>`__

    **HTSETn**

    VIRTCT parameters `, 61 <#_bookmark176>`__

    **HTVSAM**

    VIRTCT parameters `, 62 <#_bookmark178>`__

    **IBERTEX**

    VIRTCT parameters `, 62 <#_bookmark180>`__ **IGNIDRFULL parameter `,
    20 <#_bookmark20>`__ IGNLU**

    VIRTCT parameters `, 62 <#_bookmark182>`__

    **IND$FILE `, 61 <#n2>`__**

    **iv-remote-address `, 60 <#_bookmark166>`__ LANG**

    VIRTCT parameters `, 62 <#_bookmark184>`__

    **LICENCE**

    VIRTCT parameters `, 63 <#_bookmark186>`__

    **LINE `, 90 <#_bookmark340>`__ LOCK**

    VIRTCT parameters `, 63 <#_bookmark188>`__

    **MARK**

    VIRTCT parameters `, 63 <#_bookmark190>`__

    **MAXAPPL**

    VIRTCT parameters `, 63 <#_bookmark192>`__

    **MEMORY**

    VIRTCT parameters `, 63 <#_bookmark194>`__

    **MINITEL**

    VIRTCT parameters `, 64 <#_bookmark196>`__

    **MQ1**

    VIRTCT parameters `, 64 <#_bookmark198>`__

    **MQ2**

    VIRTCT parameters `, 64 <#_bookmark200>`__

    **MULTI**

    VIRTCT parameters `, 64 <#_bookmark202>`__

    **NBCVC**

    VIRTCT parameters `, 65 <#_bookmark204>`__

    **NBDYNAM**

    VIRTCT parameters `, 65 <#_bookmark206>`__

    **NBTERM**

    VIRTCT parameters `, 65 <#_bookmark208>`__

    **NODE `, 91 <#_bookmark342>`__ NUMTASK**

    VIRTCT parameters `, 65 <#_bookmark210>`__

    **OSCORE**

    VIRTCT parameters `, 66 <#_bookmark214>`__

    **OTMAPRM**

    VIRTCT parameters `, 65 <#_bookmark212>`__

    **PACKET**

    VIRTCT parameters `, 66 <#_bookmark216>`__

    **PASSTCK**

    VIRTCT parameters `, 66 <#_bookmark218>`__

    **PassTicket `, 66 <#yes-8>`__**

    **Patch VIRTEL program `, 82 <#_bookmark314>`__ PC `,
    91 <#_bookmark344>`__**

    **PREZ900**

    VIRTCT parameters `, 66 <#_bookmark221>`__

    **PRFSECU**

    VIRTCT parameters `, 66 <#_bookmark223>`__

    **PROFILE `, 91 <#_bookmark346>`__ PWPROT**

    VIRTCT parameters `, 67 <#_bookmark225>`__

    **RACAPPL**

    VIRTCT parameters `, 67 <#_bookmark227>`__

    **RACF**

    Security `, 97 <#_bookmark368>`__

    **RAPPL**

    VIRTCT parameters `, 67 <#_bookmark229>`__

    **REALM**

    VIRTCT parameters `, 67 <#_bookmark231>`__

    **REPET**

    VIRTCT parameters `, 68 <#_bookmark233>`__

    **RESOURCE `, 91 <#_bookmark348>`__ RESO**

    VIRTCT parameters `, 68 <#_bookmark235>`__

    **RETOUR**

    VIRTCT parameters `, 68 <#_bookmark237>`__

    **RNODE**

    VIRTCT parameters `, 68 <#_bookmark239>`__

    **RULE `, 92 <#_bookmark350>`__ SECUR**

    VIRTCT parameters `, 69 <#_bookmark241>`__

    **SERVER `, 93 <#_bookmark352>`__ SILENCE**

    VIRTCT parameters `, 69 <#_bookmark243>`__

    **SNAPW**

    VIRTCT parameters `, 70 <#_bookmark245>`__

    **SOMMR**

    VIRTCT parameters `, 70 <#_bookmark247>`__

    **SSERV `, 93 <#_bookmark354>`__ STATDSN**

    VIRTCT parameters `, 70 <#_bookmark249>`__

    **STATS**

    VIRTCT parameters `, 70 <#_bookmark251>`__

    **STEPLIB libraries**

    ICSF `, 22 <#_bookmark25>`__

    MQSeries `, 22 <#_bookmark24>`__

    **STRNO**

    VIRTCT parameters `, 71 <#_bookmark253>`__

    **SUBDIR `, 94 <#_bookmark356>`__ SUITE**

    VIRTCT parameters `, 71 <#_bookmark255>`__

    **SWAP**

    VIRTCT parameters `, 71 <#_bookmark257>`__

    **SYSCLONE `, 72 <#yes-14>`__ SYSPLUS**

    VIRTCT parameters `, 72 <#_bookmark259>`__

    **TCP1**

    VIRTCT parameters `, 72 <#_bookmark262>`__

    **TCP2**

    VIRTCT parameters `, 73 <#_bookmark264>`__ **TERMINAL `,
    95 <#_bookmark358>`__ TIMEOUT**

    VIRTCT parameters `, 73 <#_bookmark266>`__

    **TIMERQS**

    VIRTCT parameters `, 73 <#_bookmark268>`__

    **TITRE1**

    VIRTCT parameters `, 73 <#_bookmark270>`__

    **TITRE2**

    VIRTCT parameters `, 73 <#_bookmark272>`__

    **Top Secret**

    Security `, 100 <#_bookmark378>`__

    **TRACALL**

    VIRTCT parameters `, 74 <#_bookmark274>`__

    **TRACBIG**

    VIRTCT parameters `, 74 <#_bookmark276>`__

    **TRACEB**

    VIRTCT parameters `, 74 <#_bookmark278>`__

    **TRACEOJ**

    VIRTCT parameters `, 74 <#_bookmark280>`__

    **TRACEON**

    VIRTCT parameters `, 74 <#_bookmark282>`__

    **TRACTIM**

    VIRTCT parameters `, 75 <#_bookmark284>`__

    **TRANSACT `, 95 <#_bookmark360>`__ TRAN**

    VIRTCT parameters `, 75 <#_bookmark286>`__

    **UFILEn**

    VIRTCT parameters `, 75 <#_bookmark288>`__

    **UPDATE `, 96 <#_bookmark362>`__**

    **USER `, 96 <#_bookmark364>`__**

    **VIRCONF `, 84 <#_bookmark317>`__**

    **Virconf**

    LOAD `, 84 <#_bookmark320>`__

    NOREPL `, 86 <#_bookmark322>`__

    PLAINTXT `, 96 <#note-2-2>`__

    SCAN `, 87 <#_bookmark326>`__

    UNLOAD `, 86 <#_bookmark324>`__

    **VIRSECU**

    VIRTCT parameters `, 76 <#_bookmark290>`__

    **VIRSV1**

    VIRTCT parameters `, 76 <#_bookmark292>`__

    **VIRTCT01 `, 47 <#_bookmark70>`__ VSAMTYP**

    VIRTCT parameters `, 76 <#_bookmark294>`__ **VTAM application relay
    `, 41 <#_bookmark62>`__ VTAM Primary ACB `, 41 <#_bookmark60>`__
    VTKEYS**

    VIRTCT parameters `, 76 <#_bookmark296>`__

    **VTOVER**

    VIRTCT parameters `, 77 <#_bookmark298>`__ **X-Forwarded-For `,
    60 <#_bookmark167>`__ XM1**

    VIRTCT parameters `, 77 <#_bookmark300>`__

    **XM2**

    VIRTCT parameters `, 77 <#_bookmark302>`__

    **XMIT file `, 16 <#_bookmark17>`__ ZAPH**

    VIRTCT parameters `, 77 <#_bookmark304>`__

.. |image0| image:: images/media/image1.jpeg
   :width: 8.26389in
   :height: 0.85000in
.. |image1| image:: images/media/image2.jpeg
   :width: 3.49562in
   :height: 1.01500in
