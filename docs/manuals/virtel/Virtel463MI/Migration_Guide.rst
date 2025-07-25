.. toctree::
   :maxdepth: 3
   :caption: Table of Contents:

.. _Virtel463MI:

=====================
Migration Guide V4.63
=====================

**VIRTEL Migration Guide**

.. warning:: This is a draft version of the document.
   
Version : 4.63

Release Date : 23/06/2024. Publication Date : 17/02/2024

Virtel SAS, Syspertec Group

302 Bureaux de la Colline, 92213 Saint Cloud Cedex, France Tél. : +33 (0) 1 46 02 60 42

`www.virtelweb.com <http://www.virtelweb.com/>`_

NOTICE

    Reproduction, transfer, distribution, or storage, in any form, of all or any part of 
    the contents of this document, except by prior authorization of Virtel SAS, is prohibited.

    Every possible effort has been made by Virtel SAS to ensure that this document 
    is complete and relevant. In no case can Virtel SAS be held responsible for 
    any damages, direct or indirect, caused by errors or omissions in this document.

    As Virtel SAS uses a continuous development methodology; the information 
    contained in this document may be subject to change without notice. Nothing in this 
    document should be construed in any manner as conferring a right to use, in whole or in 
    part, the products or trademarks quoted herein.

    "Virtel SAS" and "VIRTEL" are registered trademarks. Names of other products 
    and companies mentioned in this document may be trademarks or registered trademarks of 
    their respective owners.  

.. raw:: latex

    \newpage    

.. index::
   Migrating to Virtel V4.63        

.. _V463MI_Introduction:

Migrating to Virtel V4.63
=========================

Overview
--------

The upgrade procedure detailed below will restore a complete "new" system on the mainframe.

Once restored you will have to integrate/migrate to the new libraries (sources or binaries), except for the ARBO (user configuration data) and HTML.TRSF (customization data). Depending on your current Virtel level will dictate the migration path and consequently the updates you will need to do as part of the upgrade process.

- The SAMP.TRSF VSAM file will be completely replaced as part of the upgrade process. Any user directories located within the SAMP.TRSF VSAM file must be migrated to another TRSF file before beginning migration.
- Similarly, you must ensure that you have not saved any customized elements into the SAMP.TRSF directories, a modified w2hparm.js for example. If this is the case, you must move these customisations to a directory hosted on another VSAM file and restore them back after the upgrade processes. Where possible, it is advisable than user modifications should not be kept in the SAMP.TRSF. Migrate them to another directory such as CLI-DIR, located on the HTML.TRSF VSAM file. This VSAM file is not affected by the migration process. 

.. raw:: latex

    \newpage   

.. index::
   Upgrade Procedure   

Upgrade Procedure
-----------------

Before starting the upgrade read through this document first and build a migration plan. Depending on your current release and configuration some of the migration steps may not be applicable.

Download from our file server at http://ftp-group.syspertec.com

- /VIRTEL 4.63/Produits/virtel463mvs.zip
- /VIRTEL 4.63/PTFS/allptfs-mvs463.txt
- /VIRTEL 4.63/PTFS/virtel463updtnnnn.zip

.. warning:: All jobs must be customized to your site standards before running. Backup and keep your existing HTML.TRSF and ARBO VSAM files. 

The procedure for upgrading from a previous release of VIRTEL (version 4.00 or later) is as follows:

1. Download and unzip virtel463mvs.zip.
2. Upload and run job $ALOCDSU. This will allocate a XMIT file on the mainframe.
3. Upload virtel463mvs.xmit to the file allocated by $ALOCDSU.
4. Upload and run job $RESTDSU. This will allocate and install the new Virtel 4.63 libraries.
5. Apply any PTFs using AMASPZAP,PARM=IGNIDRFULL (job ZAPJCL from the new VIRTnnn.SAMPLIB). The input file is allptfs-mvs463.txt.
6. Copy your VIRTCTnn from the old VIRTnnn.CNTL library to the new VIRTnnn.CNTL
7. Reassemble your VIRTCTnn module using the ASMTCT job in VIRTnnn.CNTL
8. If you have any user scenario or user exit modules, copy them to the VIRTnnn.CNTL library and reassemble them using the ASMSCEN and ASMEXIT jobs respectively.
9. Add the new VIRTnnn.LOADLIB library to the system APF list in the MVS PARMLIB and use the SETPROG command to authorize the VIRTnnn.LOADLIB library.
10. Edit your VIRTEL procedure in the MVS PROCLIB, to ensure that:

  - The STEPLIB and DFHRPL DD statements reference the new VIRTxxx.LOADLIB
  - The SERVLIB DD statement references the new VIRTxxx.SERVLIB
  - The SAMPTRSF DD statement references the new VIRTxxx.SAMP.TRSF

11. Apply recommendations as shown below in "Check list and precautions".

.. raw:: latex

    \newpage   

12. Apply any "update" maintenance (virtel463updtnnnn.zip), if any according to the instructions in the Readme-updtnnnn.txt file in the zip.
13. Stop and restart Virtel. If you want to create new copies of your existing ARBO and HTML.TRSF files, and rename them to your V4.63 HLQ, use the JCl shown below. This will preserve any configurational and customized elements you have. For example w2hparm.js, custom.js, custom.css and any customized option members:-

::

  //$VSAMCPY JOB 9000,'COPY FILES',CLASS=A,MSGCLASS=X  
  //STEP0   EXEC PGM=ADRDSSU,REGION=0M PARM=('TYPRUN=NORUN')            
  //SYSPRINT DD SYSOUT=*                                                
  //TEMP DD DUMMY                                                       
   DUMP DATASET              -                                          
        (                    -                                          
         INCLUDE(            -                                          
        HLQ.VIRTnnn.ARBO.**, -                                      
        HLQ.VIRTnnn.HTML.TRSF.**, -                                 
                  )         -                                           
        )                   -                                           
        DELETE    -                                                     
        PURGE      -                                                    
        TOL(ENQF) -                                                     
        OUTDDNAME(TEMP)                                                 
  //STEP1   EXEC PGM=ADRDSSU,REGION=0M PARM=('TYPRUN=NORUN')            
  //SYSPRINT DD  SYSOUT=*                                               
  //SYSUDUMP DD  SYSOUT=*                                               
  //SPT30B   DD  UNIT=3390,VOL=SER=SPT30B,DISP=SHR                      
  //SYSIN    DD  *                                                      
   COPY                                             -                   
         DATASET(                                   -                   
         INCLUDE (                                  -                   
         HLQ.VIRTnnn.ARBO.**                    -                   
         HLQ.VIRTnnn.HTML.TRSF.**               -                   
    )                                               -                   
    )-                                                                  
    RENAMEUNC(HLQ.VIRTxxx.**,HLQ.VIRTyyy.**) -                  
    TOL(ENQF)   -                                                       
    RECATALOG(*) -                                                      
    OUTDYNAM(SPT30B,3390) -                                             
    OPTIMIZE(4)                                                         
  /*                                                                    

*Example job to copy current ARBO and HTML.TRSF user files* 

.. raw:: latex

    \newpage  

.. index::
   Check list and precautions
   pair: All versions; Check list and precautions   

Check list and precautions
==========================

Before migration, you must check the following:-

All versions
------------

- You MUST backup and save a copy of your original configuration ARBO file as this file will be migrated to Virtel 4.63. This can be done using the example JCL procedure above. Alternatively, you can use a VIRCONF UNLOAD process to unload and reload to the new distributed V4.63 ARBO file. See "VIRCONF - Unloading a VIRARBO file" in your CURRENT Virtelxxx_Installation_User_Guide.
- The previous compatibility support option, as defined in the TCT as HTSET1=(OPTION-DEFAULT-COMPATIBILITY) is no longer supported. You must migrate to "global options" support. See the customization manual for further details.
- If you using some "custom" files or options files ("custom.js", "customs.css",custom "w2hparm.js" or any option related files) you MUST check that they are stored in a directory other than W2H-DIR. If not you must store your "custom" files in another directory (CLI-DIR for example). 
- Ensure that the directory on which "custom" file are stored is not the W2H-DIR directory as this directory is allocated to the VIRTxxx.SAMP.TRSF VSAM file. VIRTxxx.SAMP.TRSF is completely replaced as part of the migration procedure. Any customized elements will be lost or overwritten. See SAMPLIB(CUSTCSS) as a sample job to point the relevant transactions to a directory other than W2H-DIR. The suggested directory should be CLI-DIR. For further information on customization see the section "Virtel customization Modes" in the Virtel User Guide.

.. note:: For customers who wish to run in 'Option Customization' mode you must run the ARBOLOAD job in the CNTL library with OPTIONS=YES. This will add the relevant transactions to support the /option/ pathname. Also, the SAMPLIB(CUSTCSS) job should be modified and run. It should only include the W2H-03P and CLI-03P transactions. Option customization mode still maintains a global w2hparm.js in CLI-DIR. This needs to refelcted in the ARBO VSAM file. Any w2hparm changes should be made to w2hparm.js and stored in CLI-DIR.

.. note:: w2hparm.js as shipped is now a dummy file and no longer includes any default settings. Your customized w2hparm.js should only include changes that are required by your installation. See "Global modification of web Access settings" in the Virtel User Guide.

.. index::
   pair: Version older than 4.53; Check list and precautions   

Upgrading from a version prior to 4.53
--------------------------------------

.. danger:: YOU MUST:

- Add (or modify) the BFVSAM parameter in the VIRTCT to specify BFVSAM=32768. An "OPEN ERROR DC" on the SAMP.TRSF file will occur at STC startup if this is not done.
- Check the content of the transaction with external name = "Administ" - W2H-20 - present under the WEB2HOST entry point and enter "ADMINVWM" in the "Output Scenario" field if the current value is different. 

For performance YOU CAN:

  - Modify the Shareoptions of the ARBO File from (4 3) to (2 3). To do this, use job ALTERSHR from the new VIRTnnn.SAMPLIB.
  - Increase the CISIZE of the data part of ALL existing TRSF file (except for the delivered SAMP.TRSF which is already correctly defined) to specify, CIZISE(32768) or CISIZE(16384) on the DATA part of the files. Use the job TRSFREOR from VIRTnnn.SAMPLIB.
  
.. index::
   pair: Version 4.53; Check list and precautions   

Upgrading from a version prior to 4.54
--------------------------------------

In addition to the above instructions

- If the directory SCE-DIR does not exist in your environment, YOU MUST run the job MIGR454A found in the SAMPLIB library.
- If you are not using the dynamic directory interface (DDI) remove redundant ARBO elements. See sample JCL below.

::

    //$ARBODEL JOB 1,ARBODEL,CLASS=A,MSGCLASS=X,NOTIFY=&SYSUID         
    //*                                                                 
    // SET LOAD=HLQ.VIRTnnn.LOADLIB                                 
    // SET ARBO=HLQ.VIRTnnn.ARBO                                    
    //*                                                                 
    //CONFIG  EXEC PGM=VIRCONF,PARM='LOAD,REPL',REGION=2M               
    //STEPLIB  DD  DSN=&LOAD,DISP=SHR                                   
    //SYSPRINT DD  SYSOUT=*                                             
    //SYSUDUMP DD  SYSOUT=*                                             
    //VIRARBO  DD  DSN=&ARBO,DISP=SHR                                   
    //SYSIN      DD *                                                   
     DELETE TYPE=TRANSACT,ID=W2H-03A    Delete W2H-Global            
     DELETE TYPE=TRANSACT,ID=W2H-03G    Delete W2H-Group             
     DELETE TYPE=TRANSACT,ID=W2H-03U    Delete W2H-User              
     DELETE TYPE=TRANSACT,ID=W2H-80A    Delete W2H-Global Upload     
     DELETE TYPE=TRANSACT,ID=W2H-80G    Delete W2H-Group Upload      
     DELETE TYPE=TRANSACT,ID=W2H-80U    Delete W2H-User Upload       
     DELETE TYPE=TRANSACT,ID=CLI-03A    Delete CLI-Global            
     DELETE TYPE=TRANSACT,ID=CLI-03G    Delete CLI-Group             
     DELETE TYPE=TRANSACT,ID=CLI-03U    Delete CLI-User              
     DELETE TYPE=TRANSACT,ID=CLI-80U    Delete CLI-User Upload       
     DELETE TYPE=TRANSACT,ID=W2H-07     Delete DDI                   
     DELETE TYPE=TRANSACT,ID=W2H-66     Delete Capability token     
     DELETE TYPE=SUBDIR,ID=GLB-DIR      Delete Global Sub-Dir        
     DELETE TYPE=SUBDIR,ID=GRP-DIR      Delete Group Sub-Dir         
     DELETE TYPE=SUBDIR,ID=USR-DIR      Delete User Sub-Dir                   

.. index::
   pair: Version 4.54; Check list and precautions   

Upgrading from a version prior to 4.55
--------------------------------------

- If you have developed JavaScript code which manipulates the status bar located at the bottom of the 3270 screen, YOU MUST refer to "Example: Modifying the text of the status bar" in "VIRTEL Web Access" document and review your changes.
- You must modify the definition of the WEB2HOST entry point to reference the SCE-DIR in the field named DIRECTORY FOR SCENARIO. With Version V4.55 Virtel scenarios are now provided as objects in the SCE-DIR directory. Virtel scenarios located in the Virtel loadlib will no longer be maintained in future releases of Virtel. Customers who have users scenarios should consider migrating them to .390 objects using Virtel Studio and load them from SCE-DIR. Virtel will contain to still load scenarios from the Virtel loadlib providing the field name DIRECTORY FOR SCENARIO in the Entry point is blank.    
- If you are using customized Virtel Web Access (VWA) elements, you must add the following parameter in your VIRTCT: HTSET1=(OPTION-DEFAULT-COMPATIBILITY) unless you are planning to migrate to "option configuration' mode. For further information on customization see the section "Virtel customization Modes" in the Virtel User Guide. 

.. index::
   pair: Version 4.55; Check list and precautions   

Upgrading from a version prior to 4.56
--------------------------------------

Run the ARBOMIGR job found in the SAMPLIB directory. This will add the transactions for the DOC-DIR directory. 

.. index::
   pair: Version 4.56; Check list and precautions 

Upgrading from a version prior to 4.57
--------------------------------------

None

Upgrading from a version prior to 4.58
--------------------------------------

None

Upgrading from a version prior to 4.59
--------------------------------------

None

Upgrading from a version prior to 4.60
--------------------------------------

HTSET1=(OPTION-DEFAULT-COMPATIBILITY) TCT option removed.


Upgrading from a version prior to 4.61
--------------------------------------

None

Upgrading from a version prior to 4.62
--------------------------------------

LOCADDR2 and PARTNER2 LINE keywords are no longer supported in VIRCONF.

Virtel 4.62 update #6137 introduces a new update directory named "cli" corresponding to the CLI-DIR directory in VIRTEL. This directory contains elements to enable the new color customization scheme. If you already have customized colors in place, please contact Virtel support for assistance.

All files present in the "cli" directory must therefore be uploaded to the CLI-DIR directory using the Drag & Drop interface. 
If you do not have a CLI-DIR directory in your custom installation, please contact Technical Support before installing this update.

You must also ensure that EACH entry point defined in your system has an external name transaction "option" 
pointing to CLI-DIR. If certain entry points already have an "option" transaction but this does not point to CLI-DIR, 
then the files present in the "cli" directory must be uploaded into the directory(ies) pointed by the different “option” 
transactions.


.. raw:: latex

    \newpage   

.. index::
   Running under VSE 

Running under VSE
=================

- Send a request to support@syspertec.com for any missing JCL described above.
- You MUST modify the VIRTEL startup JCL to increase the SIZE parameter from 40K to 80K (// EXEC VIR0000,SIZE=80K,DSPACE=2M). 

.. raw:: latex

    \newpage   

.. index::
   What's new in this release.     


.. |image1| image:: images/media/logo_virtel_web.png