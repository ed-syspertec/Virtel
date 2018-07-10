.. toctree::
   :maxdepth: 3
   :caption: Table of Contents:

.. _Virtel-FAQ:

===========
Virtel FAQs
===========

|image1|

**VIRTEL Frequently asked Questions**

Release Date : 24 May 2018. Publication Date : 08/01/2018

Syspertec Communication

196, Bureaux de la Colline 92213 Saint-Cloud Cedex Tél. : +33 (0) 1 46 02 60 42

`www.syspertec.com <http://www.syspertec.com/>`_

NOTICE

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

.. raw:: latex

    \newpage    

FAQs
----

How to deactivate the Virtel status bar
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 

To deativate the status bar create a ccs rule and add it to your custom css file. For example in custCSS.test1.css add the following statement:-

::
 
    div#statusbar {display:none!important}

How to use the TSO OMVS panel command with VWA
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 

TSO OMVS writes to the screen after 20 seconds changing the status from RUNNING to INPUT. This asynchronous nature forces Virtel to generate a HTML page which updates the whole screen, erasing any partially entered input field. Once the screen is in INPUT mode OMVS will not write to the screen in this ASYNC fashion anymore. The work around for this is to wait for the status change before entering any input. Alternatively you can put the screen into INPUT mode immediately by pressing F12=Retrieve, and then pressing Home and End to clear the input area. 

Another solution is to use PuTTY to connect to the OMVS shell via rlogin to port 513. This solution avoids many of the other usability problems which are inherent in the OMVS shell.

Can VIRTEL WEB ACCESS emulate z/OS Operator consoles
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 

Technically VIRTEL does not support the OSA-ICC console server because it is based on the tn3270 protocol which VIRTEL does not use. But in any case it probably would not make sense to put consoles under VIRTEL control because the consoles need to be operational during IPL before TCP/IP and VIRTEL are started. So we would expect customers to continue to run tn3270 emulators on those PCs which are used as z/OS operator consoles.

Can I customize hotspot recognition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

The regular expressions which control hotspot recognition may be overridden by setting VIR3270.customPfKeysHotspotRegex and/or VIR3270.customUrlHotspotsRegex in custom.js.

For example, an application requires strings of the format "PFnn-caption" to be recognized as PF hotspots. The customized code in a custom.js file would be:

::

    function after_responseHandle(o, url, xtim) {
    VIR3270.customPfKeysHotspotRegex = /(P?F\d{1,2}|PA[1-3]|ENTER|CLEAR)((?:\/P?F\d{1,2})?\s*[=:-])/;
    }

    
.. |image1| image:: images/media/logo_virtel_web.png
            :scale: 50 %     