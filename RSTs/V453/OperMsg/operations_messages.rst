.. _Virtel453OM:

=======================
Messages and Operations
=======================

|image0|

|image1|

**VIRTEL Messages and Operations**

Version : 4.53

Release Date : 24 Sep 2014 Publication Date : 13/10/2014

Syspertec Communication

196, Bureaux de la Colline 92213 Saint-Cloud Cedex Tél. : +33 (0) 1 46 02 60 42

`www.syspertec.com <http://www.syspertec.com/>`__

.. note::

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

Summary of Amendments
=====================

.. _V453OM_Introduction:

1. Monitoring
=============

1.1 Monitoring lines and terminals
==================================

The Line Status sub-application allows the administrator to display the current status of lines and terminals or irtual circuits (CVC) managed by VIRTEL control, and optionally to modify the status of lines.

Displaying line status
----------------------

The Line Status sub-application is invoked by pressing [PF9] in the Configuration Menu, by pressing [PF10] in the Sub- Application Menu, or via the Multi-Session Menu using a transaction which calls module VIR0027.

When the security subsystem is active, access to Line Status sub-application from the Configuration Menu or the Sub- Application Menu is controlled by the resource $$UTIL$$.
When accessed by a transaction, normal transaction security rules will apply. Security management is described in chapter 4 of the VIRTEL Technical Documentation.

The sub-application begins by displaying the Line Status Display screen. Started lines are displayed in high-intensity or white text, stopped lines are displayed in low intensity or blue text.

|image_01|

*Fig.1 - Line Status Display screen*

STATUS OF-LINES
    Allows the administrator to display a subset of lines, by typing the
    first character of the name of each desired line into this field and
    pressing [Enter]. If the field is blank, all lines are displayed.

C
    Command input field.
Name
    The internal name of the line.
In
    The number of virtual circuits currently in use by incoming calls.
Out
    The number of virtual circuits currently in use by outgoing calls.
Links
    The number of terminals linked to the line.
Description
    Comments.
Seen
    User name.

Positioning the list
--------------------
If the line status display occupies more than one screen, you can scroll through the list of lines by using [PF5], [PF7] and [PF8].

[PF5]
    return to the first page of the list.

[PF7]
    scroll back to previous page.

[PF8]
    scroll forward to next page.

Sending a command
-----------------
To send a command to a line, place the cursor in the “C” field in front of the line name, type the command, then press [Enter]. The  commands available are:

S
    Starts a line.
        If the line is already started, VIRTEL attempts to start or restart any terminals associated with the line but not currently linked. This allows VIRTEL to recover LU’s which have been     deactivated and reactivated by VTAM, without stopping the line.

p
    Stops a line.
        The LINE START and STOP commands can also be issued from the z/OS or VSE console. See “Starting and stopping a line"

To return to the configuration menu, press [PF3] or [Clear].

1.2 Displaying Line Usage
=========================

    To display the status and line usage place the cursor on the desired line in the Line Status
    Display screen and press [PF12].

    Security rules are the same as those which apply to the previous screen.

    This sub-application begins by displaying the terminal usage for the selected line, as shown in the example below:

|image_02|

*Fig.2 - Line Usage Detail Display screen*

ACTIVE TERMINALS for LINE
    Indicates the internal name of the line whose virtual circuits are being displayed.
Prefix
    The terminal name prefix associated with this line.
Type
    The line type, as defined in the line definition.
Defined
    The number of terminals defined for this line.
Linked
    The number of terminals currently linked to this line.
Number of occupied circuits
    The number of terminals or virtual circuits currently in use.
Number of connections
    The total number of calls received.
Maximum simultaneously used
    The maximum number of terminals or virtual circuits in use at any one time.
Total time connected
    The total connection time.
Terminal
    The terminal name (name of the virtual circuit).
User
    User name if signed on to VIRTEL.
Sends
    The number of messages sent to the terminal.
Time
    The connection time in minutes.
Node (for Minitel)
    The name of the node to which the terminal is currently connected.
Node (for HTTP lines)
    The relay name (3270 LU name) used to connect to the host application.
Remote number (for X25 lines)
    The X25 called number for an outgoing call, or the X25 calling number for an incoming call.
Remote number (for HTTP lines)
    The IP address of the client.
Call Data (for X25 lines)
    The call user data field of the call packet (for both incoming and outgoing calls).
Call Data (for HTTP lines)
    The external name of the transaction which represents the directory (pathname) in the URL.

    If the Virtual Circuit Status Display occupies more than one screen, you can scroll through the list of terminals by using [PF7] and [PF8].

[PF7]
    scroll back to previous page.

[PF8]
    scroll forward to next page.

    You can use the [PF4] and [PF5] keys to display information about the other lines under VIRTEL control. To view the terminal or Virtual Circuit Status Display screen for the following line, press [PF4]. To return to the Detail Usage Status Display screen for the first line defined in VIRTEL, press [PF5].

    To return to the Lines Status Display, press [PF3]. To return to the Configuration Menu, press [Clear].

2. Operations
=============

    VIRTEL allows certain functions to be controlled dynamically by
    console commands.

    Use one of the following methods to send a command to VIRTEL, according to the operating system:

2.0.1 z/OS Environment
----------------------
The following modify command may be issued at the z/OS operator console, or from an SDSF session under TSO, in which case the command must be prefixed by the character “/”:

::

    F stcvirte,virtel-command    

stcvirte
    the name of the VIRTEL started task STC

virtel-cmd
    a VIRTEL command, as described in the following section.

2.0.2 z/VSE Environment
----------------------- 
To send a command to VIRTEL, issue the following command at the VSE operator console:

::

    MSG virtel,DATA=cirtel-command    

virtel
    The VIRTEL jobname (usually VIRTEL), or the partition in which VIRTEL is executing (for example, F4)

virtel-cmd
    A VIRTEL command, as described in the following section. Alternatively, issue the following command at the VSE operator console:

::

    MSG Fx    

Fx
    Partition in which VIRTEL is executing

    The system responds with: 

::

    AR 0015 1I40I READY
    Fx-nnnnAR 0015     

.. note::
    
    Note the reply number (nnnn) and issue the following command:

::

    nnnn virtel-cmd    

nnnn
    reply number

virtel-cmd
    A VIRTEL command, as described in the following section

2.1 Displaying VIRTEL Lines And Terminals
=========================================

2.1.2   Display lines
---------------------
::
    
    LINES | LINES,ACT | LINES,INACT    


    The LINES command displays the VIRTEL ACB name and a list of the lines defined in the VIRTEL configuration file. The optional keywords ACT or INACT may be used to restrict the display to lines in “started” or “stopped” state respectively.

2.1.2   Display line detail
---------------------------

::

    LINE=linename,DISPLAY (or L=linename,D)

linename
    Internal or external name of the line

    The LINE DISPLAY command displays the status of a line and its
    associated terminals.

2.1.3 List of Virtel LU relays

::
    
    RELAYS    

    The RELAYS command displays the VIRTEL ACB name and a list of the relay LUs opened by VIRTEL.

2.2 Starting and Stopping A Line
================================

::

    LINE=linename,START | STOP
    L=linename,P | S  

linename
    Internal or external name of the line

    The LINE START and LINE STOP commands perform the same function as the `“S” and “P” commands <#_bookmark12>`__ on the “Status of
    lines”. These commands may only be issued for line types AntiGATE, AntiPCNE, AntiFASTC, and TCP/IP.

2.3 Display Internal Memory Usage
=================================

::

    MEMDISPLAY

With the memory diagnostic tool active the MEMDISPLAY command summarize the VIRTEL subpool active allocated memory.

::

    VIR0200I MEMDISPLAY
    VIR0271I DISPLAY 978
    SP1=00024478 SP2=00001044 SP3=0008E35F SP4=00002F61
        00910091 00040009 02380294 000B0011
    SP5=000317DC SP6=0004DF73 SP7=00000000 SP8=00000220
        00C504C7 01370137 00000000 00000002
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


The display response is split into a summary section for each subpool and a detailed allocated page block and free queue element display for each subpool.

In the summary display, each subpool has two displayed values. The top value is the amount of storage currently allocated and the value below represents the current allocation in 1K chunks and a peak allocation in 1K chunks.

For example in the above display in SP5 we can see that there is an allocated value of 317DC bytes, represented by 00C5 in 1K chunks, and a peak value of 04C7 in 1K chunks.

At the bottom of the display is a line which provide allocated, free and total values.

2.3.1 Memory Management Commands 
--------------------------------

Memory Display feature is activated by using the MEMHST subparameter in the MEMORY parameter present in the VIRTCT.(see the VIRTCT subparameter MEMHST in “VIRTEL456 Installation User Guide”).

It can be deactivated by using the command:

::

    F VIRTEL,MEMDISPLAY,DISABLE

.. note::

        This command should only be implemented when advised to do so by Technical Support. Performance degradation might occur due to the additional monitoring services. This will depend on VIRTEL demand.

2.4 Stopping Virtel
===================

::

    STOP        

The STOP command allows to STOP the VIRTEL task. This command is  intended to be mainly used in VSE environment even if it is also available in z/OS environmment. On z/OS environment you can also use the following command :

::

    P stcvirte

stcvirte
    The name of the VIRTEL started task STC

2.5 Stopping a scenario
=======================
::

    KILL,T=termid


termid
    terminal name

    The KILL command requests VIRTEL to abnormally terminate the scenario currently active on the specified terminal.

2.6 Virtel Trace Commands
=========================

    A trace can be activated on the device or on his relay.

::
    
    TERM=termid,TRACE (or T=termid,T)
    TERM=termid,NOTRACE (or T=termid,N)
    RELAY=relayname,TRACE (or R=relayname,T)
    RELAY=relayname,NOTRACE (or R=relayname,N)

termid
    terminal name

relayname
    relay associated to the terminal

It is often easier to identify the relay used whose name appears at the bottom of the 3270 session screen as shown below.

|image_03|
*Fig.3 - Associated relay names*

linename
    Internal or external name of the line

The following alternate forms of the TRACE/NOTRACE commands are also  valid

::

    TRACE,T=termid
    TRACE,L=linename
    TRACE,R=relayname
    NOTRACE,T=termid
    NOTRACE,L=linename
    NOTRACE,R=relayname

termid
    terminal name

linename
    Internal or external name of the line

relayname
    Name of VTAM relay LU currently associated with the terminal

2.6.1 Display a list of active traces
-------------------------------------

::

    TRACE,DISPLAY | D

2.6.2 Deactivate all traces        
---------------------------

::

    NOTRACE,ALL

This command does not affect any memory trace. To stop a memory trace, refer to “Memory trace management”

2.7 SNAP Command
================

2.7.1 SNAP internal trace table
-------------------------------

::

    SNAP
 
The SNAP command prints the contents of the VIRTEL internal trace table. See “VIRTEL SNAP”.

2.7.2 Terminal or Relay SNAP
----------------------------

::

    SNAP,T=termid | R=relayname

termid
    terminal name

relayname
    name of VTAM relay LU currently associated with the terminal

2.7.2 Message trigger SNAP

::

    SNAPMSG,ALL    

The SNAPMSG command requests VIRTEL to generate an automatic SNAP after certain messages (VIRI902W VIR0026W VIR0052I VIR1552I VIR0526W VIR1952I).

::

    SNAPMSG=(message,search,action)

The SNAPMSG parameter allows a SNAP or DUMP to be taken whenever a particular message number is issued by VIRTEL. The command has an additional search field which can be used to identify a message with a paticular character string, for example a specific return code. This feature is also avalable by using the SNAPMSG command from the console. See “SNAPMSG command”.

message
    Any message that can be issued by Virtel.

search
    Any seache criteria issued within the message. The search file is restricted to a maximu of 10 characters. Anything beyond will be ignored. Default search is none.

action
    Possible values are S for SNAP or A for ABEND. Virtel will abend with a U0999 abend code, reason code 15 if the ABEND action is used.
    
Default action is SNAP.

2.7.3 80-column SNAP
--------------------

::

    SNAP80 

The SNAP80 command prints the contents of the VIRTEL internal trace table in 80 column format, whatever the current value of the SNAPW parameter.

2.7.4 Adjustng the SNAP format
------------------------------

::

    SNAPW=80 | 132

The SNAPW command sets the width for future SNAP commands (80 or 132 columns). The SNAPW parameter in the VIRTCT determines the default width at VIRTEL startup. Refer to the section “Parameters of the     VIRTCT” in the VIRTEL Installation Guide for details of the SNAPW parameter.

2.8 Refreshing a VIRTEL program
===============================

::

    NEW=progname

progname
    program name

The NEW command requests VIRTEL to load a fresh copy of a program  (presentation module, exit, etc) into the VIRTEL address space. This is required after an update has been made to a program. The message     VIR0060W PROGRAM progname IS A NEW COPY indicates a successful reload. The message VIR0061W PROGRAM progname NOT IN MEMORY indicates that the program has not yet been loaded into the VIRTEL address space. In this case, VIRTEL will load the program automatically when it is next needed.

2.9 Refreshing a VIRSV Service program

::

    VIRSV,NEW=servname    

servname
    service name

The VIRSV,NEW command requests VIRTEL to stop the requested VIRSV service. This has the effect of loading a fresh copy of the associated service program the next time the service is invoked by a scenario. The message VIR0260W SERVICE servname IS A NEW COPY indicates that the service was stopped successfully. The message VIR0261W


SERVICE servname NOT IN MEMORY indicates that the service is not yet started. In this case, VIRTEL will start the service and load the  program automatically when it is next needed.

2.9 Sending a mesage to VIRTEL Multi-Session users
==================================================

::

    MSG=message text

The specified message will be displayed on the VIRTEL multi-session screen.

2.10 Supressing messages
========================

::

    SILENCE

The SILENCE command reverses the state of the SILENCE parameter in the VIRTCT. Its purpose is to activate or deactivate the suppression of terminal connection and disconnection messages written to the     operator console.

.. note::

    Refer to the section SILENCE parameter in the "Parameters of the VIRTCT" in the VIRTEL Installation Guide for a list messages affected by this command.)

2.11 - Patching a Virtel Program
================================

::

    ZAP=progname+offset,verify,replace

progname
    program name

offset
    offset into program

verify
    verify value (2 to 8 hexadecimal digits)

replace
    replacement value (2 to 8 hexadecimal digits)

The ZAP command allows the dynamic application of a corrective patch to a program while VIRTEL is running. This command is intended to be used only under the advice of Syspertec technical support personnel.

3. Performance
==============

The VIRTEL started task offers the administrator 5 sources of information to verify the correct functioning and performance of VIRTEL, to monitor its activity, or to diagnose possible problems:

-  the CONSOLE file

-  the VIRLOG file

-  the VIRTEL Logger

-  the TRACE in the VIRTRACE file

-  the SNAP in the SYSPRINT file

3.1 The console file

In **z/OS environment**, the CONSOLE file is written to the VIRTEL started task’s JESMSGLG file.

In **VSE environment**, the CONSOLE file is written to the VIRTEL partition’s POWER LST file (LISTLOG)

The CONSOLE file allows the administrator to monitor the startup and subsequent activity of VIRTEL. Using the console file, the administrator can check that the VSAM files are correctly opened, verify that the customer key has been correctly recognized, check the initialization of the TCP/IP sockets interface using the correct IP address and port, and monitor connections and disconnections of terminals and applications.

.. note::
    
    The SILENCE=YES parameter in the VIRTCT allows the suppression of certain console messages relating to the connection and disconnection of terminals.

|image_04|
*Fig. 4 Example of CONSOLE file*

3.1 The VIRLOG file
===================

This is a printable file with record length 131 and record format FA which provides a record of IP connections to VIRTEL. The figure below shows an example of VIRLOG entries for incoming
HTTP calls:

::

    £Software: VIRTEL 4.32
    £Date: 02/01/06
    £Line Local Pseudo Started Ended Price Received Sent Remote Address User
    W-HTTP WHT00200 DELOC003 I 15.34.53 15.34.53 00000007 00000381 00023135 192.168.000.043 200 PUBLIC DATA.JS W2H-DIR
    W-HTTP WHT00200 DELOC002 I 15.34.53 15.34.53 00000004 00000381 00010833 192.168.000.043 200 PUBLIC JS01.JS W2H-DIR
    W-HTTP WHT00200 DELOC003 I 15.34.53 15.34.53 00000007 00000386 00006976 192.168.000.043 200 PUBLIC VIRTBLUE W2H-DIR
    W-HTTP WHT00200 DEVTA003 I 15.34.53 15.34.59 00000649 00001169 00010397 192.168.000.043 PUBLIC WEB2VIRT W2H-10
    W-HTTP WHT00200 DELOC002 I 15.35.02 15.35.02 00000005 00000402 00000049 192.168.000.043 304 WEB2HOSTXHTML.JP W2H-DIR
    
    *Fig. 5 Example of VIRLOG file (HTTP)*

The LINE column shows the internal name of the HTTP line.
The LOCAL column shows the name of the rule selected for each call.
The PSEUDO column shows the VIRTEL terminal name used.

The next column contains “I” to indicate this is an incoming call.

The STARTED and ENDED columns show the start and end time of each IP session.

The PRICE column represents the duration of the transaction in hundredths of a second This value may be modified by exit 7.

The RECEIVED and SENT columns contain the number of bytes received from and sent to the browser. The REMOTE ADDRESS column contains the IP address of the browser.

The USER column contains the userid if the transaction is secured.
The next column contains the HTTP status code (for static pages) The last three 8-byte columns represent:

    -  The external name of the VIRTEL transaction which represents the HTTP path name.
    -  The name of the HTML page.
    -  For static pages: The name of the VIRTEL directory containing the HTML page.
    -  For dynamic pages: The internal name of the HTTP transaction which was used to populate the page.

The figure below shows an example of VIRLOG entries for X25 calls:

::

    £Software: VIRTEL 4.32
    £Date: 11/21/07
    £Line Local Pseudo Started Ended Price Received Sent Remote Address User
    X001LINE 001880 X001T007 I 13.47.37 13.48.00 00002288 00000392 00000119 191334833 MINITEL
    X001LINE G001T004 X001T000 O 13.48.30 13.48.50 00001966 00000001 00000001 191334833001870
    X001LINE P001O001 X001T001 O 13.48.49 13.49.20 00003069 00000001 00000001 001870 PCNE1
    X001LINE G001T003 X001T002 O 13.49.01 13.49.22 00002147 00000001 00000001 001870

    *Fig. 6 Example of VIRLOG file (X25)*

The LINE column shows the internal name of the X25 line.

The LOCAL column shows the called subaddress for incoming calls, or the name of the associated AntiGATE or AntiPCNE terminal for outgoing calls.

The PSEUDO column shows the VIRTEL terminal name used.

In the next column “I” indicates an incoming call, “O” indicates an outgoing call. The STARTED and ENDED columns show the start and end time of each call.

The PRICE column represents the duration of the transaction in hundredths of a second, except for calls on Fast Connect lines, where the PRICE column contains the “X25 units sent” value supplied by NPSI. This value may also be modified by exit 7.

The RECEIVED and SENT columns contain the number of bytes received from and sent to the X25 line.

The REMOTE ADDRESS column contains the caller X25 number for incoming calls, or the called X25 number for outgoing calls.

The last column contains the PCNE call user data (if present), otherwise it contains the default entry point name for X25 calls specified by the DEFENTR parameter in the VIRTCT. For GATE calls this column is blank.

3.1.2 The VIRTEL logger
-----------------------

The VIRTEL log can also be written to the system logger when LOG=LOGGER is specified in the TCT. VIR0002B is a batch program that can be run to extract the VIRTEL records from the System Logger.

The figure below shows an example of JCL to extract and format the VIRTEL LOG entries recorded in the System Logger:

::

    //LOGGER PROC P=
    //S01 EXEC PGM=VIR0002B,PARM='&P'
    //STEPLIB DD DSN=VIRTEL.LOADLIB,DISP=SHR
    //VIRLOG DD SYSOUT=*,DCB=BLKSIZE=25500
    // PEND
    //S01 EXEC LOGGER,P='DELETE(>2)'
    VIRLOG DCB LRECL=255,BLKSIZE=25500,RECFM=VB

    *Fig. 7 Example of JCL to extract the VIRTEL LOG from the System Logger*

The available JCL parameters are:

::

                (>nnn)
    COPY [----------------------]
            (fromdate[,todate])
                (>nnn)
    DELETE [--------------------]
                (date)

The date format is yyyyddd.

3.1.2.1 Examples
^^^^^^^^^^^^^^^^

::

    COPY Copy all records
    COPY(>2) Copy records older than 2 days
    COPY(>0) Copy up to yesterday
    DELETE(>2) Delete records older than 2 days
    COPY(2015047) Copy records from 2015.047
    COPY(2015047,2015048) Copy records from 2015.047 thru to 2015.048 DELETE(2015047) Delete records prior to 2015.047
    COPY(>0),DELETE(>1) Will copy records from the previous and earlier,
    and will then delete from 2 days ago leaving about 24 hours of data in the log stream.

*Fig. 8  Example of VIRTEL LOGGER extraction parameter*

3.2 Virtel trace
================

All messages which pass between a terminal and a host application, or all messages received and sent on a line, can be traced to a print file.

Activation and deactivation of a trace on a terminal or a line is performed by means of the TRACE and NOTRACE commands (see “VIRTEL commands” and “Activating and deactivating a terminal or line trace”).

.. note::

    A terminal or line trace remains active until a corresponding NOTRACE command is issued or until the VIRTEL started task terminates.

It is also possible to trace specific incoming calls (“tracing by rule”). In this case, activation of the trace is specified in the definition of the rule which VIRTEL uses to route the incoming call. For example, a rule can be created to activate the trace for calls which originate from a specific terminal address (X25 or IP). The trace can be activated for commands and/or data packets.

Activation or deactivation of a “trace by rule” is performed via the VIRTEL on-line configuration menus, and consists of updating the “Trace” field in the rule definition, followed by pressing the F1 key. See “Rules” in the VIRTEL Connectivity Reference manual for more details.

.. note::

    A “trace by rule” remains active as long as the “Trace” field in the rule definition is not empty. Message VIR0036W confirms the activation of the trace.

In **z/OS environment**, the trace data is written to the VIRTRACE file in the VIRTEL started task. 
In **VSE environment**, the trace data is written to the POWER LST file of the VIRTEL partition.

Activation and deactivation of a memory trace is performed by means of the MEMTRACE and NOMEMTRACE commands (see “Memory Trace Management”). The allocation memory is written in the SNAP file when a SNAP command is issued.

3.2.1 Contents of the trace
---------------------------

    +-----------+------------------------------------------+-----------------------------------------------+
    + Line type + Contents of line trace                   + Contents of terminal trace or trace by rule   +
    +===========+==========================================+===============================================+
    + HTTP      + All messages flowing  between the VIRTEL + Terminal without relay: None                  +
    +           + HTTP server and client browsers          + Terminal with relay: Contents of the 3270     + 
    +           +                                          + datastream between VIRTEL and the host        +  
    +           +                                          + application                                   +
    +-----------+------------------------------------------+-----------------------------------------------+
    + SMTP      + All messages flowing to and from the     + None                                          +
    +           +  VIRTEL SMTP server                      +                                               +    
    +-----------+------------------------------------------+-----------------------------------------------+
    + XOT       + All messages flowing between VIRTEL and  + All X25 messages (excluding the XOT header)   + 
    +           + the router, including the XOT headers    + belonging to the specified virtual circuit.   +
    +-----------+------------------------------------------+-----------------------------------------------+     
    + /GATE     + Messages on the control session between  + Messages on the data session between the CVC  + 
    +           + the MCH LU and the CTCP                  + LU and the CTCP (data packets, X25 RESET and  + 
    +           + (call packet and call acknowledgement)   + CLEAR commands)                               +
    + /FASTC    +                                          +                                               +
    +-----------+------------------------------------------+-----------------------------------------------+
    + /PCNE     + None                                     + Data flowing between the terminal LU and the  +
    +           +                                          + application.                                  + 
    +-----------+------------------------------------------+-----------------------------------------------+ 
    + APPC      + N/A                                      + Messages on the LU6.2 session                 +
    +-----------+------------------------------------------+-----------------------------------------------+
    + GATE      + N/A                                      + Messages on the data session between the NCP  + 
    + FASTC     +                                          + and VIRTEL.                                   +
    +-----------+------------------------------------------+-----------------------------------------------+                                 
    + 3270      + N/A                                      + The 3270 datastream between the terminal and  +  
    +           +                                          + VIRTEL, and the 3270 datastream between VIRTEL+
    +           +                                          + and the host application.                     + 
    +-----------+------------------------------------------+-----------------------------------------------+
    + PCNE      + N/A                                      + The Vidéotex datastream between the terminal  + 
    + (Minitel) +                                          + and VIRTEL, and the 3270 datastream between   + 
    +           +                                          + VIRTEL and the host application.              + 
    +-----------+------------------------------------------+-----------------------------------------------+ 

3.2.1.2 Examples of traces
^^^^^^^^^^^^^^^^^^^^^^^^^^

::

    LCL712 11A: from application SPCICST 13:05:47.48
    00000 F1C2 *1B * 099A95B4
    LCL712 11A: from application SPCICST 13:05:47.49
    00000 F5C2114B E9131140 5B290242 F1C0F8E2 89879596 9540A396 40C3C9C3 E24011C1 *5B..Z.. $...1é8Signon to CICS .A* 099A95B4
    00020 40290242 F4C0F0C1 D7D7D3C9 C4290242 F5C0F0E2 D7C3C9C3 E2E34011 C8F02902 * ...4é0APPLID...5é0SPCICST .H0..* 099A95D4
    00040 42F4C0F0 E3A89785 40A896A4 9940A4A2 85998984 40819584 409781A2 A2A69699 *.4é0Type your userid and passwor* 099A95F4
    00060 846B40A3 88859540 979985A2 A240C5D5 E3C5D97A 114BD929 0242F4C0 F0E4A285 *d, then press ENTER:..R...4é0Use* 099A9614
    00080 99898440 4B404B40 4B404B29 0241F442 F5114BF1 1DF0114B F4290242 F4C0F0C7 *rid . . . ....4.5..1.0..4...4é0G* 099A9634
    000A0 9996A497 8984404B 404B404B 290241F4 42F5114C 4B1DF011 4CE92902 42F4C0F0 *roupid . . ....4.5.<..0.<Z...4é0* 099A9654
    000C0 D781A2A2 A6969984 404B404B 404B2903 41F442F5 C04C114D C11DF011 4DF92902 *Password . . ....4.5é<.(A.0.(9..* 099A9674
    000E0 42F4C0F0 D3819587 A4818785 404B404B 404B2902 41F442F5 114E4C1D F01150D5 *.4é0Language . . ....4.5.+<.0.&N* 099A9694
    00100 290242F4 C0F0D585 A640D781 A2A2A696 9984404B 404B404B 290341F4 42F5C04C *...4é0New Password . . ....4.5é<* 099A96B4
    00120 1150F11D F0115A50 1D7C115B 5B1DF011 5B602902 42F2C0F8 C4C6C8C3 C5F3F5F2 *.&1.0.&.to.$$.0.$-...2é8DFHCE352* 099A96D4

*Fig. 9 Example of terminal trace (inbound 3270 terminal)*

::
    
    X001T007 XOT: RECEIVED FROM ROUTER                          13:48:15.26
    00000 00000019 10010B96 00188019 13348330 0A420707 43030302 CC0300C4 80       * ....o .....c........... D.     * 0989117C
    X001T007 XOT: SENT TO ROUTER                                13:48:15.37
    00000 00000003 10010F                                                         * ....                           * 09896178
    X001T007 XOT: RECEIVED FROM ROUTER                          13:48:15.53
    00000 0000001B 100100D7 C5E2C9E3 404040E2 E8E2E7C3 C6E3C1E2 E8E2D7C1 E24040   * ... PESIT SYSXCFTASYSPAS       * 0989117C
    X001T007 XOT: SENT TO ROUTER                                13:48:15.54
    00000 00000003 100121                                                         * ....                           * 0989117C
    X001T007 XOT: SENT TO ROUTER                                13:48:15.55
    00000 00000007 100120C1 C3D2F0                                                * ....ACK0                       * 098A4176
    X001T007 XOT: RECEIVED FROM ROUTER                          13:48:15.57
    00000 00000003 100121                                                         * ....                           * 0989117C
    X001T007 XOT: RECEIVED FROM ROUTER                          13:48:15.72
    00000 00000083 10013200 A0402000 D9030853 59535843 46544104 08535953 58434654 *........to ....SYSXCFTA..SYSXCFT* 0989117C
    00020 42050653 59535041 53060102 07030024 02160102 17010163 6E434654 20593D4D *B..SYSPAS......$.......cnCFT Y=M* 0989119C
    00040 2C443D32 30303530 31303531 33343831 3536302C 563D3233 302C5A3D 702D312D *,D=2005010513481560,V=230,Z=p-1-* 098911BC
    00060 31352D2D 4D565332 3230432D 41323330 3033352D 32303031 2F31302F 32322C4B *15--MVS220C-A230035-2001/10/22,K* 098911DC
    00080 3D514334 443248                                                         *=QC4D2H                         * 098911FC
    X001T007 XOT: SENT TO ROUTER                                13:48:15.72
    00000 00000003 100141                                                         * ....                           * 0989117C
    X001T007 XOT: RECEIVED FROM ROUTER 13:48:15.72
    00000 00000023 1001245A 56444850 37444C4E 39374A49 36513153 49594C2C 433D3830 *...£..$ZVDHP7DLN97JI6Q1SIYL,C=80* 0989117C
    00020 33333430 333832                                                         *3340382                         * 0989119C
    X001T007 XOT: SENT TO ROUTER                                13:48:15.73
    00000 00000003 100161

*Fig. 10 Example of line trace (XOT line)*    

::

    X001T007 005: INBOUND CALL PACKET                           15:10:11.97
    00000 0BF00806 0018800A 42070743 030302CC 0300C018 80105043 4E4531                  *........B..C..........PCNE1     * 09896176
    X001T007 XOT: OUTBOUND X25 COMMAND                          15:10:11.99
    00000 0F                                                                            *.                               * 0989617E
    X001T007 XOT: INBOUND DATA                                  15:10:12.08
    00000 00C3C6E3 D7E2C9E3 E7C3D7C1 E7F14040 40D7D8D9 E2404040 400D25                  * CFTPSITXCPAX1 PQRS ..          * 09891182
    P001I001 AP80LU51 I09: DATA TO CFTBACB1                     15:10:12.21 
    00000 C3C6E3D7 E2C9E3E7 C3D7C1E7 F1404040 D7D8D9E2 40404040 0D25                    *CFTPSITXCPAX1 PQRS ..           * 0989617D
    P001I001 AP80LU51 I09: DATA FROM CFTBACB1                   15:10:12.23
    00000 C1C3D2F0 0D25                                                                 *ACK0..                          * 0989617C
    X001T007 XOT: OUTBOUND DATA                                 15:10:12.23
    00000 00C1C3D2 F00D25                                                               * ACK0..                         * 098A417C
    X001T007 XOT: INBOUND DATA                                  15:10:12.46
    00000 22003240 2000D903 0D4F5020 20202020 20435041 5831040D 4F502020 20202020       *".to ....OP CPAX1..OP           * 09891182
    00020 43504258 31060101 07030024 02160100 170101                                    *CPBX1......$.......             * 098911A2
    P001I001 AP80LU51 I09: DATA TO CFTBACB1                     15:10:12.47
    00000 00324020 00D9030D 4F502020 20202020 43504158 31040D4F 50202020 20202043       *.to ....OP CPAX1..OP C          * 098A417D
    00020 50425831 06010107 03002402 16010017 0101                                      *PBX1......$.......              * 098A419D
    P001I001 AP80LU51 I09: DATA FROM CFTBACB1                   15:10:12.55
    00000 00114021 D9E20601 01070300 24021701 01                                        * . .RS..... .....               * 0989617C
    X001T007 XOT: OUTBOUND DATA                                 15:10:12.55
    00000 00001140 21D9E206 01010703 00240217 0101                                      * . .RS..... .....               * 098A417C
    X001T007 XOT: INBOUND DATA                                  15:10:12.89
    00000 440028C0 1FE20009 0C0B02FF FF0C0650 434E4531 410D0307 DC1D5C0D 414E5449       *D.(............PCNE1A.....ç.ANTI* 09891182
    00020 50434E45 20544553 54                                                          *PCNE TEST * 098911A2
    P001I001 AP80LU51 I09: DATA TO CFTBACB1                     15:10:12.90
    00000 0028C01F E200090C 0B02FFFF 0C065043 4E453141 0D0307DC 1D5C0D41 4E544950       *.(............PCNE1A.....ç.ANTIP* 098A417D
    00020 434E4520 54455354                                                             *CNE TEST                        * 098A419D
    P001I001 AP80LU51 I09: DATA FROM CFTBACB1                   15:10:12.97
    00000 000BC03F D9000203 000000                                                      * .é.R ..                        * 0989617C
    X001T007 XOT: OUTBOUND DATA                                 15:10:12.97
    00000 00000BC0 3FD90002 03000000                                                    * .é.R ..                        * 098A417C
    X001T007 XOT: INBOUND DATA                                  15:10:33.11
    00000 66000B40 23E2D902 03000000                                                    *. . .SR..                       * 09891182
    P001I001 AP80LU51 I09: DATA TO CFTBACB1                     15:10:33.12
    00000 000B4023 E2D90203 000000                                                      * . .SR..                        * 098A417D
    P001I001 AP80LU51 I09: DATA FROM CFTBACB1                   15:10:33.14
    00000 00064024 D9E2                                                                 * . .RS                          * 0989617C
    X001T007 XOT: OUTBOUND DATA                                 15:10:33.14
    00000 00000640 24D9E2                                                               * . .RS                          * 098A417C
    X001T007 XOT: INBOUND X25 COMMAND                           15:10:33.27
    00000 130000                                                                        *.                               * 09891182
    X001T007 XOT: OUTBOUND X25 COMMAND                          15:10:33.27
    00000 17                                                                            *.                               * 09891182

*Fig. 11 Example of "trace by rule" (XOT terminal to application on /PCNE line)*

3.3 VIRTEL SNAP
===============

VIRTEL maintains an internal trace table in which it records  significant events which occur during VIRTEL processing. The SNAP command allows the administrator to obtain a snapshot listing of the contents of the trace table at a given point in time.

The SNAP listing is primarily intended for use by VIRTEL development personnel and will normally need to be forwarded to Syspertec for analysis. For customer diagnostics, the TRACE command (described     above) may often be more useful.

.. note::

    The format, the contents, and the size of the SNAP depend on the SNAPW, TRACBIG, TRACEB, TRACEON parameters in the VIRTCT.

The internal trace table is recorded in a circular fashion, so that each new event added to the table overlays and replaces the oldest event in the table. The table contains a fixed number of event slots (determined by the TRACBIG parameter in the VIRTCT), and additionally certain events may have a variable amount (up to 256 bytes) of data recorded. The variable data is stored in a separate area whose size is determined by the TRACEB parameter in the VIRTCT, and this area is also filled in a circular manner, with the oldest information being dropped from the table when new information is added. Thus, depending on the values of the TRACBIG and TRACB parameters, older entries in the trace table may no longer have data associated with them.

Clearly, the greater the level of activity in the VIRTEL system, the quicker the trace table will wrap and information will be pushed out to make way for new entries. Thus, in order for the SNAP listing to     provide useful information, the size of the trace table and its associated buffer area must be adequate for the level of system activity, and the SNAP command must be issued as quickly as possible after the event under investigation occurs. In some cases it may be necessary to use an automation tool to issue the SNAP command immediately following the appearance of a certain console message.

As well as dumping the contents of the internal trace table, the SNAP command also dumps certain VIRTEL internal control blocks. A dump of the control blocks associated with a particular terminal may    optionally be requested.

The SNAP command is described under the heading “VIRTEL commands”. VIRTEL may also produce a SNAP listing automatically if a program check or other abend occurs during VIRTEL processing.

In **z/OS environment**, the SNAP output is written to the SYSPRINT file in the VIRTEL started task. 
In **z/VSE environment**, the SNAP output is written to the POWER LST file of the VIRTEL partition.

.. note::
    
    Several SNAP commands may be issued during a single run of VIRTEL. The output file may thus contain successive SNAP listings concatenated one after the other.

|image_05|

*Fig. 12 Example of SNAP listing*

3.3.1 Message-triggered SNAPMSG

The SNAPMSG command requests VIRTEL to generate an automatic SNAP after certain messages (VIRI902W, VIR0026W, VIR0052I, VIR1552I, VIR0526W or VIR1952I).

Only one SNAP can also be obtained with user specific code provided by SYSPERTEC for messages VIRHT31E and VIRHT63E. See “VIRTEL commands”.

4. Audit and Statistics
=======================

4.1 The VIRSTAT file
====================

The VIRSTAT file is a sequential file into which VIRTEL writes connection statistics.

.. note::

    When the STATS=YES parameter is coded in the VIRTCT, the VIRSTAT file is reinitialised at each VIRTEL startup. With STATS=YES, VIRTEL must be stopped periodically in order to avoid filling the VIRSTAT
    file, and the file should be defined as a GDG in order not to lose the information from a previous run. The STATS=MULTI parameter may be coded in the z/OS environment to permit continuous operation.

    Trying to browse the contents of the file from ISPF while it is in use by VIRTEL, can result to the obtain a system message indicating that the file is empty. In reality this is not true, because in fact
    the records are buffered in memory before being written in block.

The format of the statistics records depends on the value specified in the “Write Stats to” field of the VIRTEL terminal definition (refer to the VIRTEL Connectivity Reference manual for details of terminal definitions). Each terminal may request statistics in one or more of the possible formats:

Classic
    VIRSTAT classic format recording is intended for use with Minitel calls on terminals associated with NPSI lines (Gate or Fast Connect).

Alternate X25
    VIRSTAT alternate format recording may be requested for terminals associated with any X25 line (GATE, FASTC, XOT).

Web
    VIRSTAT format suitable for terminals associated with an HTTP line.

For terminals associated with all other line types (including /GATE, /PCNE, and /FASTC) the statistics record may not contain meaningful information and the statistics field in the terminal definition     should be left blank.

The statistics file may contain a mixture of classic, alternate X25, and web format records. The record type indicator at position 61 of each record identifies the format of the particular record.

4.1.1 VIRSTAT classsic format 
-----------------------------
For terminals which specify classic format recording (STATS=1), the  VIRSTAT record format is shown in the following table:

::

    **Position    Format          Type of information**
    -----------------------------------------------
    1 to 8      Alphanumeric    Terminal name
    9 to 12     Packed Decimal  Date (CCYYDDDF)
    13 to 16    Packed Decimal  Time (HHMMSSTF)
    17 to 28    Alphanumeric    User id
    29 to 36    Alphanumeric    Originating terminal name (outbound calls)
    37 to 40    Hexadecimal     No of bytes inbound (uncompressed)
    41 to 44    Hexadecimal     No of bytes inbound (compressed)
    45 to 48    Hexadecimal     No of bytes outbound (uncompressed)
    49 to 52    Hexadecimal     No of bytes outbound (compressed)
    53 to 56    Hexadecimal     No of sends
    57 to 60    Hexadecimal     No of receives
    61 to 61    Alphanumeric    Record type (C=cumulative,P=partial,E=end) [1]
    62 to 62    Alphanumeric    Compression level (0,1,2)
    63 to 70    Alphanumeric    Minitel: Server access node
    71 to 74    Alphanumeric    Minitel: Call duration in minutes (ZZZ9)
    75 to 82    Alphanumeric    Session start date (MM/DD/YY)
    83 to 86    Alphanumeric    Session start date (.DDD)
    87 to 94    Alphanumeric    Session start time (HH.MM.SS)
    95 to 102   Alphanumeric    Session end date (MM/DD/YY)
    103 to 106  Alphanumeric    Session end date (.DDD)
    107 to 114  Alphanumeric    Session end time (HH.MM.SS)
    115 to 115  Alphanumeric    Tarification level (External Servers)
    116 to 116  Alphanumeric    Disconnection Type (T=by TIME-OUT)
    117 to 120  Hexadecimal     X25 units received (Fast-Connect)
    121 to 124  Hexadecimal     X25 units sent (Fast-Connect)

*Fig. 13 Format of VIRSTAT record (classic format)*

For NPSI Fast Connect lines, the X25 accounting statistics are recorded in billing units provided by NPSI at virtual circuit disconnection time. Their interpretation depends on the TAXUNIT parameter in the NPSI X25.MCH macro. Similarly, the session start and end times (Fast Connect only) are provided by NPSI and depend on the clock settings in the NCP. For other types of lines, accounting statistics and times are generated by VIRTEL.

Type C (cumulative) 
    Records are implemented at terminal disconnection. 
Type P (partial) 
    Records are implemented at regular intervals.
Type E (end of job) 
    Records are implemented at VIRTEL shutdown.

4.1.2 VIRSTAT alternative X25 format
------------------------------------
For terminals which specify alternate X25 format recording (STATS=4), the VIRSTAT record format is shown in the following  table:

::

    Position        Format          Type of information
    1 to 8          Alphanumeric    Terminal name
    9 to 12         Packed Decimal  Date (CCYYDDDF)
    13 to 16        Packed Decimal  Time (HHMMSSTF)
    17 to 36        Alphanumeric    Remote X25 number
    37 to 40        Hexadecimal     Unused
    41 to 44        Hexadecimal     Unused
    45 to 48        Hexadecimal     Unused
    49 to 52        Hexadecimal     Unused
    53 to 56        Hexadecimal     Unused
    57 to 60        Hexadecimal     Unused
    61 to 61        Alphanumeric    Record type (I=inbound,O=outbound) [1]
    62 to 62        Alphanumeric    Unused
    63 to 70        Alphanumeric    Originating GATE/PCNE terminal name (outbound)
                                    Entry point name (inbound)
    71 to 74        Alphanumeric    Unused
    75 to 82        Alphanumeric    Session start date (MM/DD/YY)
    83 to 86        Alphanumeric    Session start date (.DDD)
    87 to 94        Alphanumeric    Session start time (HH.MM.SS)
    95 to 102       Alphanumeric    Session end date (MM/DD/YY)
    103 to 106      Alphanumeric    Session end date (.DDD)
    107 to 114      Alphanumeric    Session end time (HH.MM.SS)
    115 to 115      Alphanumeric    Unused
    116 to 116      Alphanumeric    Disconnection Type (T=by TIME-OUT)
    117 to 120      Hexadecimal     Unused
    121 to 124      Hexadecimal     Call duration in 1/100 second

*Fig. 14 Format of VIRSTAT record (alternate X25 format)*

For NPSI Fast Connect lines, the X25 session start and end times are provided by NPSI at virtual circuit disconnection time and depend on the clock settings in the NCP. For other types of lines, times are     generated by VIRTEL.

Type I (inbound)
    Records relate to X25 incoming calls.
Type O (outbound) 
    Records relate to X25 outgoing calls.

For terminals which specify web format recording (STATS=5 or STATS=6), the VIRSTAT record format is shown in the following  tables:

::
    
    Position        Format          Type of information
    1 to 8          Alphanumeric    Terminal name
    9 to 12         Packed Decimal  Date (CCYYDDDF)
    13 to 16        Packed Decimal  Time (HHMMSSTF)
    17 to 31        Alphanumeric    Caller’s IP address
    32 to 36        Alphanumeric    Alphanumeric
    37 to 44        Alphanumeric    Entry point name
    45 to 52        Alphanumeric    Transaction external name
    53 to 60        Alphanumeric    Rule name
    61 to 61        Alphanumeric    Record type (H=HTTP inbound)
    62 to 64        Alphanumeric    Unused
    65 to 68        Alphanumeric    Error code
    69 to 76        Alphanumeric    Relay LU name
    77 to 84        Alphanumeric    Call duration in 1/100 second
    85 to 92        Alphanumeric    No of bytes received
    93 to 100       Alphanumeric    No of bytes sent
    101 to 108      Alphanumeric    Session start date (MM/DD/YY)
    109 to 116      Alphanumeric    Session start time (HH.MM.SS)
    117 to 124      Alphanumeric    Session end time (HH.MM.SS)

*Fig. 15 Format of VIRSTAT record (type 5 for Web Access)*

This record type is written when 5 is specified in the STATS field of the terminal definition used for the HTTP line. If the terminal is disconnected by TIMEOUT, the “Error Code” field contains the word     “TIME”.

::

    Position        Format          Type of information
    1 to 8          Alphanumeric    Terminal name
    9 to 12         Packed Decimal  Date (CCYYDDDF)
    13 to 16        Packed Decimal  Time (HHMMSSTF)
    17 to 31        Alphanumeric    Caller’s IP address
    32 to 36        Alphanumeric    Caller’s port number
    37 to 44        Alphanumeric    Entry point name
    45 to 52        Alphanumeric    Transaction external name
    53 to 60        Alphanumeric    Rule name
    61 to 61        Alphanumeric    Record type (B=binary HTTP inbound)
    62 to 64        Alphanumeric    Unused
    65 to 68        Alphanumeric    Error code
    69 to 76        Alphanumeric    Relay LU name
    77 to 80        Hexadecimal     Call duration in 1/100 second
    81 to 84        Hexadecimal     No of bytes received
    85 to 88        Hexadecimal     No of bytes sent
    89 to 108       Alphanumeric    User name
    109 to 124      Alphanumeric    URL parameter

*Fig. 16 Format of VIRSTAT record (type 6 for Web Access)*

For this record type, the counters are in binary, and the Session Date and Time fields are replaced by User name (20 bytes) and URL parameter (first 16 bytes).

This record type is written when 6 is specified in the STATS field of the terminal definition used for the HTTP line.

4.2 Statistics file management
==============================

The STAT command is used to manage the VIRTEL statistics recording files (VIRSTATx). This command can be used only if STATS=MULTI is specified in the VIRTCT.

4.2.1 Display VIRSTAT
---------------------

::
    
    STAT,D

This command displays the status of the VIRSTATx files (message VIR0601I).

4.2.2 Switch VIRSTAT
--------------------
::
    
    STAT,I    

This command forces VIRTEL to free the current VIRSTATx file and to start recording onto the next file.

4.2.3 Printing the contents of the VIRSTAT file (X25)
-----------------------------------------------------

The VIR0070 program allows the contents of the VIRSTAT file to be printed. The source for this program is supplied in the SSL (VSE) or in the SAMPLIB (z/OS) and you can use this as the basis of a     user-written program to print statistics. 

Examples of the JCL required to execute this program are shown below:

::

    * $$ JOB JNM=VIRSTAT,CLASS=0,DISP=D
    * $$ LST DISP=D,CLASS=V,DEST=(,SPTUSER)
    // JOB VIRPRNT
    // LIBDEF *,SEARCH=VIRT442.SUBLIB
    // DLBL STAT,'VIRTEL.VIRSTAT.ESDS',,VSAM,CAT=VSESPUC
    // EXEC VIR0070,SIZE=AUTO
    /*
    /&
    * $$ EOJ

*Fig. 17 VIR0070 JCL to print VIRSTAT file (VSE)*

::
    
    //VIRSTAT JOB 1,USER,CLASS=A,MSGCLASS=X,NOTIFY=&SYSUID
    //TRI EXEC PGM=SORT
    //SYSPRINT DD SYSOUT=*
    //SYSOUT DD SYSOUT=*
    //SORTWK01 DD UNIT=3380,SPACE=(TRK,(100,20),RLSE)
    //SORTWK02 DD UNIT=3380,SPACE=(TRK,(100,20),RLSE)
    //SORTIN DD DISP=SHR,DSN=VIRTEL.STAT
    //SORTOUT DD DSN=&&STAT,UNIT=SYSDA,DISP=(,PASS),
    // DCB=(LRECL=124,BLKSIZE=620,RECFM=FB),
    // SPACE=(TRK,(100,20),RLSE)
    //SYSIN DD *
    SORT FIELDS=(1,16,A),FORMAT=CH
    END
    //STAT EXEC PGM=VIR0070
    //STEPLIB DD DISP=SHR,DSN=VIRT442.LOADLIB
    //SYSUDUMP DD SYSOUT=*
    //SYSPRINT DD SYSOUT=*
    //VIRSTAT DD DISP=(OLD,DELETE),DSN=&&STAT
    //

*Fig. 18 VIR0070 JCL to print VIRSTAT file (z/OS)*

4.2.4 Printing the contents of the VIRSTAT file (HTTP)
------------------------------------------------------
The PRTSTATW program supplied with the system allows printing of type 6 records from the VIRSTAT file. This program is delivered as a load module in the VIRTEL LOADLIB (from version 4.45 onwards) and     the execution JCL is provided as member JCLPRTST in the VIRTEL SAMPLIB. 

Examples of the execution JCL for this program are shown below.

4.2.4.1 z/VSE
^^^^^^^^^^^^^

In the VSE environment the VIRPRTST job, loaded into the POWER reader queue during VIRTEL installation, contains an example of JCL for printing the VIRSTAT file. This job is an example only and must be modified before execution:


::
    
    * $$ JOB JNM=VIRPRTST,CLASS=0,DISP=D
    * $$ LST DA
    // JOB VIRPRTST
    * *****************************************************************
    * * VIRTEL: EXAMPLE JCL TO EXECUTE STAT VIRTEL PRINT *
    * *****************************************************************
    // LIBDEF *,SEARCH=(VIRT452.SUBLIB,PRD2.CONFIG,PRD1.BASE)
    // DLBL SORTIN1,'VIRTEL.STAT',,VSAM,CAT=VSESPUC
    // DLBL SORTOUT,'%VIRTEL.SORTFILE',0,VSAM,CAT=VSESPUC,DISP=(NEW,KEEP), C
    RECORDS=(10,100),RECSIZE=124
    * // DLBL SORTOUT,'VIRTEL.SORTFILE',0,SD
    * // EXTENT SYS001,SYSWK2,1,0,NNNN,15
    * // ASSGN SYS001,DISK,VOL=SYSWK2,SHR
    // EXEC SORT,SIZE=100K
    SORT FIELDS=(01,08,A),FORMAT=CH
    RECORD TYPE=F,LENGTH=124
    END
    /*
    * OPTIONS FOR PRINT OR COUNT
    * // DLBL SYSPRINT DD SYSOUT=*
    * // DLBL SYSABEND DD SYSOUT=*
    * // DLBL IJSYSLS DD SYSOUT=*
    *
    // DLBL VIRSTAT,'%VIRTEL.SORTFILE',0,VSAM,CAT=VSESPUC,DISP=(,DELETE)
    // ASSGN SYS007,SYSLST
    // ASSGN SYS006,SYSRDR
    // EXEC PGM=PRTSTATW,SIZE=AUTO
    PRTSTATW PRINT NNN 0250
    SELDATE 01012011 31122012
    SELTERM DEVTA* CLVTA*
    /*
    * * MAIN CARD (REQUIRED)
    * * ---------
    * * 1 2 3 4 5 6
    * *1...!....0....!....0....!....0....!....0....!....0....!....0...
    * *PRTSTATW PRINT BREAK USER NNN PPPP
    * * SPECIFIC REQUEST TO PRINT THE STATISTICS
    * *PRTSTATW COUNT $ALL$ NNN PPPP
    * * SPECIFIC REQUEST TO COUNT THE NUMBERS OF DIFFERENT
    * * USERS
    * *SELECT CARD (OPTIONAL)
    * * -----------
    * * 1 2 3 4 5 6
    * *1...5....0....5....0....5....0....5....0....5....0....5....0
    * *SELDATE DDMMYYYY DDMMYYYY
    * * DATE SELECTION BEGIN,
    * * END DATE
    * *SELTERM TTTTTTTT XXXXXXXX YYYYYYYY ZZZZZZZZ (UP TO 8 BYTES)
    * *SELUSER USER4561890123456789 (UP TO 20 BYTES)
    * *SELPARM PARM456189012345 (UP TO 16 BYTES)
    * *1...!....0....!....0....!....0....!....0....!....0....!....0...
    * * THE '*' CHARACTER ALLOWS A GENERIC EVALUATION.
    /&
    * $$ EOJ

*Fig. 19 PRTSTATW JCL to print VIRSTAT file in VSE (type=6)*

4.2.4.2 z/OS
^^^^^^^^^^^^

In the z/OS environment the JCL for executing the PRTSTATW program is supplied as member JCLPRTST in the VIRTEL SAMPLIB:

::

    //VIRPRTST JOB 1,USER,CLASS=A,MSGCLASS=X,NOTIFY=&SYSUID
    /*JOBPARM LINES=9999
    //*------------------------------------------------------------*
    //* VIRSTAT FILE PRINTING JOB *
    //* VIRSTAT RECORD TYPE 6 (VSTA-RECORD-TYPE='B') *
    //*------------------------------------------------------------*
    // SET LOAD=yourqual.VIRTnnn.LOADLIB
    // SET STAT=yourqual.VIRTnnn.STAT
    //*------------------------------------------------------------*
    //JOBLIB DD DISP=SHR,DSN=&LOAD
    //*------------------------------------------------------------*
    //*
    //STEP0 EXEC PGM=SORT
    //SYSOUT DD SYSOUT=*
    //SORTIN DD DISP=SHR,DSN=&STAT
    //SORTOUT DD DSN=&&SORTSTAT,DISP=(NEW,PASS),UNIT=SYSDA,
    // DCB=(BLKSIZE=1240,LRECL=124,RECFM=FB),
    // SPACE=(TRK,(1,1))
    //SYSIN DD *
    SORT FIELDS=(1,8,A),FORMAT=CH
    //*
    //STEP1 EXEC PGM=PRTSTATW
    //SYSPRINT DD SYSOUT=*
    //SYSABEND DD SYSOUT=*
    //IJSYSLS DD SYSOUT=*
    //*
    //VIRSTAT DD DSN=&&SORTSTAT,DISP=OLD
    //SYSIN DD *
    PRTSTATW PRINT NNN 0250
    SELDATE 01012011 31122012
    SELTERM DEVTA* CLVTA*
    * ..!....0....!....0....!....0....!....0....!....0....!....0...
    //* MAIN CARD (required)
    //* ---------
    //* 1 2 3 4 5 6
    //* 1...!....0....!....0....!....0....!....0....!....0....!....0...
    //* PRTSTATW PRINT BREAK USER NNN PPPP
    //* specific request to print the statistics
    //* PRTSTATW COUNT $ALL$ NNN PPPP
    //* specific request to count the numbers of different
    //* users
    //* SELECT CARD (optional)
    //* -----------
    //* 1 2 3 4 5 6
    //* 1...5....0....5....0....5....0....5....0....5....0....5....0
    //* SELDATE DDMMYYYY DDMMYYYY
    //* DATE selection begin,
    //* end date
    //* SELTERM TTTTTTTT XXXXXXXX YYYYYYYY ZZZZZZZZ (up to 8 bytes)
    //* SELUSER USER4561890123456789 (up to 20 bytes)
    //* SELPARM PARM456189012345 (up to 16 bytes)
    //* 1...!....0....!....0....!....0....!....0....!....0....!....0...
    //* The '*' character allows a generic evaluation.
    // 

*Fig. 20 PRTSTATW JCL to print VIRSTAT file in z/OS (type=6)*

This JCL consists of two main steps:
    -  a first step to sort the file
    -  a second step to PRINT or COUNT the records

4.2.4.3 Sorting the File 
^^^^^^^^^^^^^^^^^^^^^^^^

The sort requirements are determined by the type of report desired. Since the PRTSTATW program offers the option of selecting records and also offers up to two levels of report break to allow printing of subtotals, it is important to specify the appropriate sort criteria to obtain the correct result.

The sort operates on one or more criteria, in ascending (A) or descending (D) mode. You should adapt the SORT SYSIN according to the syntax of the specific SORT program being used.

Several examples of sort criteria are shown below for various fields: terminal (TERM), date (DATE), user name (USER), URL parameter (PARM)

::

    SORT FIELDS=(1,8,A) --> TERM A: ascending D: descending
    SORT FIELDS=(9,4,A) --> DATE
    SORT FIELDS=(89,20,A) --> USER
    SORT FIELDS=(109,16,A) --> PARM
    SORT FIELDS=(1,8,A,),FORMAT=CH sort by TERM
    SORT FIELDS=(1,8,A,89,20,A),FORMAT=CH sort by TERM first then USER
    SORT FIELDS=(17,15,A) --> IP Adress (for $ALL$ request)
    SORT FIELDS=(89,20,A,17,15,A),FORMAT=CH sort for $ALL$ request

*Fig. 21 PRTSTATW JCL sort criteria*

For example, to obtain a report in ascending order of session start date, specify the following statements in the SORT SYSIN:

::
    
    //SYSIN DD *
    SORT FIELDS=(9,4,A),FORMAT=CH
    //*

4.2.4.4 The PRTSTATW program
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
The PRTSTATW program executed in the second step reads the sorted output file from the first step. It contains required and optional SYSIN cards.

::

    First card (Required)
             1         2         3         4         5         6
    1...!....0....!....0....!....0....!....0....!....0....!....0...
    PRTSTATW PRINT                BREAK USER          NNN  PPPP

*Fig.22 PRTSTATW first SYSIN card*

Columns 1 to 8
    Program name: must be PRTSTATW

Columns 11 to 16
    Report type: specify PRINT (print report) or COUNT (calculate number of distinct users)

Columns 31 to 35
    Optionally specify BREAK if report break is desired (up to 2 levels) for printing (PRINT) or $ALL$ if counting (COUNT)

Columns 37 to 40
    Optionally indicates the type of report break: TERM (break on change of terminal name), USER (break on change of user name), DATE (break on change of date) or PARM (break on change of URL parameter)

Columns 43 to 46
    Optionally indicates the second level report break (TERM, USER, DATE, or PARM)

Columns 51 to 53
    Optionally specify N (no) or O (yes) to print additional trace information (program trace, input/output trace, and miscellaneous trace respectively). The default is N for each trace.

Columns 56 to 59
    Maximum number of pages to be printed (default 50 pages)

::
    
    Second card (Optional)    
             1         2         3         4         5         6
    1...5....0....5....0....5....0....5....0....5....0....5....0
    SELDATE   DDMMYYYY  DDMMYYYY
              DATE selection begin,
                        end date
    SELTERM   TTTTTTTT  XXXXXXXX  YYYYYYYY  ZZZZZZZZ (up to 8 bytes)
    SELUSER   USER4561890123456789     (up to 20 bytes)
    SELPARM   PARM456189012345         (up to 16 bytes)

*Fig.23 PRTSTATW second SYSIN card*

This card allows records to be selected according to 4 fields: DATE (selection by date range), TERM (selection of up to 4 different terminal names, otherwise 4 different HTTP lines), USER (selection by user name), PARM (selection by URL parameter).

It is possible to make a **generic** selection by coding a ‘\*’ character at the end of a field. For example, specifying a terminal selection value of DEVT\* allows the program to select all records whose terminal name begins with DEVT.

Columns 1 to 7
    Optional, indicates the selection type: SELDATE (for DATE), SELTERM (for terminal), SELUSER (for user), or SELPARM (for URL parameter).

Columns 11 to 19
    Indicates up to 8 characters for the chosen value (SELDATE and SELTERM). The value may end in ‘\*’ for a generic search.

Columns 21 to 29
    For SELDATE: second date in the range, for SELTERM: second terminal name (optional)

Columns 31 to 39
    For SELTERM: third terminal name (optional)

Columns 41 to 49
    For SELTERM: fourth terminal name (optional)

Columns 21 to 40
    For SELUSER:up to 20 characters for the user name. The value may end in ‘\*’ for a generic search.

Columns 21 to 36
    For SELPARM: up to 16 characters for the URL parameter. The value  may end in ‘\*’ for a generic search.

4.2.4.5 Counter Report
^^^^^^^^^^^^^^^^^^^^^^
Clients who wish to obtain the total number of unique users can execute the PRTSTATW program with the SYSIN shown below.

For the SORT: the first sort field is the user name, and the second sort field is the IP address:

::
    
    //SYSIN DD *
    SORT FIELDS=(89,20,A,17,15,A),FORMAT=CH
    //

For the PRTSTATW program:

::
    
    //SYSIN DD *
    PRTSTATW COUNT $ALL$ NNN 0465
    SELDATE 01012011 30122011
    SELTERM DEVTA* CLVTA*

COUNT and $ALL$ are required. The selection cards are optional. They allow for example to report for a given period the number of different users connected to the system in HTTP mode and/or to filter on an HTTP line defined with transaction security active, which requires the user to sign on.

For z/OS, sample JCL for the user counter report is supplied in the JCLCOUST member of the VIRTEL SAMPLIB. For VSE, a sample job named VIRCOUST is loaded into the POWER Reader Queue at installation time.

::
    
    1== VIRTEL == Statistics file COUNT job ==
    Submit on: 18-01-2011 at: 14:23:12              PAGE : 000
    Parameters CARDS list read by PRTSTATW

    PRTSTATW COUNT                  $ALL$   PARM        NNN 0469
    SELDATE 01012010 30122011
    * ..!....0....!....0....!....0....!....0....!....0....!....0...

    18-01-2011      14:23:12                * S U M M A R Y *
    18-01-2011      14:23:12                With criterias put for selection at top of listing:
    18-01-2011      14:23:12                Total Records read              : 00207
    18-01-2011      14:23:12                Total Calls selected            : 00017
    18-01-2011      14:23:12                Total Calls duration            : 001hr04mn35s
    18-01-2011      14:23:12                Total Calls ended by "Timeout"  : 00007
    18-01-2011      14:23:12                Total Defined different Users   : 00004
    18-01-2011      14:23:12                Total Calls without signature   : 00001
    18-01-2011      14:23:12                End of execution  

*Fig 24. PRTSTATW user counter report*

4.3 SMF Support
===============

Using VIRTEL 4.53+ and onwards allows VIRTEL SMF support writing VIRSTATS records into SMF. The VIRTCT must be reassembled and link-edited with a new value SMF or (SMF,nnn) for the STATS parameter to have this feature active. The SMF record format is the same as the current STATS record but prefixed by the standard SMF header. The default SMF record number is 223, but it can be modified using the (SMF,nnn) syntax.

4.3.1 Printing the VIRSTAT SMF record

The SMFPRINT job in VIRTEL.SAMPLIB can be used to print the SMF records from the SYS1.MANx dataset using SMFREXXP REXX procedure.

Messages "VIR0612E VIRSTAT SMFWTM FAILED. RC=rc" and "VIR0611I VIRSTAT NOW RECORDING TO SMF" are in relation with SMF support. See "Virtel Messages and Operations" manual for more details.

4.4 Memory management
=====================

4.4.1 Memory display Sub-Application
====================================

The VIRTEL memory management sub-application allows the system  administrator to display VIRTEL memory utilisation in real time. The memory management sub-application is a pseudo-graphical display
which shows the allocation of VIRTEL memory by function. VIRTEL manages its own memory, in order to avoid memory shortages as a result of fragmentation. The memory management display can be used
by the administrator to help understand VIRTEL’s memory requirements during normal operation.

To invoke the memory management sub-application, press [PA2] in the Configuration Menu to display the Sub- Application Menu, then press [PF4] in the Sub-Application Menu. The sub-application displays a
screen similar to the example shown below. This screen represents the contents of the VIRTEL address space after deducting the space  occupied by the VIRTEL kernel modules.

|image_06|

*Fig 25. Memory display of VIRTEL address space*

Each screen position represents a 2K memory block (if MEMORY=BELOW is specified in the VIRTCT), or a 64K memory block (if MEMORY=ABOVE). The address displayed at the start of each line is the virtual address represented by the first position in the line. Each free memory block is represented by a dot. Lines which consist entirely of dots are not displayed.

Permanently allocated memory blocks are represented by the following character types: 
 
    1. To avoid memory shortages as a result of fragmentation, these blocks are always allocated at the end of the VIRTEL address space. 
    2. Temporarily allocated memory blocks. Blocks of this type are allocated and freed by VIRTEL as required.  
    3. Memory blocks used by the VIRTEL Multi-Session feature to save screen images. Blocks of this type are allocated and freed by VIRTEL as required.
    4. Memory blocks used for saving EIB and other session-related information. Blocks of this type are allocated and freed by VIRTEL as required.
    5. Communication areas by VIRTEL sub-applications. Blocks of this type are allocated and freed by VIRTEL as required.
    6. Sub-application modules loaded in the z/VSE SUBPOOL. Blocks of this type are allocated and freed by VIRTELas required.

4.4.2 Memory display in Memory=Test mode.
-----------------------------------------

If MEMORY=TEST is specified in the VIRTCT, the memory management sub-application displays its results in a different format. MEMORY=TEST mode allows support technicians to analyse memory occupation by module, as a debugging aid for possible memory shortage problems.

|image_08|

*Fig. 26 - Memory display in MEMORY=TEST mode*

Each line of the screen represents one VIRTEL module which has obtained one or more memory blocks. The first column represents the number of bytes of memory (en hexadecimal) currently allocated by the module. The first 16 modules are displayed, in descending order of memory utilisation.

Where the memory display occupies more than one screen, you can press [PF8] to view the following page, [PF7] to view the previous page, and [PF6] to go back to the first page.

To refresh the display with up-to-date information, press [Enter].

To return to the sub-application menu, press [PF3] or [Clear]

5.2 Virtual Memory Display

The Memory display feature is a memory diagnostic tool created to trap possible invalid Virtel memory free requests. Such request can lead to ABEND0C4s and other unwanted behaviour. Virtel memory requests (PRENDRE and RENDRE) are tracked in a diagnostic storage area located above the bar. The area is 1MB in size and can contain 65536 active storage requests. An active storage request is a storage area that has been gotten (PRENDRE) and is pending a Virtel storage release (RENDRE).

.. note::
    
    This diagnostic tool should only be used when recommended by Technical Support.

4.5 Memory trace management
===========================

4.5.1 Activating the memory trace
---------------------------------
A memory trace can be activated using a command or from the VIRTCT. In both case, VIRTEL records an history of memory allocations that appears in a SNAP listing. A memory trace can be activated by using the following command

::
    
    MEMTRACE

The will produce the following response:

::

    VIR0200I MEMTRACE
    VIR0214I MEMORY TRACE STARTED
    VIR0218I MEMORY TRACE FOUND 00000000 BLOCKS USING 0000000000000000 BYTES (00000000 MEGS)

4.5.2 Resetting the memory trace
--------------------------------
A memory trace can be reseted by using the following command:-

::

    MEMTRACE,Clear     

The trace is stopped, memory blocks used by the memory trace are released, the trace is restarted.

::

    VIR0200I MEMTRACE,CLEAR
    VIR0218I MEMORY TRACE FOUND 00000011 BLOCKS USING 0000000000053344 BYTES (00000000 MEGS)
    VIR0216I CLEARING MEMORY TRACE
    VIR0217I MEMORY TRACE CLEARED
    VIR0214I MEMORY TRACE STARTED
    VIR0218I MEMORY TRACE FOUND 00000000 BLOCKS USING 0000000000000000 BYTES (00000000 MEGS)

4.5.3 Stopping the memory trace
-------------------------------
A memory trace can be stopped by using the following command:-

::

    NOMEMTRACE

The trace is stopped, memory blocks used by the memory trace are released.

4.6 Setting Memory Trace in the VIRTCT 
======================================
A memory trace can be activated from the VIRTCT by using MEMORY=TEST or MEMORY=(ABOVE,TRACE) parameter. In such case, the is no message VIR0218I display in the log, but only the benefit of recording the history of memory allocations is kept in the SNAP.

Since it is not possible to stop a trace initialized in this way, it is best to only use this method to perform an analysis of the memory allocation during the startup phase.
Once a memory trace activated, issuing a SNAP command produce a report of the memory allocations history in the SNAP listing.

|image_07|

*Fig. 27 Example of a memory allocataion history*

Column Explanations
    1. Line or terminal name for which memory allocation is performed. This information is omitted when the allocation relates VIRTEL itself.
    2. Task number behind the allocation request.
    3. Register 14 value.
    4. Register 15 value.
    5. Program name + offset of the origin request.
    6. Memory allocation type. (8040 = GETMAIN).
    7. Memory block state.
    8.  Time of the allocation.
    9.  Type and size of the allocation. The two first bytes represents the type of memory allocated (See “Memory display of VIRTEL address space” for a complete description of the memory block type.). The six last bytes represents the size of the memory block allocated.
    10. Reserved for internal use.

Tracing memory activity can produce an important overhead estimated to 20-30% of the activity. When using MEMTRACE command, the memory previously allocated to records history is released.

5.0 Messages
============

5.1 Virtel user messages
========================


5.1.1 ERRM121 - ERRM127
^^^^^^^^^^^^^^^^^^^^^^^

.. note::

    These messages may be displayed in the user’s browser window following an unsuccessful upload of an HTML page, script, or other element to VIRTEL.

ERRM121 -UPLOAD NOT AUTHORIZED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0U12
Meaning
    The user is not authorized to upload a page to the specified directory.
Action
    Ensure that the directory is defined to VIRTEL (see :ref:`“Directory Management” <#_V456UG_directory_management>` in the VIRTEL Web Access Guide). Ensure that the “Copy Up”, “Copy Down”, and “Delete” flags are all set in the directory definition. If using VIRTEL internal security or an external security product, ensure that you have authorization to the resource name which is the same as the VIRTEL directory name.


ERRM122 - ERROR IN VIRTEL HEADER COMMENT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0U12
Meaning
    There is a syntax error in the definition of the VIRTEL tag delimiters in the page being uploaded. The format of the definition should be

::

    <!--VIRTEL start="{{{" end="}}}" -->

Action
    Refer to the section “Defining the Tag Delimiters” in the VIRTEL Web Access Guide. Correct the definition and upload the page again.


ERRM124 - INVALID FIELD
^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0U12
Meaning
    There is a syntax error in a VIRTEL tag in the page being uploaded.
Action
    Refer to the section “Creating HTML and XML template pages” in the VIRTEL Web Access Guide. Correct the definition and upload the page again.

ERRM125 - INTERNAL ERROR
^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0U12
Meaning
    An unexpected error occurred while uploading a page.
Action
    Use the VIRTEL SNAP command to take a snapshot of the internal trace table. Contact technical support.

ERRM126 - OPEN ERROR
^^^^^^^^^^^^^^^^^^^^
Module
    VIR0U12
Meaning
    An error occurred while attempting to open the directory for a page upload.
Action
    Check the directory definition in VIRTEL (see “Directory Management” in the VIRTEL Web Access Guide). Ensure that the DDNAME it refers to is defined in the UFILEn parameter of the VIRTCT and in the VIRTEL started task JCL, and that the file exists and can be opened. Check the console log for any VSAM error messages. Ensure that the “Copy Up”, “Copy Down”, and “Delete” flags are all set in the VIRTEL directory definition. For a newly-defined VSAM cluster, ensure that the file has been loaded with an $$$$IWS.WORKREC record using the installation job VIR4INST.

ERRM127 - WRITE ERROR
^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0U12
Meaning
    An error occurred while writing into the directory during a page upload.
Action
    Check the console log for any VSAM error messages. Use the VIRTEL SNAP command to take a snapshot of the internal trace table. Contact technical support.

5.1.2 User Interface Messages
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

.. note:: 

    These messages may be displayed in the message area of the user’s terminal when logged on to VIRTEL. 

0 CONNECTION IN PROGRESS...
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0015, VIR0021A, VIR0021R, VIR0025, VIR0025T
Meaning
    VIRTEL is attempting to connect your terminal to the requested host application.
Action
    Wait for the response from the host application.

1 DATA ENTERED IS INVALID FOR THIS SCREEN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
VIR0021, VIR0021A, VIR0021R
Meaning
The option selected is invalid for this screen.
Action
Choose one of the options displayed on the screen.

2 ERROR CONNECTING TO APPLICATION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0015, VIR0021H
Meaning
    VIRTEL was unable to connect your terminal to the requested host application.
Action
    Look for messages on the system console to find the reason for the error.

3 APPLICATION HAS DISABLED THE SESSION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0015
Meaning
    The host application cannot accept the connection from your terminal.
Action
    Look for messages on the system console to find the reason for the error.

4 UNKNOWN TERMINAL

This message is no longer issued.


5 NO SAVED SCREEN FOR THIS SESSION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0022, VIR0022O
Meaning
    The user requested VIRTEL to redisplay a previously saved screen image, but no screen image has yet been saved for this terminal session.
Action
    None.

8 INSUFFICIENT MEMORY
^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0043, VIR0043H
Meaning
    There is insufficient storage to process the application.
Action
    Increase VIRTEL region size.

9 USER NAME UNKNOWN
^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    Signon was rejected because the security subsystem does not recognize the userid you entered.
Action
    Sign on again with a valid userid.

10 INCORRECT PASSWORD
^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010, VIR0021H
Meaning
    Signon was rejected because you did not supply a password, or the password is incorrect.
Action
    Sign on again with the correct password.

11 PASSWORD HAS EXPIRED
^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0010
Meaning
    Signon was rejected by the security subsystem because your password has expired.
Action
    Sign on again specifying your expired password in the “your Password” field, and a password of your choice in the “NEW PASSWORD” field.

12 NEW PASSWORD IS INVALID
^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    Signon was unsuccessful because the security subsystem rejected your new password.
Action
    Contact your security administrator to discover the rules for new passwords. Sign on again specifying a valid password in the “NEW PASSWORD” field.

13 SIGNON IS SUSPENDED
^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    Signon was unsuccessful because your userid has been suspended or revoked by the security subsystem.
Action
    Contact your security administrator to reinstate your userid.

14 USER NOT AUTHORISED TO USE TERMINAL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    Signon was unsuccessful because the security subsystem does not allow your userid to log on to this terminal.
Action
    Choose a terminal which you are authorized to use.

15 USER NOT AUTHORISED TO USE APPLICATION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    Signon was unsuccessful because the security subsystem does not allow your userid to log on to this application.
Action
    Ask your security administrator to authorize you to log on to the VIRTEL application.

16 ERROR DURING SIGN-ON PROCESSING
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    The security subsystem rejected the signon for an unknown reason.
Action
    Contact technical support. Look for messages in the system log which might indicate the reason for the failure.

17 TRANSACTION ABEND
^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    A VIRTEL subapplication program has abended.
Action
    Look at the VIRTEL system log to detemine the cause of the error.

18 ENTER YOUR USERID AND PASSWORD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    The signon module is requesting your userid and password.
Action
    Enter your userid and password at the signon screen.

19 SIGN ON CANCELED AND SESSION ENDED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010, VIR0020, VIR0020A, VIR0020L, VIR0020M, VIR0020P
Meaning
    You pressed PA2 at the signon screen to cancel signon.
Action
    VIRTEL signs off and ends the session.

20 UNEXPECTED CHOICE
^^^^^^^^^^^^^^^^^^^^
Module
    VIR0014, VIR0034
Meaning
    The service requested is not available from this screen.
Action
    Choose one of the services displayed on the screen.

21 NO MORE PAGES AT THIS LEVEL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0014, VIR0034
Meaning
    There are no more pages at this level of the videotex page hierarchy.
Action
    None.

22 THIS SERVICE IS ACCESS RESTRICTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0014, VIR0034
Meaning
    You must be signed on to access this service.
Action
    Sign on with a userid authorized to access the requested service.

23 YOU ARE NOT AUTHORISED TO ACCESS THIS SERVICE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0014, VIR0034
Meaning
    Your userid is not authorized to access the requested service.
Action
    Request the security administrator to authorize your userid to access the requested service.

24 SERVICE BRIEFLY INTERRUPTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0014, VIR0034
Meaning
    The service is temporarily unavailable.
Action
    Wait for the service to become available.

25 NO PAGES / GUIDE AVAILABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0014, VIR0034
Meaning
    You pressed the GUIDE key but there is no guide page associated with this screen.
Action
    None.

26 THE REQUESTED SERVICE IS UNKNOWN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0014, VIR0034
Meaning
    The service requested is not in the index.
Action
    None.

27 PF KEY SELECTED IS INVALID FOR THIS SCREEN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0014, VIR0034, VIR0020, VIR0020A, VIR0020L, VIR0020M, VIR0020P, VIR0022A, VIR0025
Meaning
    The PF key selected is invalid for this screen.
Action
    Press one of the PF keys displayed on the screen.

28 USER ID IS SUSPENDED
^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0020, VIR0020A, VIR0020L, VIR0020M, VIR0020P
Meaning
    Your userid has been suspended.
Action
    Ask your security administrator to reinstate your access.

30 TERMINAL NAME UNKNOWN
^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0022, VIR0022O
Meaning
    You have requested the display of a terminal which does not exist.
Action
    None.

31 YOU ARE ON THE FIRST PAGE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    Various
Meaning
    You tried to scroll back to the previous page of data but you are already on the first page.
Action
    None.

32 YOU ARE ON THE LAST PAGE
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    Various
Meaning
    You tried to scroll forward to the next page of data but you are already on the last page.
Action
    None.

33 YOU ARE NOT AUTHORISED TO USE THIS APPLICATION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0021, VIR0021A, VIR0022, VIR0022O, VIR0041A, VIR0043, VIR0043H
Meaning
    You requested a VIRTEL subapplication but either you do not have the necessary authorization, or the subapplication has not been enabled in the VIRTCT. When this message is issued by VIR0043 or VIR0043H, it indicates that the VIRTEL directory does not permit the requested operation (upload, download, or delete).
Action
    Ask your security administrator to grant you authorization to the requested subapplication. Refer to the VIRTEL Connectivity Guide for details of the authorization mechanism for subapplications. The availability of certain subapplications is governed by the ARBO, RESO, HTVSAM, VIRSECU parameters of the VIRTCT, documented in the VIRTEL Installation Guide. Refer to :ref:`“Directory Management” <#_V456UG_directory_management>` in the VIRTEL Web Access Guide for details of VIRTEL directory permissions.

34 UPDATE OK
^^^^^^^^^^^^
Module
    VIR0023, VIR0026, VIR0031, VIR0041, VIR0041A, VIR0042, VIR0044, VIR0045, VIR0046, VIR0047, VIR1001, VIR1002
Meaning
    The updated definition has been successfully stored in the VIRARBO file.
Action
    None.

35 CREATION OK
^^^^^^^^^^^^^^
Module
    VIR0023, VIR0026, VIR0031, VIR0041, VIR0041A, VIR0042, VIR0044, VIR0045, VIR0046, VIR0047, VIR1001, VIR1002
Meaning
    The new definition has been successfully added to the VIRARBO file.
Action
    None.

36 DELETE OK
^^^^^^^^^^^^
Module
    VIR0023, VIR0026, VIR0031, VIR0033, VIR0041, VIR0041A, VIR0042, VIR0043, VIR0043H, VIR0044, VIR0045, VIR0046, VIR0047, VIR0052, VIR1001, VIR1002
Meaning
    The selected definition has been successfully deleted from the VIRARBO file.
Action
    None.

37 RECORD ALREADY EXISTS
^^^^^^^^^^^^^^^^^^^^^^^^    
Module
    VIR0023, VIR0026, VIR0031, VIR0041, VIR0041A, VIR0042, VIR0044, VIR0045, VIR0046, VIR0047, VIR1001, VIR1002, VIR1005
Meaning
    The new definition cannot be added because a record with the same identifier already exists in the VIRARBO file.
Action
    Either choose a new identifier, or select the existing record and update it.

38 RECORD DOES NOT EXIST
^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0023, VIR0026, VIR0031, VIR0041, VIR0041A, VIR0042, VIR0043, VIR0044, VIR0045, VIR0046, VIR0047, VIR0052, VIR1001, VIR1002, VIR1003, VIR1004, VIR1005, VIR1006
Meaning
    The selected definition cannot be deleted from the VIRARBO file because it no longer exists.
Action
    None.

39 INVALID CURSOR POSITION
^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0023, VIR0026, VIR0031, VIR0041, VIR0041A, VIR0042, VIR0043, VIR0043H, VIR0044, VIR0045, VIR0046, VIR0047, VIR1003, VIR1004, VIR1006
Meaning
    You pressed the “delete” function key (F2) but the cursor was not pointing to a configuration record.
Action
    Move the cursor to the record to be deleted.


40 CONFIRM DELETE
^^^^^^^^^^^^^^^^^ 
Module
    VIR0023, VIR0026, VIR0031, VIR0033, VIR0041, VIR0041A, VIR0042, VIR0043, VIR0043H, VIR0044, VIR0045, VIR0046, VIR0047, VIR0052, VIR1001, VIR1002
Meaning
    You pressed the “delete” function key (F2) to request the deletion of a configuration record.
Action
    Press F2 again if you wish to delete the highlighted record. Press any other function key to cancel the delete.

41 KEY IN DATA AND PRESS ENTER
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0023, VIR0026, VIR0041, VIR0041A, VIR0042, VIR1001
Meaning
    An empty screen is displayed into which you can enter the definition of a new configuration record.
Action
    Fill in the fields on the screen and press Enter to add the new record to the VIRARBO file.

42 INCORRECT VALUE
^^^^^^^^^^^^^^^^^^
Module
    VIR0023, VIR0031, VIR0041, VIR0041A, VIR0044, VIR0045, VIR0047, VIR1001
Meaning
    A value entered in a configuration record is not acceptable. For example, a field contains invalid characters, or the terminal name does not correspond to the terminal prefix of the associated line, or the transaction name does not correspond to the prefix of the associated entry point.
Action
    Correct the field in error and press Enter.

43 PLEASE WAIT....
^^^^^^^^^^^^^^^^^^
Module
    VIR0012, VIR0016, VIR0032, VIR0036
Meaning
    VIRTEL is connecting your terminal to the requested application.
Action
    Wait for the response from the host application.

45 EXCESSIVE NUMBER OF ATTEMPTS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0010
Meaning
    Signon was rejected by the security subsystem because too many incorrect signon attempts were made.
Action
    Contact your security administrator.

46 PASSWORD HAS BEEN CHANGED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0010
Meaning
    The user requested a change of password during signon. The new password has been accepted by the security subsystem.
Action
    None.

47 INACTIVITY TIMEOUT PLEASE ENTER YOUR PASSWORD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0020, VIR0020A, VIR0020L, VIR0020M, VIR0020P
Meaning
    VIRTEL has locked your terminal session because it has been inactive for too long.
Action
    Enter your password to unlock the terminal.

48 INVALID FUNCTION KEY
^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR1001-1006, VIR2002-2013, VIR2015-2016, VIR2019
Meaning
    The PF key selected is invalid for this screen.
Action
    Press one of the PF keys displayed on the screen.

49 NODE TYPE UNSUPPORTED
^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR2002, VIR2014, VIR2019
Meaning
    Cannot perform the requested function on this type of node.
Action
    None.

50 NODE TYPE INVALID
^^^^^^^^^^^^^^^^^^^^
Module
    VIR2002-2019
Meaning
    The node type is not recognized by the network management application.
Action
    None.

51 PROGRAM progname UNKNOWN OR DISABLED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0040, VIR1000-1006, VIR2002-2019, VIR4000-4023
Meaning
    A VIRTEL subapplication attempted to transfer control to a program which is not available.
Action
    Contact technical support.

52 INVALID CHOICE
^^^^^^^^^^^^^^^^^
Module
    VIR0040, VIR1000, VIR4000-4003, VIR4005
Meaning
    You entered an option which is not displayed on the menu.
Action
    Choose one of the options displayed on the menu.

53 FUNCTION RESERVED FOR ADMINISTRATOR
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4000
Meaning
    You entered an option which requires administrator authorization, but your userid does not have administrator privileges.
Action
    Sign on with an administrator userid.

54 OPTION RESERVED FOR HEAD OF DEPARTMENT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0040, VIR4000-4003
Meaning
    You entered an option which requires authorization by head of department, but your userid does not have the necessary privileges.
Action
    Sign on with a userid which is marked as head of department.

55 ENTER NAME OF DEPARTMENT
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4004, VIR4020, VIR4021
Meaning
    The requested operation requires a value in the indicated field but the field is blank.
Action
    Enter a value in the indicated field.

56 ENTER THE DESCRIPTION OF THE deptname DEPARTMENT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4020, VIR4021
Meaning
    The requested operation requires a value but the field is blank.
Action
    Enter a value in the indicated field.

57 ENTER THE NAME OF THE PERSON RESPONSIBLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4020, VIR4021
Meaning
    The requested operation requires a value but the field is blank.
Action
    Enter a value in the indicated field.

58 ENTER THE TITLE OF THE PERSON RESPONSIBLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4020, VIR4021
Meaning
    The requested operation requires a value but the field is blank.
Action
    Enter a value in the indicated field.


59 THE DEPARTMENT ALREADY EXISTS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
Module
    VIR4020
Meaning
    You are attempting to add a new department but a department of the same name already exists.
Action
    Choose a new department name or edit the existing department.

60 THE RESPONSIBLE PERSON ALREADY EXISTS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4020
Meaning
    You are attempting to add a new person but a person of the same name already exists.
Action
    Choose a new person or edit the existing person.

61 PRESS PF1 TO CONFIRM CREATION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4006, VIR4010, VIR4014, VIR4020
Meaning
    VIRTEL is requesting confirmation that you wish to create a new record.
Action
    Press F1 to create the new record. Press any other function key to cancel creation of the new record.

62 CREATION OK
^^^^^^^^^^^^^^
Module
    VIR4006, VIR4010, VIR4014, VIR4020, VIR4022
Meaning
    The new record has been created.
Action
    None.

63 END OF FILE
^^^^^^^^^^^^^^
Module
    VIR1001-1006, VIR4004, VIR4007-4009, VIR4011-4014, VIR4015-4016, VIR4021-4023
Meaning
    The end of file has been reached while browsing forward through the file.
Action
    None.


64 THE DEPARTMENT DOES NOT EXIST
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
Module
    VIR4004, VIR4021
Meaning
    The department which you are attempting to update no longer exists.
Action
    None.

65 UPDATE OK
^^^^^^^^^^^^
Module
    VIR4004, VIR4008, VIR4011, VIR4015, VIR4021, VIR4023
Meaning
    The updated record has been successfully written to the file.
Action
    None.

66 BEGINNING OF FILE
^^^^^^^^^^^^^^^^^^^^
Module
    VIR4004, VIR4008, VIR4011, VIR4015, VIR4021, VIR4023
Meaning
    The beginning of the file has been reached while browsing backwards through the file.
Action
    None.

67 THE DEPARTMENT STILL CONTAINS PROFILES
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4021
Meaning
    The department cannot be deleted because there are profiles associated with this department.
Action
    Delete the associated profiles before deleting the department.

68 THE DEPARTMENT STILL CONTAINS USERS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4021
Meaning
    The department cannot be deleted because there are users associated with this department.
Action
    Delete the associated users before deleting the department.

69 USE PF2 TO CONFIRM DELETE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4008-4009, VIR4011, VIR4015-4016, VIR4021
Meaning
    You requested the deletion of a configuration record.
Action
    Press F2 if you wish to delete the record. Press any other function key to cancel the delete.

70 DELETE OK
^^^^^^^^^^^^
Module
    VIR4008-4009, VIR4011, VIR4015-4016, VIR4021
Meaning
    The requested record has been successfully deleted from the file.
Action
    None.

71 THE RESOURCE ALREADY EXISTS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4010
Meaning
    You are attempting to add a new resource but a resource of the same name already exists.
Action
    Choose a new resource name or edit the existing resource.

72 ENTER THE DESCRIPTION OF THE RESOURCE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4010, VIR4011
Meaning
    The resource description field is blank.
Action
    Enter a value in the resource description field.

73 THE CURSOR POSITION IS INVALID
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4009, VIR4011, VIR4013, VIR4016, VIR4022
Meaning
    The function you requested requires the cursor to be placed on a record.
Action
    Position the cursor on the record you wish to operate upon.

74 THE RESOURCE DOES NOT EXIST
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4011
Meaning
    The resource which you are attempting to update no longer exists.
Action
    None.

75 MODIFIED BY ANOTHER USER
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4004, VIR4010-4011, VIR4015-4016, VIR4021-4023
Meaning
    The record you are attempting to update has been updated by another user.
Action
    Return to the previous menu and display the record again.

76 ENTER THE NAME OF THE PROFILE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4006, VIR4008
Meaning
    The profile name is blank.
Action
    Enter a value in the profile name field.

77 ENTER THE DESCRIPTION OF THE PROFILE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4006, VIR4008
Meaning
    The profile description is blank.
Action
    Enter a value in the profile description field.

78 THE PROFILE ALREADY EXISTS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4006, VIR4008
Meaning
    You are attempting to add a new profile record but a profile of the same name already exists.
Action
    Enter a different name in the profile name field.

81 REQUESTED ELEMENT DOES NOT EXIST
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR1002, VIR4006, VIR4008
Meaning
    The record being added or updated references an element which does not exist.
Action
    Correct the name of the referenced element.

82 REQUESTED ELEMENT DOES NOT EXIST IN DEPARTMENT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4006, VIR4008
Meaning
    The record being added or updated references an element which belongs to a different department.
Action
    Correct the name of the referenced element.

83 YOU ARE ON THE FIRST PAGE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4004, VIR4006, VIR4008, VIR4012-4015
Meaning
    You tried to scroll back to the previous page of data but you are already on the first page.
Action
    None.

84 YOU ARE ON THE LAST PAGE
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4004, VIR4006, VIR4008, VIR4012-4015
Meaning
    You tried to scroll forward to the next page of data but you are already on the last page.
Action
    None.

85 THE PROFILE DOES NOT EXIST
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4004, VIR4008, VIR4009, VIR4014-4015
Meaning
    The profile being updated or deleted does not exist.
Action
    None.

86 THE PROFILE IS USED IN ANOTHER DEPARTMENT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4008
Meaning
    The profile being updated does not exist.
Action
    None.

87 THE PROFILE IS EMPLOYED BY A USER
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4008, VIR4009
Meaning
    The profile being updated or deleted has been modified by another user since it was last displayed on your terminal.
Action
    Display the profile again and re-enter the modifications.

88 ENTER THE NAME OF THE USER
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4014, VIR4015, VIR4022
Meaning
    You are attempting to create or update a user or administrator record, but the user name field is blank.
Action
    Enter a valid user name.

89 ENTER THE DESCRIPTION OF THE USER
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
VIR4014, VIR4015
Meaning
You are attempting to create or update a user record, but the user description field is blank.
Action
Enter a value in the description field.

90 USER ALREADY EXISTS
^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4014, VIR4015
Meaning
    You are attempting to create or copy a user record, but the a user of the same name already exists.
Action
    Enter a different value in the user name field.

91 ERROR LOGICAL RECORD (name) NOT FOUND
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0021A, VIR0021R, VIR4004, VIR4014, VIR4015
Meaning
    Either you are attempting to call an external server name which does not exist, or you are attempting to update or delete a user record name which does not exist in the VIRARBO file.
Action
    Specify a valid name.

92 THE PROFILE DOES NOT APPEAR IN THE DEPARTMENT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4004, VIR4008, VIR4009, VIR4013, VIR4015
Meaning
    The profile being updated or deleted does not belong to the same department as the user.
Action
    Ensure that the profile matches the user’s department.

93 AUTHORISED PROFILE LIMIT EXCEEDED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4004, VIR4015
Meaning
    An internal table overflow has occurred.
Action
    Contact technical support.

94 USER DOES NOT EXIST
^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4015, VIR4016, VIR4021-4023
Meaning
    The user or administrator being updated or deleted does not exist.
Action
    None.

95 USER DOES NOT APPEAR IN THE DEPARTMENT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4015, VIR4016, VIR4021, VIR4023
Meaning
    The user being viewed, updated, deleted, or being used as a model, does not belong to the same department as the administrator.
Action
    Only an administrator in the same department as the user can perform the requested operation.

96 FUNCTION RESERVED FOR HEAD OF THE DEPARTMENT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4008, VIR4009, VIR4011, VIR4015, VIR4016
Meaning
    The user being copied, updated, or deleted does not belong to the same department as the administrator.
Action
    Only an administrator in the same department as the user can perform the requested operation.

97 ENTER Y OR N
^^^^^^^^^^^^^^^
Module
    VIR4014, VIR4015
Meaning
    You are attempting to create or update a user record, and the assistant field must contain either O or N.
Action
    Enter O (yes) or N (no) in the indicated field.

98 FIELD RESERVED FOR RESPONSIBLE OF DEPARTMENT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4014, VIR4015
Meaning
    You are attempting to create or update a user record, and the assistant field contains O (yes) but you are not the head of department.
Action
    Only the head of department may put O (yes) in the indicated field.

99 DELETION OF DEPARTMENT RESPONSIBLE FORBIDDEN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4014, VIR4015
Meaning
    You are attempting to delete a user record which is marked as head of department.
Action
    Update the department record to assign another user as head of department first.

100 DELETION OF DEPUTY FORBIDDEN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4015
Meaning
    You are attempting to delete a user record which is marked as an assistant.
Action
    Set the assistant field to N (no) first.

101 USER IS ALREADY ADMINISTRATOR
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4022
Meaning
    You are attempting to designate a user as an administrator, but the user is already an administrator.
Action
    None.

103 REPRODUCTION OK
^^^^^^^^^^^^^^^^^^^
Module
    VIR1001, VIR1002, VIR1005, VIR4008, VIR4015
Meaning
    The record has been successfully copied.
Action
    None.

104 REPRODUCTION OF DEPUTY FORBIDDEN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4015
Meaning
    You cannot copy a user record which is marked as an assistant.
Action
    Set the assistant field to N (no) first, or choose another user to copy.

105 USER SIGN-ON UNKNOWN
^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR4000
Meaning
    You attempted to access the security administration panels but you have not signed on to VIRTEL.
Action
    Log in with a valid VIRTEL userid.

106 SIGN-ON RESTORED OK
^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR4023
Meaning
    You have successfully unblocked a user which was locked out.
Action
    None.

107 CALL REJECTED BY THE NETWORK
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0021A, VIR0021R, VIR0025, VIR0025T
Meaning
    An attempt to make an outbound X25 call was unsuccessful.
Action
    Check for messages in the VIRTEL log which indicate the cause of the error.

109 PREVIOUS CONNECTION: dd/mm/yy hh:mm:ss termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00081
Meaning
    This message indicates the date, time, and terminal name of the previous logon by your userid using VIRTEL internal security.
Action
    None.

110 THE FILE filename UNKNOWN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR1001, VIR1002
Meaning
    The file filename cannot be found.
Action
    Ensure that the file is correctly referenced in the VIRTCT, and that there is a DD statement for the indicated file.

111 THE FILE filename IS CLOSED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR1001, VIR1002
Meaning
    VIRTEL cannot open the file filename.
Action
    Check the VIRTEL log for messages relating to the indicated file.

112 I/OERROR ON FILE filename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0043, VIR0043H, VIR1001, VIR1002
Meaning
    There has been an error accessing the file filename.
Action
    Check the VIRTEL log for messages relating to the indicated file.

113 THIS IS NOT A MINITEL NATIVE NODE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR1003
Meaning
    The requested record cannot be displayed because it is a sub-server record.
Action
    Choose a native node record.

114 ALL=END
^^^^^^^^^^^
Module
    VIR1003, VIR1004
Meaning
    This is an information message indicating that all function keys perform the END function.
Action
    None.

115 PLEASE SUPPLY A VALID NODE NAME
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR2019
Meaning
    The network management application requires a non-blank node name.
Action
    Enter the name of a valid VTAM node.

116 THE NODE NAME IS INVALID
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR2019
Meaning
    The node name specified is not the correct type for the network management application.
Action
    Enter the name of a valid VTAM node.

117 CONFIRM CANCELLATION OF THE PASSWORD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0041
Meaning
    You pressed PF4 to request that a VIRTELPC password be removed.
Action
    Press PF4 again to remove the password, or press any other key to cancel the operation.

118 THIS FILE IS ALREADY IN THE TARGET DIRECTORY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0043, VIR0043H, VIR0052
Meaning
    The file you are attempting to copy already exists in the target directory.
Action
    Delete the file from the target directory and try again.

119 COPY COMPLETED
^^^^^^^^^^^^^^^^^^
Module
    VIR0043, VIR0043H
Meaning
    The file you requested has been successfully copied.
Action
    None.

120 THE RECORDED STATUS HAS CHANGED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0043, VIR0043H
Meaning
    The status of the file has been successfully toggled from “Public” to “Private” or vice versa.
Action
    None.

121 FILE ERROR PLEASE SEE THE ADMINISTRATOR
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0033, VIR0043, VIR0043H, VIR0052
Meaning
    An I/O error has occurred on:
    - the VIRCMP3 file during compression management;
    - a user directory or VIRARBO file during directory management;
    - the VIRSWAP file during page capture management.
Action
    Check the VIRTEL log for error messages indicating the cause of the error.

122 FILE TRANSFER IN PROGRESS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0043, VIR0043H
Meaning
    A file is being transferred between VIRTEL and VIRTELPC.
Action
    None.

123 CONFIRM COPY TO MEMORY
^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0043, VIR0043H
Meaning
    You pressed PF6 to request the copy of a file to the stack.
Action
    Press PF6 again to copy the file, or press any other key to cancel the operation.

124 CONFIRM THE COPY OF THIS PAGE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0043, VIR0043H
Meaning
    You pressed PF1 to request that all files should be downloaded.
Action
    Press PF1 again to confirm, or press any other key to cancel the operation.

125 IMPOSSIBLE OPERATION
^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0022A
Meaning
    Either you pressed PF2 on the VIRTEL Multi-Session sub-menu to request that the application be promoted to the main menu, but the main menu is full; or you pressed PF2 to request that an application should be demoted to the sub-menu, but the application cannot be removed from the main menu because you currently have a active session with this application.
Action
    None.

126 NAME OF PAGE TO LOAD :
^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR1010
Meaning
    VIRTEL is requesting the name of a videotex page to be uploaded to the VIRARBO file.
Action
    Enter the name of the page to be uploaded.

127 THE PAGE ALREADY EXISTS,REPLACE (Y / N)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR1010
Meaning
    During a videotex page upload operation, VIRTEL has determined that a page of the same name already exists in the VIRARBO file.
Action
    Enter Y to overwrite the page in the VIRARBO file, or N to cancel the operation.

128 SELECT THE PAGE THEN PRESS SEND
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR1010
Meaning
    During a videotex page upload operation, VIRTEL is ready to receive the page to be uploaded.
Action
    Select the page according to the procedure provided by your page composition software, then press the “SEND” (or “ENVOI”) key.

129 CREATION COMPLETED
^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR1010
Meaning
    A new videotex page has been successfully uploaded to the VIRARBO file.
Action
    None.

130 UPDATE COMPLETED
^^^^^^^^^^^^^^^^^^^^
Module
    VIR1010
Meaning
    A replacement videotex page has been successfully uploaded to the VIRARBO file.
Action
    None.

131 PRESS PF1 TO CONFIRM THE UPDATE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0044, VIR0046
Meaning
    As a result of an earlier modification to the definition of a VIRTEL transaction, the associated entry point must now be updated.
Action
    Press PF1 to confirm the update.

132 PLEASE CONFIRM YOUR PASSWORD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0020, VIR0020A, VIR0020L, VIR0020M, VIR0020P
Meaning
    VIRTEL has temporarily locked your terminal because of lack of activity.
Action
    Enter your password again to reactivate your terminal.

133 UNITS SPENT: nnnnn.nn
^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0021A, VIR0025
Meaning
    This message shows the number of units consumed by a call to an external server.
Action
    None.


134 POSITION IN QUEUE: nnnn
^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0025, VIR0025T
Meaning
    This message shows your position in the queue for a call to an external server.
Action
    None.

135 ACTIVATION WAS REQUESTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0041A
Meaning
    You pressed PF4 in the e-mail correspondent management sub-application to request activation of a correspondent.
Action
    None.

136 DISABLE WAS DONE
^^^^^^^^^^^^^^^^^^^^
Module
    VIR0041A
Meaning
    You pressed PF5 in the e-mail correspondent management sub-application to request deactivation of a correspondent.
Action
    None.

137 Should contain the '@' sign
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0041A
Meaning
    This message is issued by the e-mail correspondent management sub-application to allow you to verify how your terminal displays the “@” sign. In some countries, the “@” sign may appear differently on a 3270 terminal (for example, “à”).
Action
    When you enter an e-mail address, ensure that you use the same symbol as displayed in this message.

138 Sample command: &|W
^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0045
Meaning
    This message is issued by the entry point and transaction management sub-application to allow you to verify how your terminal displays the “&” and “|” signs. In some countries, these characters may appear differently on a 3270 terminal (for example, “!” instead of “|”).
Action
    When you enter script commands in the “TIOA at logon” and “TIOA at logoff” fields, ensure that you use the same symbols as displayed in this message.

5.2.    Web Access Messages
---------------------------

.. note::
    These messages are issued by VIRTEL Web Access scripts and are displayed as alerts in the user’s browser window. 

*Cannot open pop-up window for print data. You may need to disable your pop- up blocker*

Module
    js01.js
Meaning
    VIRTEL Web Access print function needs to open a new browser window to display print data, but the function is disallowed by the browser settings.
Action
    Adjust your browser settings to allow VIRTEL scripts to open pop-up windows. For Internet Explorer, add the VIRTEL host to the trusted zone. For Firefox, add the VIRTEL host to the exceptions list in Tools – Options – Content – Block pop-up windows.

*Cannot open pop-up window for settings. You may need to disable your pop-up blocker*       

Module
    js01.js
Meaning
    The VIRTEL Web Access Settings menu cannot be displayed because the browser settings do not permit scripts to open new windows.
Action
    Same as previous message.

*Message too long for RSA*

Module
    rsa.js
Meaning
    An anomaly has been detected by the encryption script.
Action
    Contact technical support.

*Invalid RSA public key*

Module
    rsa.js
Meaning
    The RSA key supplied by VIRTEL is not valid.
Action
    Contact technical support.

*vircrypt.js: VIRTEL CRYPT parameters are missing*

Module
    vircrypt.js
Meaning
    VIRTEL did not supply the encryption parameters requested by the page template.
Action
    Check that there is a CRYPTn parameter in the VIRTCT whose name matches the name requested by the page template. For the WEB2AJAX.htm template, there must be a CRYPTn parameter whose name subparameter is CRYPT3270.

*vircrypt.js: Unable to obtain public key from VIRTEL*

Module
    vircrypt.js
Meaning
    VIRTEL did not supply the RSA public exponent or modulus requested by the page template.
Action
    Check the JESMSGLG for the VIRTEL started task to determine why the public key request failed.

*vircrypt.js: Unsupported encryption algorithm: xxx*    

Module
    vircrypt.js
Meaning
    The symmetric encryption algorithm specified in the CRYPTn parameter of the VIRTCT is not supported by this version of the script.
Action
    Clear the browser cache to ensure that you are using the latest version of the script. If the problem persists, contact technical support.

*vircrypt.js: Unsupported encoding|chaining|padding method: xxx*

Module
    vircrypt.js
Meaning
    The encoding method, chaining method, or padding method specified in the CRYPTn parameter of the VIRTCT is not supported by this version of the script.
Action
    Clear the browser cache to ensure that you are using the latest version of the script. If the problem persists, contact technical support.

*vircrypt.js: Unsupported PKA algorithm: xxx*

Module
    vircrypt.js
Meaning
    The asymmetric encryption algorithm specified in the CRYPTn parameter of the VIRTCT is not supported by this version of the script.
Action
    Clear the browser cache to ensure that you are using the latest version of the script. If the problem persists, contact technical support.

6.  VIRTEL console messages
===========================

6.1    Messages VIR000xx
========================

VIR0000I xxxx Date: Mon, 07 Jun 2004 15:20:23 GMT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    These messages indicate the current time from the point of view of the HTTP and SMTP server components of VIRTEL. The times are calculated from the system TOD CLOCK, adjusted by the GMT parameter of the VIRTCT.
Action
    None.

VIR0001W VSAM ERROR ON FILE filename : yy yy (HEX) REQ : zz KEY : keyvalue
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0001
Meaning
    Unexpected VSAM error occurred during access of file filename. yy yy is the VSAM return code, zz is the request being processed, keyvalue is the record access key (16 characters).
Action
    Verify the values of the return codes in the appropriate IBM documentation. VSAM error codes are documented in the chapter entitled VSAM Macro Return and Reason Codes in the IBM manual DFSMS Macro Instructions for Data Sets.

VIR0002W TERM=termid, REQUEST=qq, RTNCD=cc, FDBK2=dd, SENSE=ssss ssss xxxxxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    Unexpected VTAM error during dialogue with a terminal: termid is the name of the terminal, qq is the type of VTAM request which encountered the error, cc is the VTAM return code (hexadecimal), dd is the VTAM feedback code (hexadecimal), ssss ssss is the sense code, and xxxxxxx is VIRTEL’s interpretation of the sense code.
Action
    Verify the values of the returned sense codes in the appropriate IBM documentation. VTAM codes are documented in the IBM VTAM Messages and Codes or Communications Server IP and SNA Codes manuals.

VIR0003I xxxxxxxx ENDED
^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    VIRTEL termination is complete.
Action  
    None.

VIR0004I CLEANUP : luname/ applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    The session was interrupted between the relay associated with the terminal luname and the application applname.
Action
    None.

VIR0005W UNABLE TO ACTIVATE relayname (termid) ERROR: xx000000
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    The relay relayname associated with terminal termid cannot be activated. xx is the ACB error code. Commonly encountered codes are:

    - 58 : ACB already in use by another application
    - 5A : ACB not activated in VTAM
    
    For the meaning of other codes, see the IBM VTAM Programming manual.
Action
    Verify that the VTAM node containing the relay relayname has been activated, verify that the relay is not already activated for an other terminal or application, and that the terminal is correctly defined in VIRTEL.

VIR0006I DETACHING xxxxxxxx SUBTASK
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    VIRTEL is detaching subtask xxxxxxxx before stopping the system.
Action
    None.

VIR0007I luname/applname BIND FAILED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    A connection request for the terminal luname from the application applname was rejected due to insufficient storage to establish the session, or because a session already exists with this application.
Action
    Verify the memory allocation to VIRTEL.

VIR0008S INVALID RPL
^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0009
Meaning
    VTAM has found an invalid RPL. This message is followed by an ABEND U009.
Action
    Contact technical support.

VIR0009I xxxxxxx : SHUT DOWN IN PROGRESS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    VIRTEL is shutting down. xxxxxxxx represents the name of the VIRTEL primary ACB.
Action
    None.

6.2    Messages VIR001xx
========================

VIR0010I SUBPOOL SIZE = ssss K
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    Indicates in kilobytes the quantity of memory available to VIRTEL for working storage after loading resident modules.
Action
    None.

VIR0011E INSUFFICIENT MEMORY FOR START UP
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Module
    VIR0000
Meaning
    VIRTEL has not acquired the minimum memory required to start and has abandoned its initialisation.
Action
    Increase the value of the OSCORE parameter in the VIRTCT, and/or :
    - in VSE, increase the partition size,
    - in MVS, increase the REGION size.

VIR0012W INSUFFICIENT MEMORY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    VIRTEL does not have sufficient memory to satisfy a request.
Action
    Increase the memory allocated to VIRTEL, and/or increase the value of the OSCORE parameter of the VIRTCT. (See message VIR0011E).

VIR0013W VTAM SHORT ON STORAGE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    VTAM lacks sufficient memory to satisfy a request.
Action
    Ensure that the VTAM definitions are correct.

VIR0014S FREEMAIN FATAL ERROR
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    An unexpected error occurred during a call to release memory in the subpool. The system will stop.
Action
    Contact technical support.

VIR0015S ABEND WITHIN VIRTEL KERNEL, TASK=taskname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0007
Meaning
    An unexpected error occurred in the VIRTEL kernel. This message is preceded by message VIR0016W and followed by abend U0007.
Action
    In order to deal with this problem, two dumps are printed during VIRTEL termination, one formatted, the other non formatted. Contact technical support.

VIR0016W ABEND abendtype TERM=termid, PROG=progname, OFFSET=+xxxxx VIR0016W PSW = pppppppp pppppppp nnnncccc aaaaaaaa
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0004
Meaning
    An abend with code abendtype was produced in the program progname at offset xxxxx during a session from terminal termid. ppp...ppp represents the program status word at the time of the abend, nnnn is the instruction length code, cccc is the interruption code, and aaaaaaaa is the translation exception address. For VSE, only the program status word is displayed. A partial formatted DUMP is written to the SYSPRINT file.
Action
    Contact technical support.

VIR0017I LOGON luname/relayname DENIED STATE=ss
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    The terminal luname tried to connect under the name relayname. This connection was refused for one of the following reasons :

    - the name of the terminal is different to that associated with the relay to which it tried to connect,
    - the previous connection did not terminate,
    - a terminal was connected to VIRTEL over a logical channel unknown to VIRTEL.

Action
    None.

VIR0018I VIRTEL r.vv HAS THE FOLLOWING PTF(S) APPLIED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning 
    Indicates the PTF numbers applied to VIRTEL.
Action
    None.

VIR0019I VIRTEL 4.nn HAS NO PTFS APPLIED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    Indicates that no PTFs are applied to VIRTEL.
Action
    None.

6.3    Messages VIR002xx
========================

VIR0020E APPLICATION acbname IS ALREADY ACTIVE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    The application acbname referenced in the APPLID parameter of the VIRTCT is already in use.
Action
    Check if another VIRTEL task is already active. Check that the correct APPLID was specified in the VIRTCT.

VIR0021E ERROR xx OPENING MAIN TASK ACB acbname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    VIRTEL has encountered an ACB error code xx when opening the VTAM ACB acbname.
Action
    Check that the APPLID is correctly specified in the VIRTCT, and that the VTAM application node for VIRTEL has been activated. The following are commonly encountered ACB error codes:

    - 52 : VTAM is in the process of stopping.
    - 54 : the VIRTEL application is not defined for VTAM.
    - 56 : VIRTEL is defined, but not as an application.
    - 5A : the VIRTEL application is not defined for VTAM.
    - 5C : VTAM is inactive.

For values of the ACB error code, refer to the IBM VTAM Programming manual.

VIR0022E ERROR xx BUILDING VSAM BUFFER POOL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    Error code xx has occurred when generating the VSAM buffer pools.
Action
    Evaluate the following operands BUFDATA, BUFSIZE and STRNO of the VIRTCT. Return code X'08' indicates that the memory allocated to VIRTEL is insufficient.

VIR0023E ERROR xx OPENING FILE filename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0000
Meaning
    VSAM error xx occurred when opening file filename.
Action
    Verify in the appropriate IBM documentation the meaning of the returned code. Note that when opening the VIRSWAP file, a return code of X'5C' (empty file) is considered normal. The VIRSWAP file is always empty at start-up this does not constitute an error.

VIR0024I
^^^^^^^^
This message indicates the progress of VIRTEL start-up : 

OPENING FILE filename

Module
    VIR0000
Meaning
    VIRTEL is opening file filename.
Action
    None.

CLOSING FILE filename

Module
    VIR0000
Meaning
    VIRTEL is closing file filename.
Action
    None.

ATTACHING SUBTASK

Module
    VIR0000
Meaning
    VIRTEL is loading its subtasks.
Action
    None.

READING VIRARBO

Module
    VIR0000
Meaning
    VIRTEL is loading its configuration information stored in the VIRARBO file.
Action
    None.

READING TYPES

Module
    VIR0000
Meaning
    VIRTEL is loading the screen types for level 3 compression stored in the VIRCMP3 file.
Action
    None.

STARTING CRYPTn

Module
    VIR0000
Meaning
    VIRTEL is loading the interface modules for the encryption engine specified by the CRYPTn parameter in the VIRTCT.
Action
    None.

VIR0025E ERROR progname IS NOT FOR VIRTEL VERSION vvv
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    The VIRTCT progname was assembled using a version of VIRTEL which was not the same as the running version vvv.
Action
    Re-assemble the VIRTCT using version vvv of the VIRTEL MACLIB.

VIR0025E ERROR ON OVERRIDE: overname RETURN CODE: hhhh SUB CODE: ssssssss
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    An error occurred while processing a VTOVER macro in the VIRTCT.  overname is the label of the VTOVER macro       in error, hhhh is the return code (in hexadécimal) specified by the ERRORC parameter of the VTOVER macro, and ssssssss is a code (in hexadécimal) indicating the type of error.
Action
    Correct the error, re-assemble the VIRTCT, and restart VIRTEL.

VIR0026I COMPRESSION 3 IS NOT ACTIVE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    The compression level 3 management system has not been activated.
Action
    Verify the validity of the operands FCMP3 and COMPR3 of the VIRTCT.

VIR0026W termid OPEN SESSION luname1 – luname2
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    VIRTEL has stopped while a session with terminal luname is still active.
Action
    None.

VIR0026W linename HAS OPEN OBJECT socknum
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    VIRTEL has stopped while a connection to the MQSeries message queue manager is still active.
Action
    None.

VIR0026W termid IS DISCONNECTED DUE TO TIME-OUT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    Terminal termid was disconnected after expiry of the inactivity timer. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIR0027I
^^^^^^^^
Screen type management messages :

nnnn SCREEN TYPES LOADED
    Module
        VIR0000
    Meaning
        VIRTEL has located nnnn screen types while initialising level 3 compression.
    Action
        None.

SAVING SCREENS
    Module
        VIR0000
    Meaning
        VIRTEL is saving the screen types in file VIRCMP3 before stopping the system.
    Action
        None.

VIR0028I SCREEN screentype ADDED TO LIBRARY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    A screen type of screentype was added to the library of screen types.
Action
    None.

VIR0028I SCREEN screentype MODIFIED TO LIBRARY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    A screen of type screentype was modified in the library of screen types.
Action
    None.

VIR0028W SCREEN screentype WAS NOT MOVED TO LIBRARY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    A screen of type screentype could not be moved to the library of screen types.
Action
    Verify that the VIRCMP3 file is not full or damaged.

VIR0028W WELCOME OF UNDEFINED luname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    A terminal luname that was not defined in VIRTEL was connected in “welcome” mode. It will no longer be under the control of VIRTEL once it has selected an application from the menu.
Action
    None.

VIR0029W WELCOME OF UNDEFINED luname DENIED : NO MORE ENTRIES
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    The terminal luname which is not defined in VIRTEL attempted to connect in “welcome” mode, but all the available terminal slots are occupied. The connection is refused by VIRTEL.
Action
    If you wish to operate the terminal in “relay” mode, define the terminal in VIRTEL with an associated relay defined by a VTAM APPL card. If you wish to continue operating the terminal in “welcome” mode, increase the value of the NBDYNAM parameter in the VIRTCT.

6.4    Messages VIR003xx
========================

VIR0030E ERROR xx LOADING progname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    Error xx was detected while loading the module progname.
Action
    This was probably an attempt to load an exit that was not assembled, or incorrectly referenced in the VIRTCT.

VIR0030E ERROR: xx LOADING progname : CROSS MEMORY CANNOT START
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    VIRTEL cannot load the VIRXM interface program progname. VIRTEL is unable to start cross-memory (XM) lines.
Action
    Ensure that the VIRXM load library is included in the STEPLIB of the VIRTEL STC.

VIR0030E ERROR: xx LOADING progname : BATCH INTERFACE CANNOT START
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    VIRTEL cannot load the batch interface program progname. VIRTEL is unable to start batch (BATCHn) lines.
Action
    Ensure that the correct version of the VIRTEL load library is included in the STEPLIB of the VIRTEL STC.

VIR0030S ERROR OPENING DFHRPL (MVS only)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0003
Meaning
    The DFHRPL file was not open. Initialisation is stopped.
Action
    Verify the definition of the STC.

VIR0030W PROGRAM progname NOT FOUND
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0003
Meaning
    The module progname was not found in the library accessed by VIRTEL.
Action
    Contact technical support.

VIR0031E UNDEFINED TCP TCPn FOR LINE n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    The definition of line n-xxxxxx specifies line type TCPn, but the TCPn parameter is not defined in the VIRTCT.
Action
    Correct the line definition, or define the TCPn parameter in the VIRTCT.

VIR0031E UNSUPPORTED CROSS-MEMORY XMn (protocol) FOR LINE n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
Module
    VIR0000
Meaning
    The definition of line n-xxxxxx specifies line type XMn, but the XMn parameter is not defined in the VIRTCT.
Action
    Correct the line definition, or define the XMn parameter in the VIRTCT.

VIR0031E UNSUPPORTED MQ SERIES TYPE MQn (protocol) FOR LINE n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    The definition of line n-xxxxxx specifies line type MQn, but the MQn parameter is not defined in the VIRTCT.
Action
    Correct the line definition, or define the MQn parameter in the VIRTCT.

VIR0031E UNSUPPORTED BATCH LINE TYPE BATCHn (protocol) FOR LINE n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    The definition of line n-xxxxxx specifies line type BATCHn, but the BATCHn parameter is not defined in the VIRTCT.
Action
    Correct the line definition, or define the BATCHn parameter in the VIRTCT.

VIR0031W PROGRAM progname NOT FOUND
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0003
Meaning
    The module progname was not found in the library accessed by VIRTEL.
Action
    In MVS, verify that the DFHRPL DD card in the VIRTEL started task JCL specifies the name of the library that contains the VIRTEL load modules. In DOS, verify that the LIBDEF SEARCH card in the VIRTEL startup JCL references the library that contains the VIRTEL phases.

VIR0032E PERMANENT I/O ERROR DURING FETCH
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0003
Meaning
    An error occurred while attempting to load a module.
Action
    Verify the definition of the library containing VIRTEL modules.

VIR0032W BYPASSING LINE n-xxxxxx : STATUS IS ZERO
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    The line whose internal name is n-xxxxxx was not activated at VIRTEL startup, because the “Possible calls” field is set to 0 in the line definition.
Action
    None.

VIR0032W BYPASSING LINE n-xxxxxx : DISABLED IN VIRTCT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    The line whose internal name is n-xxxxxx was not activated at VIRTEL startup, either because its name appears in the IGNLU parameter in the VIRTCT, or because your VIRTEL license does not allow the activation of this type of line.
Action
    In the first case, remove the line name from the IGNLU parameter in the VIRTCT. In the second case, contact Syspertec to upgrade your license.

VIR0033E NO LINE DEFINED FOR termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    Terminal termid is defined but is not linked to any active line.
Action
    Check that the prefix of the terminal name is referenced in the definition of the appropriate line. This message is normal if the terminal is linked to an inactive line (indicated by message VIR0032W).

VIR0033W INSUFICIENT MEMORY TO LOAD MODULE progname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0003
Meaning
    VIRTEL has not loaded the module progname because of memory shortage.
Action
    See message VIR0011E and VIR0012W.

VIR0034E INVALID DEB DURING LOAD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0003
Meaning
    Unexpected error when loading a module from DFHRPL.
Action
    Call technical support.

VIR0034W BYPASSING RULE rulename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    Rule rulename could not be loaded.
Action
    Check that VIRTEL has enough memory. Obtain a SNAP dump and call technical support.

VIR0035E UNDEFINED LINE n-xxxxxx FOR RULE rulename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0000
Meaning
    Rule rulename is associated with line n-xxxxxx, but the line does not exist or is not active.
Action
    This message is normal if the rule is linked to an inactive line (“Possible calls” set to 0, or line specified in the IGNLU parameter in the VIRTCT) or to a user ruleset.

VIR0036W WARNING : RULE rulename FOR LINE n-xxxxxx HAS AN ACTIVE TRACE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    Rule rulename associated with n-xxxxxx is set to trigger a trace of incoming calls.
Action
    If the trace is not wanted, display the definition of rule rulename from the definition panel for line n-xxxxxx. Blank out the “Trace” field and press F1.

VIR0037E ERREUR xx OUVERTURE SYSPRINT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0004
Meaning
    Error xx occurred when opening the file SYSPRINT/SYSLST.
Action
    Verify the DD card or the DLBL referencing the print file.

VIR0038I SNAP COMPLETE
^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0004
Meaning
    VIRTEL has written a SNAP dump of the internal trace table to the SYSPRINT/SYSLST file.
Action
    None.

VIR0039E ERROR: THE VIRTCT VIRTCTxx IS INVALID: VIRTEL CANNOT CONTINUE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    The length of the VIRTCT does not match the expected length for this release of VIRTEL.
Action
    Use job ASMTCT in the VIRTEL CNTL library to reassemble the VIRTCT using the correct level VIRTERM macro.

VIR0039I trace command VTAM
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR2020
Meaning
    A VTAM command other than a display was issued from the VIRTEL network management system.
Action
    None.

6.5    Messages VIR004xx
========================

VIR0040E ERROR: THE VIRTCT progname IS INVALID: VIRTEL CANNOT CONTINUE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    The VIRTCT progname was assembled using a version of VIRTEL which was not the same as the running version.
Action
    Re-assemble the VIRTCT using the current version of the VIRTEL MACLIB.

VIR0040I GATE : linetype LINE n-xxxxxx ACTIVATED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0005
Meaning
    VIRTEL has established communication with the X25 line linename.
Action
    None.

VIR0041I termid : CALL ABORTED ON LINE n-xxxxxx VC cccc CAUSE = xx DIAGNOSTIC = dd
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0005
Meaning
    An outgoing call in GATE mode using terminal termid did not complete. If cccc is greater than the number of SVC’s, it refers to the temporary identification of the outgoing call.
Action
    For the meaning of the cause and diagnostic codes, refer to the X.25 documentation supplied by SAPONET.

VIR0042I GATE : UNSUPPORTED COMMAND = xx ON MCH n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    	VIR0005
Meaning
    The packet received from the X.25 network is of an unknown type. xx represents the hexadecimal value of the first byte of the packet, n-xxxxxx represents the name of the MCH on which the incident occurred.
Action
    Contact technical services if the incident persists.

VIR0043I GATE : DIAGNOSTIC = xx,yyyyy on MCH n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    A diagnostic packet was received from the X.25 network. The packet contains values xx and call user data yyyyy. For certain codes, yyyyy represents the number of the virtual circuit concerned.
Action
    Refer to the SAPONET documentation.

VIR0044I termid : COMMAND xx ERROR yy on VC cccccc
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0005
Meaning
    The command xx sent on virtual circuit cccccc has produced an error yy. termid is the name of the terminal concerned.
Action
    Refer to the SAPONET documentation.

VIR0045E termid : NBCVC PARAMETER TOO SMALL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    A call could not complete because there was no VC available. termid is the name of the terminal concerned.
Action
    Increase the value of the NBCVC operand in the VIRTCT of VIRTEL.

VIR0046E GATE : PROTOCOL ERROR ON MCH n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0005
Meaning
    An error was encountered on the link with the MCH n-xxxxxx.
Action
    This error is different to the lost session error, or the deactivation of the LU MCH. (See the possible associated message VIR0002W ).

VIR0047W GATE : ERROR ACTIVATING linetype LINE n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    VIRTEL could not acquire the X.25 line n-xxxxxx.
Action
    Check the definition of line n-xxxxxx. The value in the “Partner” field must match the name of the MCH LU generated by NPSI. Verify that the LU is active in VTAM.

VIR0048W GATE : LINE n-xxxxxx INACTIVATED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    The link between VIRTEL and the line n-xxxxxx has terminated.
Action
    Verify the cause of the deactivation.

VIR0049I X25 COMMAND xx RECEIVED FOR TERMINAL termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    VIRTEL has received the X.25 command xx from terminal termid. It is either unknown, or is unexpected at this time, and is ignored.
Action
    None.

6.6    Messages VIR005xx
========================

VIR0050W INVALID EIB FREEMAIN FOR luname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    An unexpected free memory block error associated with terminal luname was encountered.
Action
    Contact technical support if the message persists.

VIR0051I termid CONNECTED TO SERVICE ssssssss
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    
Module
    VIR0014
Meaning
    The terminal termid has established contact with VIRTEL. It has been connected to the service ssssssss. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIR0052I termid DISCONNECTED AFTER nn MINUTES
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0014
Meaning
    The terminal termid has disconnected after nn minutes of connection. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIR0053W MISSING PAGE pagename IN NODE nodename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0014
Meaning
    Tree structure definition problem. The node nodename referenced a page pagename that does not exist in the VIRARBO file.
Action
    Verify the definition of the Minitel tree structure.

VIR0056S NO MORE OSCORE AVAILABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    VIRTEL has insufficient memory available to load a module.
Action
    Verify the OSCORE parameter in the VIRTCT.

VIR0059I termid RELAY relayname ACTIVATED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    VIRTEL has opened the relay relayname associated with the terminal termid.
Action
    None.

6.7    Messages VIR006xx
========================

VIR0060W MAPFAIL WAS DETECTED ON TERMINAL luname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    Conflict between a VIRTEL program and a sub application screen.
Action
    Contact technical support.

VIR0060W PROGRAM progname IS A NEW COPY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    A NEW command for module progname has successfully refreshed the module in memory.
Action
    None.

VIR0061E MAP mapname NOT FOUND IN MAPSET mapsetname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    Conflict between a map mapname and a VIRTEL program.
Action
    An abend follows this message. Contact technical support.

VIR0061W PROGRAM progname NOT IN MEMORY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000, VIR0002
Meaning
    A NEW command, a ZAP command, or a ZAPD instruction did not complete due to the absence of the module progname in memory.
Action
    For a NEW command: None. The module will be loaded by VIRTEL when required. For a ZAP command: Correct the command and reenter. For a ZAPD instruction: Correct the instruction and restart VIRTEL.

VIR0062I termid TRACE ACTIVE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0002
Meaning
    A TRACE command has activated the trace on terminal or line termid.
Action
    None.

VIR0062I termid TRACE INACTIVE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0002
Meaning
    A NOTRACE command has inactivated the trace on terminal or line termid.
Action
    None.

VIR0062W LINE linename IS UNKNOWN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    A LINE=linename,START or STOP command refers to a line not known to VIRTEL.
Action
    Reenter the command specifying a valid linename.

VIR0063W LINE linename ALREADY ACTIVE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    A LINE=linename,START command attempted to start a line which was already active.
Action
    None.

VIR0064W LINE linename (n-xxxxxx) START / STOP REQUESTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    VIRTEL has processed a LINE=linename,START or STOP command on the line whose external name is linename and whose internal name is n-xxxxxx.
Action
    None.

VIR0064W ADDRESS aaaa NOW IS :  yyyy yyyy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000, VIR0002
Meaning
    Notifies that the ZAP command or ZAPD instruction was executed successfully in memory at address aaaa.
Action
    A modification made by ZAP command is valid until the next restart of VIRTEL. The ZAPH parameter of the VIRTCT can be used to ensure that the modification is reappied at each restart.

VIR0064W OFFSET LENGTH xxxx IS INVALID
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    The offset field of a ZAPD instruction in the VIRTCT is invalid.
Action
    Correct the ZAPD instruction and restart VIRTEL.

VIR0065E VERIFY ERROR. ADDRESS aaaa IS : yyyy yyyy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000, VIR0002
Meaning
    A ZAP command or a ZAPD instruction cannot complete because of an error at address aaaa during verify.
Action
    None.

VIR0066I APPLYING ptfid ON progname desc
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    At startup VIRTEL is preparing to process a ZAPD instruction in the VIRTCT.
Action
    None.

VIR0067I MESSAGES ARE NOW DISPLAYED VIR0067I MESSAGES ARE NOW DISCARDED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    As a result of the SILENCE command, connection and deconnection messages will now be displayed or discarded.
Action
    None.

VIR0068E
^^^^^^^^
Invalid system command.

INVALID COMMAND
    Correct the command
Module
    VIR0002
Meaning
    The command passed to VIRTEL is unknown.
Action
    Correct the command

NOT FOUND
    Correct the command.
Module
    VIR0002
Meaning
    A SNAP or TRACE command referenced a terminal unknown to VIRTEL.
Action
    Correct the command.

VIR0068I SNAP WILL FOLLOW msgid1 msgid2 
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    As a result of a SNAPMSG command, VIRTEL will produce a SNAP following the first occurrence of one of the messages indicated.
Action
    None.

VIR0069I READY
^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    VIRTEL is ready for the next console command (VSE).
Action
    None.

6.8    Messages VIR007xx
======================== 

VIR0070I SIMULTANEOUS TRANSACTION AT TERMINAL termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0010
Meaning
    The terminal termid has started a second transaction while the first one was still active.
Action
    If the first transaction results in a Multi-Session menu display, VIRTEL maybe did not obtain from VTAM the status of the menu applications (in cross domain for example). If this is the case, remove status control from this application (PF9 from the general Sub-Applications menu).

6.9    Messages VIR008xx
========================

VIR0080W VSAM ERROR ON FILE VIRARBO xx xx REQ : yy, KEY: cccccccc
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    Security
Meaning
    VSAM error xx xx has appeared on the VIRARBO file for request yy on key cccccccc.
Action
    VSAM error codes are documented in the chapter entitled VSAM Macro Return and Reason Codes in the IBM manual DFSMS Macro Instructions for Data Sets.

VIR0081W NO MORE OSCORE AVAILABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    Security
Meaning
    VIRTEL does not have sufficient memory to load a security module.
Action
    Check the value of the OSCORE parameter in the VIRTCT.

VIR0082W UNAUTHORIZED USER TERMINAL : luname NAME : username
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	Security
Meaning
    VIRTEL security. A password was erroneously used more than three times for the same user username from the terminal luname.
Action
    The user username is revoked and may not be re established except by the security administrator of VIRTEL.

VIR0083W opcode OF ELEMENT xxxxxxxx BY username FROM luname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    Security
Meaning
    VIRTEL security. Trace a modification of the security of VIRTEL. The user username has proceeded with the modification opcode (ADD, UPDATE, DELETION) of security element xxxxxxxx USER, RESSOURCE, PROFIL, DEPARTMENT from terminal luname.
Action
    None.

VIR0084W ELEMENT REFERENCE ERROR xxxxxxxx ELEMENT yyyyyyyy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	Security
Meaning
    VIRTEL security. A referencing problem in the security of VIRTEL. For example the element xxxxxxxx referenced element yyyyyyyy that does not exist.
Action
    Modify the element reference in the security program of VIRTEL.

VIR0085E INVALID MEMORY FREE REQUEST. ADDR=aaaaaaaa. SUBPOOL=ss. CALLER=cccccccc
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    The VIRTEL memory request is invalid because, either the subpool is invalid or the address to be freed is outside the associated subpool pages, or the address to be freed is not found in the DSA table.
Action
    Virtel continues. If you get a significant number of these messages you consider a schedule a restart of Virtel.

VIR0086E GETMAIN FAILED. MEMORY DSA DISABLED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    Virtel was unable to GETMAIN storage “above the BAR” for the DSA table.
Action
    Increase MEMLIMIT= in the JCL to provide more “above the BAR” storage. Virtel continues but you should contact support if the problem continues. Suggest a default of MEMLIMIT=2G.

VIRT0088E DSA TABLE FULL. MEMORY DIAGS. DISABLED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    The DSA memory table is full and cannot store further entries. Memory diagnostics disabled.
Action
    Virtel contines but you should contact support support. Schedule a restart of Virtel.

VIR0086E GETMAIN FAILED. MEMORY DSA DISABLED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    	Virtel was unable to GETMAIN storage “above the BAR” for the DSA table.
Action
    Increase MEMLIMIT= in the JCL to provide more “above the BAR” storage. Virtel continues but you should contact support if the problem continues. Suggest a default of MEMLIMIT=2G.

VIR0089I VIRTEL RUNNING AUTHORIZED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    Security
Meaning
    VIRTEL security. Virtel is running as an authorized task.
Action
    None. Information only.

6.10   Messages VIR009xx
========================

VIR0090E VIRSV INITIALIZATION ERROR -VSVPOPTR R15 : xxxxxxxx (dddddddd)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    VIRTEL was unable to initialize the VIRSV service environment. xxxxxxxx is the hexadecimal return code from program VSVPOPTR, and dddddddd is the decimal equivalent of the low-order byte of the return code.
Action
    Refer to the VIRSV User’s Guide manual to determine the meaning of the VSVPOPTR return code. Check the VIRTEL log and the VSVTRACE file for additional messages. Check the VIRTEL started task JCL to ensure that the VIRSV load library is referenced in both the STEPLIB and the SERVLIB concatenations. Check that the VIRSV load library is APF- authorized.

VIR0091E ERROR: VIRTEL MUST BE APF AUTHORIZED WHEN SECUR=RACROUTE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    VIRTEL cannot start because RACROUTE security was requested by the SECUR parameter of the VIRTCT, but the VIRTEL address space is not running as an APF-authorized jobstep.
Action
    Check that all of the libraries referenced by the STEPLIB, DFHRPL, and SERVLIB (if present) statements in the VIRTEL started task JCL are defined as APF-authorized libraries in the MVS system APF-list.

VIR0092E GNAMEADD FAILED FOR VTAM GENERIC RESOURCE grname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    VIRTEL was unable to identify itself to VTAM as a generic resource. grname is the generic resource name specified in the GRNAME parameter of the VIRTCT.
Action
    Check the console log for preceding message VIR0002W REQ=SETLOGON RTNCD=cc FDBK2=dd. Take action according to the return code and feedback code indicated in message VIR0002W. Commonly encountered codes are:
    - RTNCD=10 FDBK2=19 Sysplex coupling facility does not exist; CFRM policy for the required coupling facility structure was not active; VTAM is not defined as an APPN node; or VTAM has lost connectivity to the required coupling facility structure.

VIR0093I VTAM GENERIC RESOURCE NAME IS grname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    VIRTEL has successfully identified itself to VTAM as a generic resource. grname is the generic resource name specified in the GRNAME parameter of the VIRTCT.
Action
    None.

VIR0094E PRODID [DEFINE | AUTH] ERROR: RC=code
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    While attempting to identify itself to z/VSE, VIRTEL encountered an unexpected return code.
Action
    Contact technical support.

VIR0095I PRODID AUTHORIZATION SUCCESSFUL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    VIRTEL has successfully identified itself to z/VSE as a vendor product.
Action
    None.

VIR0096I VIRTEL IS USING VIRTCT 'VIRTCTnn'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    As a result of the parameter TCT=nn specified in the startup JCL, VIRTEL is using the parameter table VIRTCTnn.
Action
    None.

VIR0097E ERROR ALLOCATING MEMORY FOR termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    VIRTEL has insufficient memory to allocate a storage area for terminal termid.
Action
    Increase the VIRTEL region size or partition size.

VIR0098I VIRTEL RUNNING AS A SUBTASK. LINKED FROM mmmmmmmm
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0000
Meaning
    Indicates that VIRTEL has been attached and called by another process. The module mmmmmmm is calling routine.
Action
    None

VIR0099I applid STARTED AT dd/mm/yy hh:mm:ss , VERSION vvvv
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    Initialisation of VIRTEL version vvvv is complete. VTAM application applid is now available.
Action
    None.

6.11   Messages VIR02xxx
========================

VIR0200I, VIR0201I
^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    This message serves as an audit trail of a VIRTEL command entered at the operator console.
Action
    None.

VIR0201I VIRTEL 4.xx APPLID=applid LINES [ACT/INACT]
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    This message is displayed in response to a VIRTEL LINES command. 4.xx is the VIRTEL version number and applid is the name of the main VIRTEL application ACB.
Action
    None.

.. 
    VIR0202I INT.NAME EXT.NAME TYPE ACB OR IP VIR0202I -------- -------- ----- ---------
    VIR0202I n-xxxxxx linename type locaddr VIR0202I ---END OF LIST---

Module
    	VIR0002
Meaning
    This message is the output from a VIRTEL LINES command. For each line displayed, n-xxxxxx is the internal name of the line, linename is the external name of the line, type is the line type (GATE, FASTC, /GATE, /FASTC, /PCNE, APPCn, TCPn), and locaddr is the VTAM LU name or IP address of the line specified in the “Local ident” field of the line definition. An asterisk before the line type indicates that the line is currently inactive.
Action
    None.

..  
    VIR0203I TERMINALS ASSOCIATED WITH LINE n-xxxxxx VIR0203I TERMINAL RELAY    STATUS
    VIR0203I -------- -------- --------
    VIR0203I termid +luname acbstat cvcstat tranid termstat VIR0203I ---END OF LIST---

Module
    VIR0002
Meaning
    This message is the output from a VIRTEL LINE=linename,DISPLAY command. It displays a list of terminals associated with the line. linename is the external name of the line, and n-xxxxxx is the internal name of the line. For each terminal displayed, termid is the terminal name, “+” indicates that this terminal is pointed to by the MCH 1st LU pointer, luname is the relay LU name, acbstat is the relay ACB status which can be blank (ACB closed), ACTIV (ACB open), P-RQS (VIRTEL is awaiting the response from the application for a pending session request), or ACT/S (ACB    in session). cvcstat is the CVC status which can be blank (terminal is free), SERV (terminal is occupied by a service transaction), or INUSE (terminal is occupied by a call). tranid is the external name of the transaction using the terminal. termstat is the terminal status which can be LINKED (terminal is owned by and linked to this line), NOT LK (terminal is owned by this line but not yet linked) OWNED BY m-yyyyyy (terminal prefix matches this line but terminal is owned by another line), UNOWNED (terminal prefix matches this line but terminal is not owned by any line).
Action
    None.

.. 
    VIR0204I TERMINALS IN POOL *poolname VIR0204I TERMINAL RELAY    PRINTER USED BY VIR0204I -------- -------- -------- --------
    VIR0204I termid1 luname printlu termid2 VIR0204I ---END OF LIST---

Module
    VIR0002
Meaning
    This message is appended to the output from a VIRTEL LINE=linename,DISPLAY command when one or more of the terminals attached to the line references a logical pool. It displays a list of terminals belonging to the logical pool.  poolname is the name of the logical pool. For each terminal displayed, termid1 is the name of the terminal in the logical pool, luname is the relay LU name associated with this terminal, printlu is the LU name of the associated virtual printer, and termid2 is the name of the terminal (if any) which is currently using this relay.
Action
    None.

VIR0205I NO TERMINALS ASSOCIATED WITH LINE n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    As a result of a VIRTEL LINE=linename,DISPLAY command, no terminals were found which match the prefix of the requested line.
Action
    None.

VIR0206I LINE n-xxxxxx linetype linestat acbname acbstat
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    This message is part of the output from a VIRTEL LINE=linename,DISPLAY command lines which have an associated SNA LU. It displays the status of the line. linename is the external name of the line, and n-xxxxxx is the internal  name of the line. linetype is the type of line (/GATE, /FASTC), linestat is the status of the line (STARTED or STOPPED),
    acbname is the LU name of the line, acbstat is the line LU status which can be blank (ACB closed), ACTIV (ACB open), or ACT/S (ACB in session).
Action
    None.

VIR0207I LINE n-xxxxxx linetype lineprot linestat
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    This message is part of the output from a VIRTEL LINE=linename,DISPLAY command for lines which do not have an associated SNA LU. It displays the status of the line. linename is the external name of the line, and n-xxxxxx is the internal name of the line. linetype is the type of line (GATE, FASTC, /PCNE, TCPn), lineprot is the protocol (XOT, HTTP, SMTP, PASS, PSIT, NEOX), linestat is the status of the line (STARTED or STOPPED).
Action
    None.

VIR0210E command NOT VALID FOR linetype LINE n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    The VIRTEL LINE=linename,START and STOP commands are not valid for lines of type APPCn, GATE or FASTC. This message may also occur for lines of type TCPn or XMn when the corresponding TCPn or XMn parameter is not coded in the VIRTCT.
Action
    None.

VIR0211I LINE linename TRACE ACTIVE VIR0211I TERM termid TRACE ACTIVE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    In response to a TRACE,DISPLAY command, VIRTEL displays a list of lines and terminals for which tracing is active.
Action
    Use the NOTRACE command to deactivate tracing if desired.

VIR0212I LINE linename TRACE INACTIVATED VIR0212I TERM termid TRACE INACTIVATED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    In response to a NOTRACE,ALL command, VIRTEL displays a list of lines and terminals for which tracing has been deactivated.
Action
    None.

VIR0213I NO ACTIVE TRACES
^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    A NOTRACE,ALL command was entered, but no traces were active.
Action
    None.

.. 
    VIR0214I ACTIVE RELAY ACBS FOR VIRTEL 4.xx APPLID=applid VIR0214I TERMINAL RELAY    APPLID  CLIENT
    VIR0214I -------- -------- -------- ---------------
    VIR0214I termid luname  applname n.n.n.n VIR0214I ---END OF LIST---

Module
    VIR0002
Meaning
    This message is displayed in response to a VIRTEL RELAYS command. 4.xx is the VIRTEL version number and applid is the name of the main VIRTEL application ACB. For each terminal displayed, termid is the name of the terminal in the logical pool, luname is the relay LU name associated with this terminal, applname is the name of the host application to which the relay LU is connected, and n.n.n.n is the IP address of the client workstation (if any).
Action
    None.

VIR0215I NO ACTIVE RELAY ACBS FOR VIRTEL 4.xx APPLID=applid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    This message is displayed in response to a VIRTEL RELAYS command when VIRTEL has no VTAM ACB open except for the main VIRTEL application ACB applid.
Action
    None.

VIR0220I termid SCENARIO STOP REQUESTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    A KILL command was entered for terminal termid.
Action
    None.

VIR0260W SERVICE servname IS A NEW COPY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0002
Meaning
    A VIRSV,NEW command for service servname has successfully stopped the service.
Action
    None.

VIR0261W SERVICE servname NOT IN MEMORY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0002
Meaning
    A VIRSV,NEW command did not complete because the service servname was not started.
Action
    None. The service will be started by VIRTEL when required.

VIR0262W SNAPMSG TRIGGERED - VIRTEL ABENDED | SNAP TAKEN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0002
Meaning
    A message has been trapped by the SNAPMSG function. Action taken will be either a SNAP dump or an ABEND of Virtel.
Action
    Determined by TCT parameters or the action set in the SNAPMSG= command.

VIR0270I DISPLAY 938 VIRTEL TCT=VIRTCTRJ:
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
.. 
    SILENCE=N,MEMORY=(A,N),BFVSAM=08192,BUFDATA=016,BUFSIZE=20000,
    STR=03 COUNTRY=FR,GMT=XXXXX,DEFUTF8=IBM1147 ,LANG= ,MAXSOCK=00250,
    VSAMTYP=N APPLID=SPVIRRI ,SMF=X,PASSTCK=N,VIRSECU=Y,SWA=N,NBTERM=0500,
    NTASK=04 MEMORY=(SYS(0001868K,0001868K),DATA(0011712K,0011712K)),LOG=CONSOLE

Module
    VIR0002
Meaning
    A TCT command has been issued to display the content of some of the VIRTCT parameters. This message shows the parameter details.
Action
    None.

VIR0280I END
^^^^^^^^^^^^
Module
    VIR0002
Meaning
    This marks the end of a VIR0270I message.
Action
    None.

6.12   Messages VIR05xxx
========================

VIR0504I ACQUIRING TERMINAL luname(relayname) TO LINK n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    VIRTEL is entering into session with terminal luname.
Action
    None.

VIR0505I  LINKING TERMINAL termid TO n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    VIRTEL has linked terminal termid to the line whose internal name is n-xxxxxx. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIR0506E ERROR LINKING TERMINAL termid TO n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    VIRTEL was unable to link terminal termid to the line whose internal name is n-xxxxxx.
Action
    Check the terminal definition in VIRTEL and in VTAM.

VIR0507I LINKING TERMINAL termid TO n-xxxxxx RELAY relayname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    	
Module
    VIR0005
Meaning
    VIRTEL linked terminal termid to the line whose internal name is n-xxxxxx. The associated relay is relayname (if specified). This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIR0508E ERROR: NO AVAILABLE PSEUDO TERMINALS WERE FOUND FOR LINE : n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    	
Module
    VIR0005
Meaning
    VIRTEL could not activate the line whose internal name is n-xxxxxx because there were no associated terminals defined, or the terminals were owned by another line or belonged to a pool.
Action
    Check the definition of line n-xxxxxx. Use the VIRTEL console command LINE=n-xxxxxx,DISPLAY to display the associated terminals. Check that terminals are defined whose name starts with the prefix specified in the line definitions, and that these terminals do not belong to another line or to a pool.

VIR0509E termid SERVER servname HAS MISSING OR INVALID DIALNO xxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  	
Module
    VIR0005
Meaning
    A call to server servname from terminal termid failed because the called number is blank or non-numeric.
Action
    Check the definition of external server servname. Check that the “Number” field is valid (see “External Servers” in the VIRTEL Connectivity Reference manual). If the value of the “Number” field is blank or “=”, check the called number supplied by the application (CFT, Inter.PEL, STI) which initiated the call. In the case of a VIRKIX application, check that the entry point has a “Mirror” transaction as the first transaction.

VIR0526W termid IS DISCONNECTED DUE TO TIME-OUT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    The terminal termid was disconnected because it exceeded the inactivity delay.
Action
    None.

VIR0527E termid CALLER x25callernumber REJECTED AT ENTRY POINT epname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    An incoming call from X25 number x25callernumber was rejected. The required entry point epname does not exist.
Action
    Verify the call user data used in the connection. If it is acceptable, define the corresponding entry point in VIRTEL.

VIR0528I termid CALLER x25callernumber GETS ENTRY POINT 'epname' FROM RULE 'rulename'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    VIRTEL allocated entry point epname to an incoming call from X25 number x25callernumber using rule rulename. termid is the name of the VIRTEL terminal which represents the virtual circuit.
Action
    None.

VIR0529E termid REJECTING CONFLICTING IN AND OUT CALLS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0005
Meaning
    After VIRTEL sent an outgoing call packet on terminal termid, an incoming call arrived on the same virtual circuit.
Action
    VIRTEL refuses the incoming call. VIRTEL considers the outgoing call as refused.

VIR0530E termid FAILED CALL TO 'servname' THRU LINE n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0005
Meaning
    An incoming call on terminal termid was unable to be rerouted to the line whose internal name is n-xxxxxx. Either the line does not exist, or it is not started, or it is not connected to its partner application, or line n-xxxxxx is configured to disallow outgoing calls.
Action
    Display the definition of the external server servname, and check that the line name is correctly specified. Check that the line is in session with the CTCP or partner application. Check the definition of line n-xxxxxx and ensure that the “Possible calls” field is set to 2 or 3.

VIR0531E termid NO OUTPUT TERMINAL AVAILABLE ON LINE n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    An incoming call on terminal termid could not be rerouted to the line whose internal name is n-xxxxxx because there were insufficient virtual circuits available.
Action
    Display the definition of line n-xxxxxx and press F4. Increase the number of terminals where the “I/O” (“Possible calls”) field is set to 2 or 3.

VIR0532E termid OUTPUT CALL REFUSED BY EXIT5
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    An incoming call on terminal termid was unable to be rerouted to the output line because Exit 5 disallowed the outgoing call.
Action
    None.

VIR0533E termid CALL IN PROGRESS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    An incoming call on terminal termid was unable to be rerouted to the output line because another call was in progress on the same terminal.
Action
    Retry the call later.

VIR0534E termid EXTERNAL SERVER servname SPECIFIES NON-EXISTENT LINE n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    An incoming call on terminal termid was unable to be rerouted because the output line n-xxxxxx specified in external server servname does not exist.
Action
    Display the definition of the external server servname, and check that the line name is correctly specified.

VIR0535E termid LINE n-xxxxxx(linename) DOES NOT PERMIT CALLS TO SERVER
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    An incoming call on terminal termid was unable to be rerouted to the line whose internal name is n-xxxxxx and whose external name is linename. Line n-xxxxxx is configured to disallow outgoing calls.
Action
    Check the definition of line n-xxxxxx and ensure that the “Possible calls” field is set to 2 or 3.

VIR0536E termid LINE n-xxxxxx(linename) IS NOT STARTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    An incoming call on terminal termid was unable to be rerouted to the line whose internal name is n-xxxxxx and whose external name is linename. The line is not started or it is not connected to its partner application.
Action
    Check that the line is started and in session with the CTCP or partner application.

VIR0537E termid LINE n-xxxxxx(linename) HAS NO TERMINALS LINKED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    An incoming call on terminal termid was unable to be rerouted to the line whose internal name is n-xxxxxx and whose external name is linename. The line has no terminals linked.
Action
    Enter the VIRTEL command L=linename,D at the console to determine if the line has terminals and why they are   not linked. Check the definition of line n-xxxxxx and ensure that the appropriate terminals are defined and do not duplicate those of another line.

VIR0538I termid GETS ENTRY POINT 'epname' FROM RULE 'rulename'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    VIRTEL allocated entry point epname to an outgoing call from a GATE or PCNE application. termid is the name of the VIRTEL terminal which represents the virtual circuit.
Action
    None.

VIR0539I termid CALLER x25callernumber GETS DEFAULT ENTRY POINT FOR LINE n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    An incoming call from X25 number x25callernumber did not match any of the rules attached to the line whose internal name is n-xxxxxx. termid is the name of the VIRTEL terminal which represents the virtual circuit.
Action
    VIRTEL uses the default entry point associated with line n-xxxxxx.

VIR0540I termid GETS DEFAULT ENTRY POINT FOR LINE linename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0005
Meaning
    An outgoing call from a GATE or PCNE application did not match any of the rules attached to the line whose external name is linename. termid is the name of the VIRTEL terminal which represents the virtual circuit.
Action
    VIRTEL uses the default entry point associated with line linename.

VIR0541I termid OUTBOUND GATE|FAST CALL FROM ctcpappl VIA mchlu TO x25callednumber
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0005
Meaning
    The CTCP application ctcpappl sent an outgoing call in GATE or Fast Connect mode via MCH mchlu to the X25 number x25callednumber. termid is the name of the VIRTEL terminal which represents the virtual circuit.
Action
    None.

VIR0542I termid OUTBOUND PCNE CALL FROM pcneappl VIA pcnelu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    The PCNE application pcneappl sent an outgoing call via LU pcnelu. The X25 called number will be determined by VIRTEL using the external server definition pcnelu. termid is the name of the VIRTEL terminal which represents the virtual circuit.
Action
    None.

VIR0545I termid CALL CLEARED BY VIRTEL CAUSE=xx DIAG=yy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    VIRTEL terminated the call on terminal termid. xx and yy are the cause and diagnostic codes generated by VIRTEL. The following codes are possible:
    - Cause=00 Diag=02 : No terminals available on output line
    - Cause=0D Diag=40 : Call could not be routed to output line
    - Cause=xx Diag=yy : Error sending to local PCNE or GATE application (xx,yy = VTAM RTNCD/FDBK codes)
    - Cause=EE Diag=EE : Call refused, no master (QLLC 3174 emulation)
Action
    For Cause=00, Diag=02: Check the definition of the line. For other codes, examine preceding error messages to determine the cause.

VIR0550I ROUTAGE REJECTED FOR LUNAME luname CAUSE=xx DIAGNOSTIC=dd
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    TELETEL re-routing was refused by the TELETEL PAD for terminal luname.
Action
    Refer to the SAPONET documentation for the values of the codes xx and dd also check that your TELETEL subscription supports re-rerouting .

VIR0551I termid CONNECTED TO EXTERNAL SERVICE ssssssss
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    The terminal termid is connected to the external server sssssss via a logical channel used in fast connect mode.
Action
    None.

VIR0552I termid DISCONNECTED AFTER nn MINUTES
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    The terminal termid used in Fast-Connect mode was disconnected after nn minutes of connetion time.
Action
    None.

VIR0553I RESET REQUEST RECEIVED FROM luname CAUSE=xx DIAGNOSTIC=dd
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    A re-initialisation request was received by the PAD for the terminal luname.
Action
    Refer to the SAPONET documentation to determine the cause and diagnostic.

VIR0554I pseudo-terminal LINKED TO service THRU terminal
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0005
Meaning
    Initialisation of service indicated on the pseudo terminal indicated via the terminal indicated.
Action
    None.

VIR0555E INVALID RULE rulename ENTRY POINT 'epname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0005
Meaning
    Rule rulename used by an X25 line specifies a non-existent entry point epname.
Action
    Check the entry point name specified in the rule definition.

6.13   Messages VIR06xxx
========================

VIR0601I VIRSTATx status DSN=dsname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0006
Meaning
    This message displays the status of a VIRSTATx file in response to a STAT,D command. The status can be:
    
    - *** IN USE *** : VIRTEL is currently recording statistics to this file
    - AVAILABLE : This file is available for use
    - OFFLOAD REQUIRED : This file contains statistical data and cannot be reused until the data has been offloaded using the STATCOPY batch job
    - NOT AVAILABLE : This file cannot be allocated

Action
    None.

VIR0603I VIRSTATx OFFLOAD REQUIRED DSN=dsname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0006
Meaning
    VIRTEL has determined that the VIRSTATx file is full.
Action
    Run the STATCOPY batch job to empty the file. This message is designed to be trapped by an automated operator.

VIR0604I VIRSTAT NOW RECORDING ON VIRSTATx DSN=dsname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0006
Meaning
    VIRTEL has started recording statistics on the VIRSTATx file.
Action
    None.

VIR0605E NO AVAILABLE VIRSTAT FILES -VIRTEL TERMINATING
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0006
Meaning
    All of the VIRSTATx files are full or unavailable, and the VIRTCT specifies STATS=(MULTI,TERMINATE).
Action
    VIRTEL terminates.

VIR0606I VIRSTAT RECORDING SUSPENDED - RUN OFFLOAD AND ISSUE F virtelstc,STAT,I
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0006
Meaning
    All of the VIRSTATx files are full or unavailable, and the VIRTCT specifies STATS=(MULTI,CONTINUE).
Action
    VIRTEL continues processing, but statistics will no longer be recorded. To restart statistics recording, use the VIRTEL STAT,I command.

VIR0607E VIRSTATx ALLOC ERR=errc-infc DSN=dsname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0006
Meaning
    VIRTEL cannot allocate the VIRSTATx file. errc is the error code, and infc is the info code from dynamic allocation.  For the meaning of these codes, see OS/390 MVS Programming: Authorized Assembler Services Guide under the heading Interpreting DYNALLOC Return Codes. Commonly encountered codes are: 0210-0000 File in use by another job; 0218-0000 DASD volume not mounted; 1708-0002 File not cataloged.
Action
    VIRTEL uses the next VIRSTATx file.

VIR0608E VIRSTATx DEALC ERR=errc-infc DSN=dsname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0006
Meaning
    An error occurred during deallocation of the VIRSTATx file. errc is the error code, and infc is the info code from dynamic allocation.
Action
    See OS/390 MVS Programming: Authorized Assembler Services Guide under the heading Interpreting DYNALLOC Return Codes.

VIR0609E VIRSTATx synadaf DSN=dsname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0006
Meaning
    An error occurred when VIRTEL attempted to write to the VIRSTATx file. synadaf is the message generated by MVS.
Action
    Check the DCB attributes of the file.

VIR0610E VIRSTATx OPEN/CLOSE/GET/WRITE ABEND=ccc-rc DSN=dsname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
   	VIR0006
Meaning
    An error occurred when VIRTEL attempted to access the VIRSTATx file. ccc is the system completion code, and rc is the return code. For the meaning of these codes, refer to the OS/390 MVS System Codes manual under the heading System Completion Codes. The most commonly encountered codes are B37 or D37, which indicate that the file is full.
Action
    VIRTEL switches automatically to the next VIRSTATx file.

VIR0611I VIRSTAT NOW RECORDING TO SMF
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0006
Meaning
    VIRTEL is recording the VIRSTAT statistics to SMF.
Action
    None.

VIR0612I VIRSTAT SMFWTM FAILED.RC=rc
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0006
Meaning
    An error occurred when VIRTEL attempted to write a SMF record with the IBM SMFWTM macro. For the meaning of these codes, refer to the z/OS IBM MVS System Management Facilities Guide.
Action
    VIRTEL STATS SMF recording is disabled.

6.14   Messages VIR07xxx
======================== 

VIR0700W ERROR IN TASK taskname PSW= xxxxxxxx xxxxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0007
Meaning
    A fatal error occurred in taskname (MAIN, VSAM, STAT, LOAD) of VIRTEL. VIRTEL will shut down after printing a dump.
Action
    See message VIR0015S and VIR0016W.

6.15   Messages VIR08xxx
========================

VIR0800I VIRTEL IS USING NO SECURITY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Module
    Security
Meaning
    As a result of the SECUR=NO parameter specified in the VIRTCT at startup, VIRTEL is running without security.
Action
    None.

VIR0810I VIRTEL IS USING INTERNAL SECURITY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    Security
Meaning
    As a result of the SECUR=VIRTEL parameter specified in the VIRTCT at startup, VIRTEL is using its own internal security management.
Action
    None.

VIR0820I VIRTEL IS USING TSS SECURITY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    Security
Meaning
    As a result of the SECUR=TOPS parameter specified in the VIRTCT at startup, VIRTEL is using the TOP SECRET security system without RACROUTE.
Action
    None.

VIR0830I VIRTEL IS USING RACF SECURITY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    Security
Meaning
    As a result of the SECUR=RACF parameter specified in the VIRTCT at startup, VIRTEL is using the RACF security system without RACROUTE.
Action
    None.

VIR0840I VIRTEL IS USING RACROUTE SECURITY WITH TSS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    Security
Meaning
    As a result of the SECUR=(RACROUTE,TOPS) parameter specified in the VIRTCT at startup, VIRTEL is using the TOP SECRET security system with RACROUTE.
Action
    None.

VIR0850I VIRTEL IS USING ACF2 SECURITY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    Security
Meaning
    VIRTEL is running under VM with the SECUR=ACF2 parameter specified in the VIRTCT.
Action
    None.

VIR0860I VIRTEL IS USING RACROUTE SECURITY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    Security
Meaning
    As a result of the SECUR=RACROUTE parameter specified in the VIRTCT at startup, VIRTEL is using the RACROUTE interface to RACF, ACF2, or other compatible security sub-system.
Action
    None.

VIR0861I MIXED-CASE PASSWORD SUPPORT IS ACTIVE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    Security
Meaning
    The security manager (RACF or compatible sub-system) has indicated to VIRTEL that it supports lower-case characters in passwords. Consequently VIRTEL will pass passwords to the security manager exactly as entered by the user, without translating them to upper case.
Action
    None.

6.16   Messages VIR09xxx
========================

VIR0904I ACQUIRING TERMINAL relayname(termid)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    VIRTEL is entering into session with terminal termid associated with relay relayname.
Action
    None.

VIR0905I termid RELEASED
^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    The terminal termid is released.
Action
    None.

VIR0905W UNABLE TO ACTIVATE RELAY relayname(termid)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    The relay relayname linked to the terminal termid cannot be activated.
Action
    Check that the VTAM node containing the relay relayname has been activated, verify that the relay is not already activated for another terminal, and that the terminal is correctly defined in VIRTEL.

VIR0906I applid CONNECTING LUTYPE n PRINTER prterm(luname) TO termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    Application applname has connected printer of LU type n terminal name prterm and LU name luname to VIRTEL terminal name termid.
Action
    None.

VIR0914E termid ERROR R15=xx R0=yy CONNECTING luname TO applid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
Module
    VIR0009
Meaning
    VIRTEL could not establish a session between VIRTEL LU luname and the ACB applid of a partner application. xx and yy are the hexadecimal error codes from REQSESS.
Action
    If R15=00000020, activate the LU luname in VTAM, then enter a VIRTEL START command for the line. For any other value of R15, check that the application applid is active and ready to receive connections, and that the LU luname is in CONCT status.

VIR0915E termid(luname) SESSION REQUEST REFUSED BY applid SENSE=xxxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    VIRTEL terminal termid could not establish a session between VIRTEL LU luname and partner application applid. The application rejected the session request with sense code xxxxxxxx.
Action
    Check the message log of the partner application (for example, the CICS MSGUSR file) to determine why the application rejected the session request. Refer to the IBM SNA Formats manual to determine the meaning of the sense code. Sense code 08010000 may indicate that the CICS terminal is out of service.

VIR0918W termid RELAY relayname INACTIVATED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    VIRTEL has closed the relay relayname associated with the terminal termid.
Action
    None.

VIR0919I termid RELAY relayname ACTIVATED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    VIRTEL has opened the relay relayname associated with the terminal termid.
Action
    None.

VIR0920E RELAY relayname ALREADY ACTIVE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0009
Meaning
    The application relay relayname is already active and in session with another terminal.
Action
    Check that the same relay has not been allocated to two different terminals.

VIR0921W NO MORE RELAY AVAILABLE FOR termid POOL 'poolname' PREFIX 'prefix'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    Terminal termid attempted to connect, but there is no active relay in pool poolname, or all the relays in the pool are in use, or there is no available relay with the specified prefix. The connection is refused by VIRTEL.
Action
    Check that the VTAM node containing the relays is activated. Increase the number of relays in the pool poolname.  If the message contains a PREFIX then there is a conflict between the prefix specified in the transaction and the terminal names of the relays in the pool.

VIR0922W NBTERM IS TOO SMALL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    The number of events awaiting simultaneous processing has exceeded the estimated maximum.
Action
    VIRTEL automatically allocates additional memory and continues processing. To avoid this message, increase the value of the NBTERM parameter in the VIRTCT.

VIR0923E NO RELAY AVAILABLE FOR termid POOL 'poolname' WITH NAME 'luname’
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    Terminal termid could not allocate the LU luname required by the incoming call because pool poolname does not contain the relay luname.
Action
    Check the definitions of terminal termid and pool poolname (F2 from the configuration menu, or F5 from the sub-application system services menu). Check the definition of the rule which matched the incoming call. The relay specified in the “Parameter” field of the rule must exist in the pool.

VIR0924E termid RELAY relayname COULD NOT BE ACTIVATED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    VIRTEL could not allocate the relay LU named relayname. Either the terminal required by the transaction does not exist in the pool, or the relay is unavailable or is allocated to another line.
Action
    Check the definitions of the terminal and transaction.

VIR0925E UNABLE TO ACTIVATE luname (termid) ERROR: errcode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    VIRTEL could not open the relay luname for the terminal termid. errcode is the ACBERFLG in hexadecimal: 58=APPL already opened by another application, 5A=APPL inactive.
Action
    Check that the VTAM node containing the relay has been activated. The command D NET,ID=luname,E should show luname defined as a VTAM APPL in CONCT status.

VIR0951I termid CONNECTED TO EXTERNAL SERVICE ssssssss
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    The terminal termid is connected to external server ssssssss via a logical channel using non Fast-Connect mode.
Action
    None.

VIR0956S NO MORE OSCORE AVAILABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0009
Meaning
    VIRTEL does not have sufficient memory to load a module.
Action
    Check the OSCORE parameter of the VIRTCT.

VIR0959E termid CANNOT CONNECT : THIS IS A DEMONSTRATION SYSTEM WITH LIMITED RESOURCES
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0009
Meaning
    The terminal termid has attempted to establish a session with a VTAM application, but the limit on the number of active sessions permitted by your VIRTEL license has already been reached.
Action
    Wait until another terminal disconnects, or contact Syspertec to upgrade your license.

6.17   Messages VIR10xxx
========================

VIR1021I VIRARBO type RECORD name ADDED/UPDATED/DELETED BY USER userid AT TERMINAL termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    User userid at terminal termid has added, updated, or deleted a record in the VIRTEL configuration file. type is the record type (LINE, TERMINAL, SERVER, ...) and name is the entity name.
Action
    None.

VIR1062W ERROR ACCESSING FILE filename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    VIRTEL has detected an error accessing file filename.
Action
    Contact technical support.

VIR1063W ERROR : FILE filename NOT FOUND IN VIRTCT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
   	VIR0010
Meaning
    File filename is not defined in the VIRTCT.
Action
    Add the definition and reassemble the VIRTCT.

VIR1064E ERROR : TERMINAL termid FAILED TO SEND MAIL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    VIRTEL detected an SMTP protocol error.
Action
    Contact technical support.

VIR1065W LINE linename IS UNKNOWN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    A START or STOP command entered at the “Status of Lines” screen refers to a line unknown to VIRTEL.
Action
    Contact technical support.

VIR1066W LINE linename ALREADY ACTIVE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    A START command was entered at the “Status of Lines” screen for a line which was already started.
Action
    None.

VIR1067W LINE linename (n-xxxxxx) START / STOP REQUESTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    VIRTEL processed a START or STOP command from the “Status of Lines” screen on the line with external name linename and internal name n-xxxxxx.
Action
    None.

VIR1068E command NOT VALID FOR linetype LINE n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0010
Meaning
    START and STOP commands entered at the “Status of Lines” screen are not valid for lines of type APPCn, GATE or FASTC. This message may also be issued for lines of type TCPn or XMn if the corresponding TCPn or XMn parameter is not coded in the VIRTCT.
Action
    None.

6.18   Messages VIR11xxx
========================

VIR11D1W termid ERROR LOADING SCRIPT scriptnam IN TRANSACTION tranid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0011D
Meaning
    Transaction tranid at terminal termid called for a scenario module which could not be loaded.
Action
    Check the log for a previous message VIR0031W. Check the module name specified in the “Input Message Exit” or “Output Message Exit” field of transaction tranid. Ensure that this module exists in the VIRTEL load library and is a valid scenario module. Recompile the scenario using the current version of the VIRTEL SCRNAPI macro library.

VIR11D2W termid INVALID FA39 SCRIPT RECEIVED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0011D
Meaning
    The transaction at terminal termid called for a scenario module which was not valid.
Action
    Check the module name specified in the “Input Message Exit” or “Output Message Exit” field of the transaction. Ensure that this module contains a valid scenario of the requested type. Recompile the scenario using the current version of the VIRTEL SCRNAPI macro library.

6.19   Messages VIR15xxx
========================

VIR1501E termid REQSESS FAILED, NO RELAY DEFINED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0015
Meaning
    Terminal termid could not be connected to a VTAM application because the terminal has no relay defined.
Action
    Specify the name of a VIRTEL relay LU in the “Relay” field of the terminal definition. The relay LU must also be defined in a VTAM APPL statement.

VIR1502E termid PASSTICKET ERROR FOR applname / userid SAF RC: 'safrc' RACF RC: 'racrc' RACF REASON: 'racreas'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0015
Meaning
    VIRTEL does not have sufficient access rights to create or validate a passticket allowing user userid at terminal termid to access application applname. This message is usually preceded by message ICH408I which shows the name of the resource to which VIRTEL must be granted access.
Action
    Examine the SAF and RACF return codes and the RACF reason code to determine the cause. Check that VIRTEL has access to resource IRR.RTICKETSERV in the FACILITY class, and also to resource IRRPTAUTH.applname.userid in the PTKTDATA class. The generic resource IRRPTAUTH.** may be used to permit VIRTEL to generate passtickets for all applications.
    For an explanation of the return codes and reason codes, see z/OS Security Server RACF Callable Services chapter 2 “R_ticketserv”. Some common codes are:

VIR1551I termid(luname) CONNECTED TO "applname"
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0015
Meaning
    Terminal termid has been connected to application applname via the VIRTEL relay LU luname. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIR1552I termid DISCONNECTED AFTER nn MINUTES
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0015
Meaning
    Terminal termid has been disconnected from an application after nn minutes of connection time.
Action
    None.

6.20   Messages VIR17xxx
========================

VIR1705W UNABLE TO ACTIVATE relayname(termid)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0017
Meaning
    The relay relayname linked to terminal termid has not been activated.
Action
    Check the activation of the VTAM book containing the relay relayname, check also that the relay is not already activated for another terminal and that the relay is correctly defined in VIRTEL.

VIR1724E FILE NOT FOUND filename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0017, VIR0B17
Meaning
    The file filename cannot be accessed by VIRTEL.
Action
    Check the state of the file and its definition in VIRTEL.

VIR1725E linename: ERROR ACCESSING 'key' ON filename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0017
Meaning
    A VSAM error occurred when VIRTEL attempted to access file filename.
Action
    Check the state of the file and its definition in VIRTEL.

VIR1726E termid ERROR ADDING TO FILE 'filename'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0017
Meaning
    A VSAM error occurred when VIRTEL attempted to write to file filename.
Action
    Check the SYSLOG for preceding message IEC070I.

VIR1729E LINE linename NOT FOUND
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0B17
Meaning
    An instruction in a scenario (SEND$ TO-LINE, SEND$ VARIABLE-TO-LINE), or a tag in an HTML page, for example: {{{IP- ADDR "linename"}}}, refers to a non-existent line.
Action
    Specify a valid line name.

VIR1756S NO MORE OSCORE AVAILABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0017
Meaning
    VIRTEL cannot load a program in memory due to insufficient space.
Action
    Check the OCORE parameter of the VIRTCT.

6.21   Messages VIR19xxx
========================

VIR1952I luname DISCONNECTED AFTER nn MINUTES
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0019
Meaning
    The terminal luname has been disconnected after nn minutes of connection time.
Action
    None.

6.22   Messages VIR21xxx
========================

VIR2121E epname HAS NO TRANSACTIONS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0021B
Meaning
    Entry point epname has no transactions defined.
Action
    Define at least one transaction under entry point epname.

VIR2151E epname HAS NO TRANSACTION NAMED 'tranid'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0021E
Meaning
    An incoming X25 call specifies the name tranid in the first 8 bytes of its preconnection message, but entry point epname has no transaction of that name. The call is cleared.
Action
    Define a transaction with external name tranid under entry point epname. See the description of VIR0021E in the VIRTEL Connectivity Reference manual.

VIR2161E epname HAS NO TRANSACTION FOR LOGON DATA logonmsg
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
   	VIR0021F
Meaning
    Entry point epname has no transaction whose “Logon message” field matches the preconnection message (logonmsg) of an incoming X25 call. The call is cleared.
Action
    Under entry point epname, define a transaction whose “Logon message” field matches the start of logonmsg. Check that the contents of this field are within apostrophes. See the description of VIR0021F in the VIRTEL Connectivity Reference manual.

VIR2162E epname TRANSACTION tranid HAS INCORRECT DATA IN LOGON MESSAGE FIELD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
   	VIR0021F
Meaning
    The contents of the “Logon message” field in the definition of transaction tranid is not in the format required by program VIR0021F, which is specified as the menu program for entry point epname.
Action
    VIRTEL ignores this transaction definition. Check that the “Logon message” field contains a character string or hexadecimal string enclosed in apostrophes. See the description of VIR0021F in the VIRTEL Connectivity Reference manual.

VIR2171E epname HAS NO TRANSACTION NAMED USSMSG01
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0021G
Meaning
    Entry point epname has no transaction whose “Logon message” field matches the preconnection message of an incoming X25 call, and VIRTEL cannot send an error message to the terminal because there is no transaction with external name USSMSG01. The call is cleared.
Action
    Define a transaction with external name USSMSG01 under entry point epname. See the description of VIR0021G in the VIRTEL Connectivity Reference manual.

VIR2172E epname TRANSACTION tranid HAS INCORRECT DATA IN LOGON MESSAGE FIELD
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0021G
Meaning
    The contents of the “Logon message” field in the definition of transaction tranid is not in the format required by program VIR0021G, which is specified as the menu program for entry point epname.
Action
    VIRTEL ignores this transaction definition. Check that the “Logon message” field contains a character string or hexadecimal string enclosed in apostrophes. See the description of VIR0021G in the VIRTEL Connectivity Reference manual.

VIR21J1E epname HAS NO AVAILABLE TRANSACTION-ERROR=errcode
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0021J
Meaning
    VIRTEL did not find any available transaction in entry point epname. The error code errcode indicates the reason:

    - 1 : the entry point has no transactions
    - 2 : none of the VTAM applications referenced by the transactions of the entry point are active.

Action
    For code 1, define at least one transaction under entry point epname. For code 2, start at least one of the VTAM applications referenced by the transactions under entry point epname.

6.23   Messages VIR27xxx
========================

VIR2701W USER userid SENT 'c' TO LINE 'n-xxxxxx' FROM TERMINAL 'termid'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0027
Meaning
    User userid at terminal termid sent command c to the line whose internal name is n-xxxxxx from the “State of lines” screen.
Action
    None.

6.24   Messages VIR31xxx
========================

VIR3101W WARNING: LECAM SERVER servname MODIFIED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0031
Meaning
    This message indicate that the definition of external server servname has been modified. The server specifies LECAM emulation.
Action
    Following this type of modification, any previous “service proposition” from a LECAM PC is no longer available for use by new clients. A new “service proposition” must be generated by restarting the LECAM service application on the PC.

6.25   Messages VIR35xxx
========================

VIR3551I termid CONNECTING AS PERSONAL COMPUTER "xxxxxxxx"
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0035
Meaning
    Terminal termid running VIRTEL/PC has connected to VIRTEL. The PC identification is xxxxxxxx.
Action
    None.

VIR3552I termid DISCONNECTED AFTER nn MINUTES
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0035
Meaning
    Terminal termid has disconnected after nn minutes of connection.
Action
    None.

VIR3553I termid IDENTIFICATION ERROR FOR PERSONAL COMPUTER "xxxxxxxx"
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0035
Meaning
    The terminal connected to VIRTELPC will be disconnected at the data processing center. The entry point used requires identification of the PC. This PC has not been defined at the host site.
Action
    Check the definition of the PC copy at the host site. If it exists purge the associated sign-on.

VIR3554I Input call
^^^^^^^^^^^^^^^^^^^
Module
    VIR0035
Meaning
    A request for asynchronous connection is being processed.
Action
    None.

2.26   Messages VIR39xxx
========================

VIR3952I luname DISCONNECTED AFTER nn MINUTES
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0039
Meaning
    The terminal luname has disconnected after having been connected for nn minutes.
Action
    None.

6.27   Messages VIR60xxx
======================== 

VIR6017I FORCIBLY DETACHING VIRTEL
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR6000
Meaning
    After the VIRSV subtask terminates, VIR6000 waits up to 5 seconds, and then detaches the VIRTEL subtask if it has not already terminated by itself.
Action
    None.

6.28   Messages VIR62xxx
========================

VIR6202W LU 6.2 SESSION STARTED WITH applname (luname)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
  	VIR0062
Meaning
    An LU 6.2 session has been opened between VIRTEL LU luname and partner application applname.
Action
    None.

VIR6203W LU 6.2 SESSION STARTED WITH applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0062
Meaning
    LU 6.2 CNOS negotiation with partner LU applname was successful.
Action
    None.

VIR6204W LU 6.2 SESSION REQUESTED BY UNDEFINED pseudolu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0062
Meaning
    A request for an LU 6.2 session has been issued intended for a pseudo terminal pseudolu that is not under the control of VIRTEL.
Action
    Check the parameters associated with the request.

VIR6205W UNABLE TO ACTIVATE luname (n-xxxxxx) ERROR: xx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Module
    VIR0062
Meaning
    LU luname associated with the line whose internal name is n-xxxxxx could not be activated. xx is the ACB error code (see the IBM VTAM Programming manual)
Action
    Check that the VTAM node containing LU luname has been activated, check that the LU is not already in use on another line, and that the line is correctly defined in VIRTEL.

VIR6206W LU 6.2 SESSION RESET FOR LU applname (luname)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0062
Meaning
    An LU 6.2 session has been reinitialised between VIRTEL LU luname and partner application applname.
Action
    None.

VIR6208W LU 6.2 CONVERSATION (luname – applname) STARTING ON n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0062
Meaning
    A conversation has begun between VIRTEL LU luname and a partner application applname on the line with internal name n-xxxxxx.
Action
    None.

VIR6210W LU 6.2 CONVERSATION REQUESTED BY UNDEFINED pseudolu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0062
Meaning
    An LU 6.2 request was sent intended for a pseudo terminal pseudolu not under the control of VIRTEL.
Action
    Check the parameters associated with the request.

VIR6212W CONVERSATION cccccccc STARTED  ON n-xxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0062
Meaning
    The conversation number cccccccc has begun on the line with internal name n-xxxxxx.
Action
    None.

VIR6216W luname(applname) INACTIVATED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0062
Meaning
    The LU6.2 session between LU luname and the application applname has been deactivated.
Action
    None.

VIR6218S NO MORE OSCORE AVAILABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0062
Meaning
    VIRTEL cannot load a program in memory due to insufficient space.
Action
    Check the OSCORE parameter of the VIRTCT.

VIR6220W LU 6.2 SESSION LOST FOR LINE n-xxxxxx (luname – applname)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0062
Meaning
    The LU 6.2 session between VIRTEL LU luname and partner application applname has been lost. n-xxxxxx is the internal name of the APPC line.
Action
    None.

VIR6222E ERROR ON applname - R15-R0 : yyyy zzzz RCPRI: pri RCSEC: sec REQ: req QUAL: qual STATE: stat SENSE: sens
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0062
Meaning
    An unexpected error has occurred during dialogue in LU 6.2 mode.
Action
    Contact technical support.

VIR6223E ERROR ON applname - R15-R0 : yyyy zzzz RCPRI: pri RCSEC: sec REQ: req QUAL: qual STATE: stat SENSE: sens
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0062
Meaning
    An unexpected error has occurred during dialogue in LU 6.2 mode between application applname and VIRTEL. This message has no significance excepting if R15 = 00 (yyyy) and R0 = 0B (zzzz).
Action
    See return code RCPRI and RCSEC in the IBM VTAM Programming for LU 6.2 manual.

VIR6224W ENDING CONVERSATION cccccccc WITH applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0062
Meaning
    APPC conversation cccccccc with partner application applname has ended.
Action
    None.

6.29   Messages VIR65xxx
========================

VIR6599E linename CANNOT START -DEFINITION IS INCOMPLETE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0615
Meaning
    The line whose external name is linename contains a definition error (for example, protocol program not defined) and cannot be started.
Action
    Correct the line definition.

6.30   Messages VIR75xxx
========================

VIR7551I applname CONNECTING pseudolu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0715
Meaning
    The application applname is connected to the pseudo terminal pseudolu in LU 6.2 single session mode (APPC1).
Action
    None.

VIR7552I applname DISCONNECTING pseudolu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0715
Meaning
    The LU 6.2 application applname has disconnected from the pseudo terminal pseudolu.
Action
    None.

VIR7599I applname CONNECTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0715
Meaning
    The LU 6.2 application applname is connected to VIRTEL in single session mode (APPC1).
Action
    None.

6.31   Messages VIR85xxx
========================

VIR8551I applname CONNECTING pseudolu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0815
Meaning
    The application applname is connected to the pseudo terminal pseudolu in shared LU 6.2 mode (APPC2).
Action
    None.

VIR8552I applname DISCONNECTING pseudolu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0815
Meaning
    The LU 6.2 application applname has disconnected from the pseudo terminal pseudolu.
Action
    None.

VIR8553I applname ACCEPTED pseudolu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0815
Meaning
    The application applname has accepted the pseudo terminal pseudolu.
Action
    None.

VIR8599I applname (n-xxxxxx) CONNECTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0815
Meaning
    The LU 6.2 application applname is connected to VIRTEL in shared session mode (APPC2) on the line whose internal name is n-xxxxxx.
Action
    None.

6.32   Messages VIR91xxx
========================

VIR9151I applid CONNECTING LUTYPE n PRINTER prname(luname) TO termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0915I
Meaning
    While connecting a non-predefined VTAM LU, application applid connected printer LU type n with terminal name prname and LU name luname to terminal termid
Action
    Aucune.

6.33   Messages VIR99xxx
========================

VIR9901E termid: ERROR nnnnnnnn CALLING TRANSACTION tranname FROM ENTRY POINT epname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0099
Meaning
    Transaction tranname associated with the entry point epname and started by terminal luname cannot be found and shows error nnnnnnnn.
Action
    Check the definition of the entry point and transactions to ensure that the terminal has been defined.

VIR9905W LU 6.2 relayname (applname) ACTIVATED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000, VIR0062
Meaning
    The LU6.2 session between the relay relayname and the application applname has been activated.
Action
    None.

VIR9999S GETMAIN FATAL ERROR
^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0000
Meaning
    An unexpected error has occurred while requesting memory. The system will stop.
Action
    Contact technical support.

VIR9999I INVITATION A LIBERER RECUE DE termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0005
Meaning
    Terminal termname has sent a REQUEST FREE command and will be force disconnected.
Action
    None.

6.34   Messages VIRB1xxx
========================

VIRB171I LINE linename (n-xxxxxx) IS WAITING FOR m-yyyyyy ACTIVATION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B17
Meaning
    Initialisation of the line with external name linename and internal name n-xxxxxx is waiting for line m-yyyyyy to start, because WAIT-LINE(m-yyyyyy) was specified in the “Startup prerequisite” field in the definition of line n-xxxxxx.
Action
    Activate line m-yyyyyy, or wait until VIRTEL activates it.

VIRB172I LINE linename (n-xxxxxx) FAILED TO PROCESS: condition
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B17
Meaning
    There is an invalid value condition in the “Startup prerequisite” field in the definition of the line whose external name is linename and whose internal name is n-xxxxxx, or condition refers to an unknown line name.
Action
    Correct the definition of line n-xxxxxx.

VIRB173I LINE linename (n-xxxxxx) STARTUP IS NOT AUTOMATIC
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0B17
Meaning
    Initialisation of the line whose external name is linename and whose internal name is n-xxxxxx is waiting for a START command, because WAIT-COMMAND is specified in the “Startup prerequisite” field in the definition of the line.
Action
    To activate the line, enter the VIRTEL command LINE=n-xxxxxx,START at the system console.

VIRB174I LINE linename (n-xxxxxx) STARTUP IS PASSIVE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B17
Meaning
    Initialisation of the line whose external name is linename and whose internal name is n-xxxxxx is waiting for a VTAM BIND from its partner LU, because WAIT-PARTNER is specified in the “Startup prerequisite” field in the definition of the line.
Action
    To activate the line, start the partner application.

VIRB176I LINE linename (n-xxxxxx), RESTARTED BY m-yyyyyy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B17
Meaning
    Following activation of line m-yyyyyy, VIRTEL has begun initialisation of the line whose external name is linename and whose internal name is n-xxxxxx.
Action
    None.

VIRB177I LINE linename (n-xxxxxx) IS WAITING FOR m-yyyyyy ACTIVATION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B17
Meaning
    Initialisation of the line whose external name is linename and whose internal name is n-xxxxxx is waiting for line m- yyyyyy to start, because MIMIC-LINE(m-yyyyyy) is specified in the “Startup prerequisite” field in the definition of line n-xxxxxx.
Action
    Activate line m-yyyyyy, or wait until VIRTEL activates it.

VIRB178I LINE linename (n-xxxxxx), STOPPED BY m-yyyyyy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B17
Meaning
    Following the deactivation of line m-yyyyyy, VIRTEL has stopped the line whose external name is linename and whose internal name is n-xxxxxx, because MIMIC-LINE(m-yyyyyy) is specified in the “Startup prerequisite” field in the definition of line n-xxxxxx.
Action
    None.

VIRB179E ERROR ON: luname ALLOCATING 64 BITS STORAGE - RETCODE: xxxxxxxx - REASON CODE: xxxxxxxx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B17
Meaning
    An memory allocation attempt failed while trying to store a VIRTEL variable above 'above the BAR' (ie in 64 bits storage). The hexadecimal return code and reason code could be researched in the DC2 code in the IBM “z/OS   MVS System Codes” manual or possibly in the IBM IARV64 service documentation in the “MVS Assembler Services Reference” manual. Virtel currently limits the maximum size of a Virtel variable to 2 gigabytes. The maximum amount of 64-bit private virtual memory available to the Virtel address space can be controles by the MEMLIMIT JCL parameter.
Action
    Use an appropriate value in the MEMLIMIT JCL parameter.

6.35   Messages VIRB4xxx
========================

VIRB411E termid UPLOAD FAILED FOR USER userid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0041B
Meaning
    Upload of an HTML page has failed. The page was received from user userid on terminal termid.
Action
    See message sent by VIRTEL to the user.

6.36   Messages VIRB9xxx
========================

VIRB903W LINE x-nnnnnn TAKES INPUT FROM: indd AND OUTPUTS TO: outdd
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B09
Meaning
    The batch line with internal name x-nnnnnn has started. The input data for this line will be taken from ddname indd and the output data will be written to ddname outdd.
Action
    None.

VIRB904W linename PROCESSING .GET|.POST|.RAW|.END|.EOJ COMMAND
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0B09
Meaning
    The batch line with external name linename is processing the indicated command. This message is not displayed if SILENCE=YES is specified in the VIRTCT.
Action
    None.

VIRB906W LINE x-nnnnnn CLOSING indd AND outdd
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B09
Meaning
    The batch line with internal name x-nnnnnn is terminating. The input ddname indd and the output ddname outdd are being closed.
Action
    None.

VIRB907W linename ENDING WITH RETURN CODE xxxxxxxx (dddddddd)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B09
Meaning
    The batch line with external name linename is terminating. xxxxxxxx is the hexadecimal return code of the batch job step, and dddddddd is the return code in decimal.
Action
    None.

VIRB908E x-nnnnnn INVALID COMMAND 'xxxx' REPLACED BY '.EOJ'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B09
Meaning
    The batch line with internal name x-nnnnnn has encountered an unknown command xxxx in its input data file. The command is processed as if it were an end of job command, and the batch job terminates with return code 16.
Action
    Check the input data for the batch line.

VIRB909E x-nnnnnn OPEN ERROR, EOJ REQUESTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B09
Meaning
    The batch line with internal name x-nnnnnn was unable to open its input or output file. The batch job terminates with return code 16.
Action
    Check the console log for error messages. Check that the job contains DD statements for the input and output files associated with this batch line.

VIRB912W termid OBJECT nnnnnnnn STARTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B09
Meaning
    Terminal termid associated with a batch line has begun processing.
Action
    None.

VIRB922W termid ENDING OBJECT nnnnnnnn
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B09
Meaning
    Terminal termid associated with a batch line has finished processing.
Action
    None.

VIRB923E termid REQ|PARAM xxxx COMPLETION CODE code REASON CODE xxxxxxxx (dddddddd) LINE linename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B09
Meaning
    A batch request has terminated abnormally. linename is the external name of the batch line, termid is the associated terminal name, type is the type of request, code is the abend code, xxxxxxxx is the reason code in hexadecimal and dddddddd is the decimal equivalent.
Action
    Inspect the console log for other error messages which may explain the cause. Contact technical support.

VIRB924E termid OBJECT|PARAM nnnnnnnn REQ type COMPLETION CODE code REASON CODE xxxxxxxx (dddddddd) LINE linename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0B09
Meaning
    An error or unexpected end of file was detected while reading the input file for a batch line. linename is the external name of the batch line, termid is the associated terminal name, type is the type of request, code is the abend code, xxxxxxxx is the reason code in hexadecimal and dddddddd is the decimal equivalent.
Action
    Check that the input file is correct.

6.37   Messages VIRC1xxx
========================

VIRC121E PAGE NOT FOUND FOR termid ENTRY POINT 'epname' DIRECTORY 'tranid'(dirname dirkey) PAGE 'filename' URL'url'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0C12
Meaning
    HTML page filename requested by terminal termid does not exist in the directory dirname specified by the transaction whose external name is tranid linked to entry point epname. The directory key is dirkey. VIRTEL sent a 404 NOT FOUND reply to the terminal.
Action
    Check that the browser requested the correct page. Upload the page into the directory dirname.

VIRC122E ERROR termid IS SENDING A SCENARIO PF KEY BUT SCENARIO IS MISSING IN TRANSACTION 'tranid' ENTRY POINT 'epname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0C12
Meaning
    Terminal termid sent an HTTP request containing a PF=SCENARIO parameter (see “Function key management” in  the VIRTEL Web Access Guide) but the transaction whose external name is tranid does not have an input scenario specified.
Action
    Add the name of an input scenario to the transaction tranid defined under entry point epname.

6.38   Messages VIRC4xxx
========================

VIRC411E termid UPLOAD FAILED FOR USER userid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0041C
Meaning
    Upload of an HTML page has failed. The page was received from user userid on terminal termid.
Action
    See message sent by VIRTEL to the user.

6.39   Messages VIRCAxxx
======================== 

VIRCA01W CRYn INITIALISING CRYPTOGRAPHY WITH PARAMETERS: ’name1’,’algs’,’algp’,’engine’,’encoding’,’chaining’,’padding’
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CA0
Meaning
    VIRTEL is initializing the cryptographic engine specified by the CRYPTn parameter of the VIRTCT. Refer to the VIRTEL Installation Guide for the meaning of the parameters.
Action
    None.

VIRCA02W CRYn termid REQUEST FOR PUBLIC KEY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CA0
Meaning
    An HTML page delivered to terminal termid has requested VIRTEL to generate a public key using the method specified by the CRYPTn parameter of the VIRTCT.
Action
    None.

VIRCA03W CRYn termid DECRYPTING SESSION KEY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CA0
Meaning
    VIRTEL has received an encrypted session key from the terminal termid and is decrypting the key according to the method specified by the CRYPTn parameter of the VIRTCT.
Action
    None.

VIRCA04W CRYn termid ENCRYPTING A MESSAGE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CA0
Meaning
    A message to be sent to terminal termid is being encrypted according to the method specified by the CRYPTn parameter of the VIRTCT.
Action
    None.

VIRCA04W CRYn termid DECRYPTING A MESSAGE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0CA0
Meaning
    A message received from terminal termid is being decrypted according to the method specified by the CRYPTn parameter of the VIRTCT.
Action
    None.

VIRCA11W CRYn INITIALISING CRYPTOGRAPHY WITH PARAMETERS: ’name1’,’algs’,’algp’,’engine’,’encoding’,’chaining’,’padding’
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CA1
Meaning
    VIRTEL is initializing the cryptographic engine specified by the CRYPTn parameter of the VIRTCT. Refer to the VIRTEL Installation Guide for the meaning of the parameters.
Action
    None.

VIRCA12W termid CRYn REQUEST FOR PUBLIC KEY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CA1
Meaning
    An HTML page delivered to terminal termid has requested VIRTEL to generate a public key using the method specified by the CRYPTn parameter of the VIRTCT.
Action
    None.

VIRCA13W termid CRYn DECRYPTING SESSION KEY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CA1
Meaning
    VIRTEL has received an encrypted session key from the terminal termid and is decrypting the key according to the method specified by the CRYPTn parameter of the VIRTCT.
Action
    None.

VIRCA17E termid CRYn **Error** servname retc=xxxx reas=yyyy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    	VIR0CA1
Meaning
    A call to an ICSF cryptographic service servname failed with return code xxxx and reason code yyyy. The return code and reason code are shown in hexadecimal.
Action
    Refer to SA22-7522 z/OS Cryptographic Services ICSF Application Programmer's Guide Appendix A for the meaning of ICSF return codes and reason codes. Return code 0000000C means that ICSF services are not available, usually because the CSF started task is not correctly initialized.

VIRCA18E termid keylen=nnnn fieldlen=nnnn
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CA1
Meaning
    This message is issued in conjunction with message VIRCA17E. It indicates length of the symmetric key and the length of the field being encrypted or decrypted when the error occurred.
Action
    Refer to preceding message VIRCA17E.

6.40   Messages VIRCFxxx
========================

VIRCF27E SYNTAX ERROR IN EXEC PARAMETER INVALID EXEC PARAMETER - RC = 16
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRCONF
Meaning
    One of the value specified in the PARM parameter of the EXEC card is invalid. Valid values are: LOAD, UNLOAD, SCAN or LANG=
Action
    Correct the parameter.

VIRCF28E NOT AUTHORIZED TO UNLOAD PLAINTXT SECURITY (eg RACF) ERROR - RC = 12
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRCONF
Meaning
    The user code assign to the job is not authorized to access the ARBO file according to the operation specified in the PARM parameter.
Action
    Contact security department to obtain sufficient permissions to perform the desired operation.

VIRCF47E OPEN FAILED FOR SYSPUNCH DDNAME SYSPUNCH OPEN ERROR - RC = 16
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIRCONF
Meaning
    Open failed on the SYSPUNCH entry.
Action
    Check the SYSPUNCH specification.

VIRCF48E OPEN FAILED FOR SYSPRINT DDNAME SYSPRINT OPEN ERROR - RC = 16
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRCONF
Meaning
    Open failed on the SYSPRINT entry.
Action
    Check the SYSPRINT specification.

VIRCF50E OPEN FAILED FOR SYSIN DDNAME SYSPIN OPEN ERROR - RC = 16
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRCONF
Meaning
    Open failed on the SYSIN entry.
Action
    Check the SYSPIN specification.

VIRCF52E VSAM OPEN ERROR DDNAME=VIRARBO, R15=XXXXXXXX, ACBERFLG=XXXXXXXX VSAM error code opening VIRARBO - RC = 16
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRCONF
Meaning
    Unexpected VSAM error occurred during access of VIRARBO file. R15 and ACBERFLG gives the error and the reason of the error.
Action
    Verify the values of the return codes in the appropriate IBM documentation. VSAM error codes are documented in the chapter entitled VSAM Macro Return and Reason Codes in the IBM manual DFSMS Macro Instructions for Data Sets.

6.41   Messages VIRCTxxx
======================== 

VIRCT01E CRYn ERROR INSTALLING 'NO-ENCRYPTION' SUBTASK
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CT0
Meaning
    An unexpected error occurred while initializing the VIRTEL subtask for the no-encryption module specified by the CRYPTn parameter of the VIRTCT.
Action
    Contact technical support.

VIRCT02W CRYn 'NO-ENCRYPTION' SUBTASK STARTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CT0
Meaning
    Successful initialization of the VIRTEL subtask for the no-encryption module specified by the CRYPTn parameter of the VIRTCT.
Action
    None.

VIRCT03W CRYn 'NO-ENCRYPTION' SUBTASK ENDED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CT0
Meaning
    Termination of the VIRTEL subtask for the no-encryption module specified by the CRYPTn parameter of the VIRTCT.
Action
    None.

VIRCT05W CRYn 'NO-ENCRYPTION' SESSION KEY READY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CT0
Meaning
    VIRTEL has established a session key for a terminal using the no-encryption module specified by the CRYPTn parameter of the VIRTCT.
Action  
    None.

VIRCT101
^^^^^^^^

::

    VIRCT10I ICSFSTAT : FMID=fmid STATUS1=n STATUS2=n CPACF=n AES=n DSA=n RSA1=n RSA2=n RSA3=n ACC=n
    VIRCT10I ICSFST2 : VERSION=vers FMID=fmid STATUS1=n STATUS2=n STATUS3=n STATUS4=n
    VIRCT10I STATAES : NMK-STATUS=n CMK-STATUS=n OMK-STATUS=n KEYLEN=n
    VIRCT10I STATCCA : NMK-STATUS=n CMK-STATUS=n OMK-STATUS=n CCA-APP-VERS=n CCA-APP-BUILD=n USER-ROLE=n
    VIRCT10I STATCARD : ADAPTERS=n DES=n RSA=n POST=n n CP-OS=osname VERS=osver PART=partno EC=eclevel BOOT=n n
    VIRCT10I STATDIAG : BATTERY=n INTRUSION=n ERROR-LOG=n MESH=n LOW-VOLT=n HIGH-VOLT=n TEMPERATURE=n RADIATION=n
    VIRCT10I STATEXPT : CCA=n CMDF=n 56-bit-DES=n Triple-DES=n SET=n MAX- SYMMETRIC-MODULUS=nnnn
 
Module
    VIR0CT1
Meaning
    This message provides diagnostic information about the facilities provided by the underlying ICSF software and cryptographic hardware. The meaning of each of the fields is shown below. For further information, refer to CSFIQF in SA22-7522 z/OS Cryptographic Services ICSF Application Programmer’s Guide. 

ICSFSTAT
    FMID : Indicates the version of ICSF installed
    STATUS1 : 0=ICSF started, 1=ICSF initialized, 2=SYM-MK valid, 3=PKA enabled STATUS2 : 0=31-bit, 1=64-bit, 2=PKCS#11 available
    CPACF : CPACF services available: 0=None, 1=SHA-1, 2=DES/TDES, 3=SHA-224/256, 4=SHA-224/256/DES/TDES, 5=SHA-384/512, 6=SHA-384/512/DES/TDES
    AES : AES availability: 0=No, 1=Software, 2=AES-128, 3=AES-192/256 DSA : DSA availability: 0=No, 1=DSA-1024, 2=DSA-2048
    RSA1 : RSA signature key length: 0=No, 1=1024, 2=2048, 3=4096 RSA2 : RSA key management length: 0=No, 1=1024, 2=2048, 3=4096 RSA3 : RSA key generate service: 0=No, 1=2048, 2=4096
    ACC : RSA key accelerators available: 0=No, 1=Yes
ICSFST2
    VERSION : ICSFST2 version number
    FMID : Indicates the version of ICSF installed STATUS1 : PKA services: 0=Disabled, 1=Enabled STATUS2 : PKCS#11 available: 0=No, 1=Yes
    STATUS3 : ICSF status: 0=Started, 1=Initialized, 2=AES master key valid STATUS4 : Secure AES key available: 0=No, 1=Yes
    STATAES
    NMK-STATUS AES new master key : 1=Clear, 2=Partial, 3=Complete CMK-STATUS AES current master key : 1=Clear, 2=Key
    OMK-STATUS AES old master key : 1=Clear, 2=Key KEYLEN : Maximum AES key length
STATCCA
    NMK-STATUS DES new master key : 1=Clear, 2=Partial, 3=Complete CMK-STATUS DES current master key : 1=Clear, 2=Key
    OMK-STATUS DES old master key : 1=Clear, 2=Key
    CCA-APP-VERS : Version of CCA application in co-processor CCA-APP-BUILD : Build date of CCA application in co-processor USER-ROLE : Host application user’s authority role identifier
STATCARD
    ADAPTERS : Number of installed cryptographic adapters DES : DES hardware level
    RSA : RSA hardware level
    POST : Power-On Self Test version numbers
    CP-OS : Crypto co-processor operating system name VERS : Operating system version number
    PART : Crypto co-processor part number
    EC : Crypto co-processor engineering change level BOOT : Crypto co-processor miniboot version numbers
STATDIAG
    BATTERY : Battery state: 1=Good, 2=Replace INTRUSION : Intrusion latch state: 1=Cleared, 2=Set ERROR-LOG : Error log status: 1=Empty, 2=Data, 3=Full MESH : Mesh intrusion: 1=No, 2=Intrusion
    LOW-VOLT : Low-voltage detected: 1=No, 2=Yes HIGH-VOLT : High-voltage detected: 1=No, 2=Yes
    TEMPERATURE : Temperature range exceeded: 1=No, 2=Yes RADIATION : Radiation detected: 1=No, 2=Yes
    STATEXPT
    CCA : Base CCA services available: 0=No, 1=Yes CMDF : CDMF encryption available: 0=No, 1=Yes
    56-bit-DES : 56-bit DES encryption available: 0=No, 1=Yes Triple-DES : Triple DES encryption available: 0=No, 1=Yes SET : Secure Electronic Transaction available: 0=No, 1=Yes
    MAX-SYMMERTIC-MODULUS : Maximum modulus size enabled for asymmetric encryption of symmetric keys
Action
    None.

VIRCT11E CRYn ERROR INSTALLING 'ICSF' SUBTASK
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
VIR0CT1
Meaning
An unexpected error occurred while initializing the VIRTEL subtask for the ICSF interface specified by the CRYPTn parameter of the VIRTCT.
Action
Contact technical support.

VIRCT12W CRYn 'ICSF' SUBTASK STARTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CT1
Meaning
    Successful initialization of the VIRTEL subtask for the ICSF interface specified by the CRYPTn parameter of the VIRTCT.
Action
    None.

VIRCT13W CRYn 'ICSF' SUBTASK ENDED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CT1
Meaning
    Termination of the VIRTEL subtask for the ICSF interface specified by the CRYPTn parameter of the VIRTCT.
Action
    None.

VIRCT15W CRYn 'ICSF' SESSION KEY READY
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CT1
Meaning
    VIRTEL has established a session key for a terminal using the ICSF interface specified by the CRYPTn parameter of the VIRTCT.
Action
    None.

VIRCT16E CRYn **Error** servname retc=xxxx reas=yyyy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CT1
Meaning
    A call to an ICSF cryptographic service servname failed with return code xxxx and reason code yyyy. The return code and reason code are shown in hexadecimal.
Action
    Refer to SA22-7522 z/OS Cryptographic Services ICSF Application Programmer's Guide Appendix A for the meaning of ICSF return codes and reason codes. Return code 0000000C means that ICSF services are not available, usually because the CSF started task is not correctly initialized.

VIRCT17E CRYn ERROR: text
^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0CT1
Meaning
    This message is issued in conjunction with message VIRCT16E. It provides an explanation for the reason code indicated in the previous message.
Action
    Refer to preceding message VIRCT16E.

6.42   Messages VIRHTxxx
======================== 

VIRHT01I HTTP INITIALISATION FOR linename (n-xxxxxx), VERSION x.xx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    Initialisation of HTTP line with external name linename and internal name n-xxxxxx.
Action
    None.

VIRHT02I LINE linename (n-xxxxxx) HAS URL http://ipaddr:port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    The HTTP line with external name linename and internal name n-xxxxxx is ready to receive requests at the indicated URL.
Action
    None.

VIRHT04I HTTP LINE linename WAS STOPPED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    HTTP line with external name linename was stopped, either by console command, or by setting the “Possible calls” field to 0 in the line definition.
Action
    None.

VIRHT27E linename IS REJECTED AT ENTRY POINT epname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    VIRTEL received an incoming call on the HTTP line whose external name is linename, but the entry point epname specified in the line definition does not exist.
Action
    Check the HTTP line definition.


VIRHT28I linename CALLER ipaddr:port GETS ENTRY POINT 'epname' FROM RULE 'rulename'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    VIRTEL chose entry point epname for an incoming call on the HTTP line whose external name is linename, because the call matched the rule named rulename.
Action
    None.

VIRHT29E n-xxxxxx DEFAULT ENTRY POINT MISSING OR INVALID
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    An incoming call on the HTTP line whose internal name is n-xxxxxx did not match any of the rules of the line, and the default entry point specified in the line definition is either blank or does not exist.
Action
    	Either define a default rule for the HTTP line, or specify a valid default entry point in the line definition.

VIRHT51I linename CONNECTING termname TO ipaddr:port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    An incoming or outgoing HTTP call is being processed. For an incoming HTTP call, linename is the external name of the HTTP line, termname is the name of the VIRTEL terminal allocated to process the call, and ipaddr:port is the IP address and port number of the client browser. For an outgoing HTTP call, linename is the external name of the HTTP outbound line, termname is the name of the VIRTEL terminal making the call, and ipaddr:port is the IP address and port number of the remote HTTP server. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRHT52I linename DECONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    Terminal termname has been disconnected from the HTTP line whose external name is linename.
Action
    None.

VIRHT53E linename NO MORE PSEUDO FOUND WITH PREFIX xxxx FOR TRANSACTION tranname(tranid)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIRHTTP
Meaning
    VIRTEL tried to open a terminal whose name matches the prefix xxxx specified in the VIRTEL transaction with external name tranname and internal name tranid, but this prefix conflicts with the prefix specified on the definition of the HTTP line whose external name is linename.
Action
    Check the “Prefix” field of the HTTP line and the “Pseudo-terminals” field of the transaction.

VIRHT54E INVALID REQUEST ON linename ENTRY POINT 'epname' DIRECTORY 'dirname' PAGE 'filename' URL 'url' TRANSACTION 'tranid' CALLER ipaddr:port reason
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    VIRTEL received a request on the HTTP line whose external name is linename originating from the browser at IP address ipaddr:port. The browser requested HTML page filename using URL url. Either the directory path dirname does not exist, or there is no transaction named tranid under the entry point epname.
Action
    Check that the browser requested the correct URL. Check the definition of the entry point epname. If reason is “missing directory : dirname”, ensure that there is a type 4 transaction with external name dirname. If reason is “rejected transaction : tranid”, ensure that there is a type 1 transaction with external name tranid. See “VIRTEL URL formats” in the VIRTEL Web Access Guide.

VIRHT55E INVALID RULE rulename ENTRY POINT 'epname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    Rule rulename used by an HTTP line specifies a non-existent entry point epname.
Action
    Check the entry point name specified in the rule definition.

VIRHT56I n-xxxxxx CALLER real-ip WAS FORWARDED BY proxy-ip
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    An HTTP request was received from proxy-ip on the HTTP line whose internal name is n-xxxxxx. The source IP address proxy-ip appears in the “Calling DTE” field of a rule attached to the HTTP line, and the request matches the rule in all other respects. VIRTEL considers the IP address real-ip, which is specified in the “forwarding header” inserted by the proxy, to be the real originating IP address. Refer to “Calling DTE” in the “Rules” chapter of the VIRTEL Configuration Reference manual for further information.
Action
    VIRTEL henceforth treats the call as if it had been received from real-ip instead of from proxy-ip. The real-ip address will be displayed in console messages and recorded in the VIRLOG.

VIRHT57E linename RECEIVED AN ERRONEOUS REQUEST FROM ipaddr:port : LINE IS NOT SET UP FOR HTTPS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    VIRTEL received a request on the HTTP line whose external name is linename originating from the browser at IP address ipaddr:port. The browser has requested that the session should be encrypted using the SSL or TLS protocols, but encryption is not activated for this line.
Action
    Either resubmit the request without encryption (use http instead of https), or activate encryption on this line (see “Data encryption” in the “VIRTEL Web Access Security” chapter of the VIRTEL Web Access Guide.

VIRHT58E linename IS NOT AN OUTPUT LINE: CANNOT CONNECT termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^  
Module
    VIRHTTP
Meaning
    A scenario invoked by terminal termid has attempted to make an outbound HTTP request via the HTTP line whose external name is linename, but the line definition does not permit outbound calls.
Action
    Modify the definition of line linename setting the “Possible calls” field to 2 or 3.

VIRHT59E LINE linename IS NOT OPEN: CANNOT CONNECT termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    A scenario invoked by terminal termid has attempted to make an outbound HTTP request via the HTTP line whose external name is linename, but the line is stopped.
Action
    Start the line by entering the VIRTEL command: line=linename,S

VIRHT60E linename HAS NO PSEUDO TERMINALS: CANNOT CONTINUE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    No terminals are defined for the HTTP line whose external name is linename.
Action
    If this is a batch line then VIRTEL terminates; otherwise VIRTEL continues but the line cannot be used.

VIRHT61E linename A PARAMETER IS NEEDED FOR PREFIX $LINE$ FOR TRANSACTION ttttttt (xxxxx)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIRHTTP
Meaning
    The parameter &luname= and his value were not specified in the URL received by VIRTEL on line linename for transaction ttttttt.
Action
    Check the URL value if possible or run a /F stsname,snapmsg,all command at the console.

VIRHT62E
^^^^^^^^ 
Module
    VIRHTTP
Meaning
    The parameter &luname= and his value were not specified in the URL received by VIRTEL on line linename for transaction ttttttt.
Action
    Check the URL value if possible or run a /F stsname,snapmsg,all command at the console.

VIRHT63E linename ERROR STARTING PSEUDO FOR PREFIX $LINE$ FOR TRANSACTION ttttttt (xxxxx)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRHTTP
Meaning
    The VTAM terminal (relay) to use for a request is already active for another session. The request was received on line linename for transaction ttttttt.
Action
    The request cannot be satisfied. The connection is closed. Run a /F stcname,snapmsg,all command at the console.

6.43   Messages VIRI9xxx
========================

VIRI902W TERM=termid REQ=req RTNCD=rtncd FDBK2=fdbk2 SENSE=sense
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    VTAM error on terminal termid. The RPL request code is req, and the VTAM return codes are rtncd, fdbk2, sense.
Action
    Refer to the IBM VTAM Messages and Codes or Communications Server IP and SNA Codes manual for an explanation of the VTAM codes.

VIRI903I luname(termid) RECEIVED BIND FROM applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0I09
Meaning
    The relay LU luname associated with VIRTEL terminal termid has received an SNA BIND command from partner application ACB applname. This message appears only if a terminal or line trace is active for terminal termid.
Action
    None.

VIRI904I CLEANUP: linename / applid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    Loss of session with partner LU applid on the line whose external name is linename.
Action
    None.

VIRI905I luname RELEASED
^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    At the request of another application (VTAM RELREQ), VIRTEL released the LU luname.
Action
    None.

VIRI905W LU luname (n-xxxxxx) ACTIVATED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    Initialisation of LU luname associated with the line whose internal name is n-xxxxxx.
Action
    None.

VIRI906W LU luname (n-xxxxxx) INACTIVATED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    Inactivation of LU luname associated with the line whose internal name is n-xxxxxx.
Action
    None.

VIRI907I luname(termid) REJECTED BIND FROM applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    The relay LU luname associated with VIRTEL terminal termid received an unsolicited SNA BIND command from application applname. VIRTEL rejected the BIND because the LU was not expecting to receive a session request from applname. This can occur if a PCNE application is attempting to place an outgoing call to an LU reserved for incoming calls.
Action
    Check that the application has specified the correct LU name. Check that “possible calls” is not set to “2” in the VIRTEL terminal definition.

VIRI908S INVALID RPL
^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    The VTAM SYNAD / LERAD exit was entered with an invalid recovery action return code (RTNCD) in register 0. This message is followed by a dump with abend code U0009.
Action
    Contact technical support.

VIRI909E UNABLE TO ACTIVATE luname (n-xxxxxx) ERROR: xx000000
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    LU luname associated with the line whose internal name is n-xxxxxx could not be activated. xx represents the ACB error code:
    - 58 : ACB already active by another application
    - 5A : ACB inactive under VTAM

For the meaning of other codes, see the IBM VTAM Programming manual.

Action
    Check that the VTAM node containing LU luname has been activated, check if the LU is not already active on another line, and that the line is correctly defined in VIRTEL.

VIRI910I luname(termid) RECEIVED UNBIND FROM applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    The relay LU luname associated with VIRTEL terminal termid has received an SNA UNBIND command from application ACB applname. This message appears only if a terminal or line trace is active for terminal termid.
Action
    None.

VIRI911I luname(termid) REQUESTING SESSION WITH applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    The VIRTEL terminal termid has requested VTAM to establish a session between its associated relay LU luname and the application ACB applname. This message appears only if a terminal or line trace is active for terminal termid.
Action
    None.

VIRI913W VTAM SHORT ON STORAGE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    The VTAM action code supplied to the SYNAD exit indicates that there is insufficient memory to process the operation.
Action
    VIRTEL retries the operation after 1 second.

VIRI914E termid ERROR R15=xx R0=yy CONNECTING luname TO applid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    VIRTEL could not establish a session between VIRTEL LU luname and the ACB applid of a partner application. xx et yy are the hexadecimal error codes from REQSESS.
Action
    If R15=00000020, activate the LU luname in VTAM, then enter a VIRTEL START command for the line. For any other value of R15, check that the application applid is active and ready to receive connections, and that the LU luname is in CONCT status.

VIRI915E termid ERROR ACTIVATING luname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    VIRTEL could not establish a session between VIRTEL LU luname and the ACB of its partner application.
Action
    Refer to the SYSLOG. This message is normally accompanied by VTAM message IST663I which gives more information about the cause of the error.

VIRI918W RELAY luname(termid) INACTIVATED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^    
Module
    VIR0I09
Meaning
    VIRTEL closed the relay luname for terminal termid following inactivation of the LU by VTAM.
Action
    Further connections using this relay will only be possible after the LU has been reactivated under VTAM, and a VIRTEL START command has been issued for the associated line, either from the “Status of lines” screen (F9 from the configuration menu, or F10 from the sub-applications system services menu), or by the console command LINE=linename,START.

VIRI956S NO MORE OSCORE AVAILABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0I09
Meaning
    VIRTEL has insufficient memory to start a new VTAM task.
Action
    Check the OSCORE parameter in the VIRTCT.

6.44   Messages VIRICxxx
========================

VIRIC01I INITIALISATION FOR linename (n-xxxxxx), VERSION x.xx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0ICON
Meaning
    The IMS Connect line with external name linename and internal name n-xxxxxx has been initialised.
Action
    None.

VIRIC04I LINE linename WAS STOPPED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0ICON
Meaning
    The IMS Connect line with external name linename was stopped, either by console command, or by setting the “Possible calls” parameter to 0 in the line definition.
Action
    None.

VIRIC27E linename IS REJECTED AT ENTRY POINT epname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0ICON
Meaning
    VIRTEL was unable to start the IMS Connect line whose external name is linename because the entry point epname specified on the line definition does not exist.
Action
    Correct the entry point name specified in the line definition.

VIRIC28I linename CALLER ipaddr:port GETS ENTRY POINT 'epname' FROM RULE 'rulename'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0ICON
Meaning
    VIRTEL selected entry point epname for an incoming call on the IMS Connect line whose external name is linename, because the call matched the rule rulename.
Action
    None.

VIRIC29I linename HAS NO MORE PSEUDO TERMINALS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0ICON
Meaning
    There are no more terminals associated with the IMS Connect line whose external name is linename.
Action
    Check the definition of the line. Add more terminals if necessary.

VIRIC51I linename CONNECTION STARTING ON termname TO ENTRY POINT 'epname' TRANSACTION 'tranname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0ICON
Meaning
    VIRTEL has received a request from IMS Connect on the line with external name linename using terminal termname. The request is being processed by transaction tranname in entry point epname.
Action
    None.

VIRIC52I linename DECONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0ICON
Meaning
    Terminal termname has been disconnected from the IMS Connect line whose external name is linename.
Action
    None.

VIRIC53E linename ENTRY POINT 'epname' WAS NOT FOUND
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0ICON
Meaning
    VIRTEL received a request on the IMS Connect line whose external name is linename. The request could not be processed because the entry point epname does not exist.
Action
    Correct the entry point name specified in the line definition.

VIRIC54E linename IMS STATUS ERROR 'retcode' REASON 'reascode' text
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0ICON
Meaning
    VIRTEL attempted to start the IMS Connect line whose external name is linename. The RESUME TPIPE request was rejected by IMS Connect with return code retcode and reason code reascode. A brief explanation of the code is displayed as text if the return code and reason code are known to VIRTEL.
Action
    Check the OTMAPRM parameter in the VIRTCT. Check the IMS Connect log for error messages. If the error is NACK_RSM_TPIPE_SEC_FAILED check for ICH408I and IRR012I messages in the system log.

VIRIC55E INVALID RULE rulename ENTRY POINT 'epname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0ICON
Meaning
    Rule rulename attached to an IMS Connect line specifies an unknown entry point epname.
Action
    Check the entry point name specified in the rule definition.

VIRIC56W linename IS REQUESTING CLOSE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0ICON
Meaning
    IMS Connect is requesting termination of the RESUME TPIPE connection on the IMS Connect line whose external name is linename.
Action
    None.

VIRIC57E linename IN ENTRY POINT 'epname', THE TRANSACTION 'tranname' WAS NOT FOUND, AND THERE IS NO DEFAULT TRANSACTION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0ICON
Meaning
    VIRTEL received a request on the IMS Connect line whose external name is linename. The request header specified transaction name tranname. The request could not be processed because the entry point epname does not contain a transaction whose external name is tranname, nor does it contain a default transaction whose external name is the same as the entry point name.
Action
    Correct the transaction name specified by the calling IMS program. Alternatively, in entry point epname add a transaction named either tranname or epname.

6.45   Messages VIRIExxx
========================

VIRIE01I INVERSE PCNE INITIALISATION FOR linename (n-xxxxxx)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IE
Meaning
    The AntiPCNE line with external name linename and internal name n-xxxxxx has been initialised.
Action
    None.

VIRIE02I termid luname CONNECTED TO applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IE
Meaning
    An SNA session has been established between the relay LU luname (associated with the AntiPCNE terminal termid) and the partner application applname.
Action
    None.

VIRIE03I termid luname DISCONNECTED BY applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IE
Meaning
    Partner application applname has terminated its SNA session with the relay LU luname associated with the AntiPCNE terminal termid.
Action
    None.

VIRIE04I PCNE LINE linename WAS STOPPED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR00IE
Meaning
    The AntiPCNE line with external name linename was stopped, either by console command, or by setting the “Possible calls” parameter to 0 in the line definition.
Action
    None.

VIRIE05I termid RELAY CHANGED FROM oldlu TO newlu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IE
Meaning
    The terminal termid attached to an AntiPCNE line was previously active using relay LU name oldlu. Following an update to the definition and a restart of the AntiPCNE line, the terminal was restarted with a new relay LU name newlu.
Action
    None.

VIRIE45I termid CALL CLEARED BY VIRTEL CAUSE=xx DIAG=yy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IE
Meaning
    VIRTEL terminated the call on AntiPCNE terminal termid. xx and yy are the cause and diagnostic codes generated by VIRTEL. The following codes are possible:

    - Cause=00 Diag=00 : Call was terminated by local PCNE application
    - Cause=13 Diag=81 : Call could not be connected to the local PCNE application
    - Cause=xx Diag=yy : Error communicating with local PCNE application (xx,yy = VTAM RTNCD/FDBK codes)

Action
    For Cause=00, Diag=00: None. For other codes, examine preceding error messages to determine the cause.

VIRIE52I linename DECONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IE
Meaning
    Terminal termname disconnected from the AntiPCNE line whose external name is linename.
Action
    None.

6.46   Messages VIRIFxxx
======================== 

VIRIF01I INVERSE FASTC INITIALISATION FOR linename (n-xxxxxx)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IF
Meaning
    The AntiFastConnect line with external name linename and internal name n-xxxxxx has been initialised..
Action
    None.

VIRIF02I linename (n-xxxxxx) CONNECTED TO ctcpname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IF
Meaning
    The AntiFastConnect line with external name linename and internal name n-xxxxxx has established a connection with the partner CTCP ctcpname.
Action
    None.

VIRIF03I linename (n-xxxxxx) DISCONNECTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IF
Meaning
    The connection between the AntiFastConnect line with external name linename and internal name n-xxxxxx has been terminated by the partner CTCP.
Action
    None.

VIRIF04I FASTC LINE linename WAS STOPPED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IF
Meaning
    The AntiFastConnect line with external name linename was stopped, either by console command, or by setting the “Possible calls” parameter to 0 in the line definition.
Action
    None.

VIRIF42I FASTC : UNSUPPORTED COMMAND = xx ON MCH linename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IF
Meaning
    A packet received from the partner CTCP is of unknown type. xx represents the hexadecimal value of the first byte of the packet, linename represents the external name of the AntiFastConnect line on which the incident occurred.
Action
    Obtain a SNAP. Contact technical support if the incident persists.

VIRIF52I linename DECONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IF
Meaning
    Terminal termname disconnected from the AntiFastConnect line with external name linename.
Action
    None.

6.47   Messages VIRIGxxx
========================

VIRIG01I INVERSE GATE INITIALISATION FOR linename (n-xxxxxx)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IG
Meaning
    The AntiGATE line with external name linename and internal name n-xxxxxx has been initialised.
Action
    None.

VIRIG02I n-xxxxxx luname CONNECTED TO applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IG
Meaning
    An SNA session has been established between the partner CTCP application applname and the VIRTEL MCH LU luname for the AntiGATE line whose internal name is n-xxxxxx.
Action  
    None.

VIRIG03I n-xxxxxx luname DISCONNECTED BY applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IG
Meaning
    The partner CTCP application applname has terminated its SNA session with the VIRTEL MCH LU luname for the AntiGATE line whose internal name is n-xxxxxx.
Action
    None.

VIRIG04I n-xxxxxx GATE LINE linename WAS STOPPED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IG
Meaning
    The AntiGATE line with external name linename and internal name n-xxxxxx was stopped, either by console command, or by setting the “Possible calls” parameter to 0 in the line definition.
Action
    None.

VIRIG05I n-xxxxxx(linename) LOCAL LU NAME CHANGED FROM oldlu TO newlu
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IG
Meaning
    The AntiGATE line with external name linename and internal name n-xxxxxx was previously active using MCH name oldlu. Following an update of the field “Local ident” in the line definition and a restart of the line, the MCH name is now newlu.
Action
    None.

VIRIG12I termid luname CONNECTED TO applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IG
Meaning
    An SNA session has been established between the partner CTCP application applname and the VIRTEL CVC relay LU luname associated with the AntiGATE terminal termid. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRIG13I termid luname DISCONNECTED BY applname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IG
Meaning
    The partner CTCP application applname has terminated its SNA session with the VIRTEL CVC relay LU luname associated with the AntiGATE terminal termid. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRIG42I n-xxxxxx(linename) RECEIVED UNSUPPORTED COMMAND xx FROM applname ON MCH luname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR00IG
Meaning
    A packet received from the partner CTCP application applname is of unknown type. xx represents the hexadecimal value of the first byte of the packet, linename represents the external name of the AntiGATE line on which the incident occurred, n-xxxxxx is the internal name of the AntiGATE line, and luname is the LU name of the associated MCH.
Action
    Obtain a SNAP. Contact technical support if the incident persists.

VIRIG43I termid luname CLEAR RECEIVED FROM LOCAL applname CAUSE=xx DIAG=yy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IG
Meaning
    The VIRTEL AntiGATE line with internal name n-xxxxxx received an X25 CLEAR command from the CTCP application applname on the control session with MCH LU luname. VIRTEL determined that the command was associated with CVC terminal termid. xx and yy are the X25 cause and diagnostic codes in hexadecimal. This message is suppressed if the cause and diagnostic codes are zero and the SILENCE parameter is specified in the VIRTCT.
Action
    If the cause and diagnostic codes are zero, this indicates a normal end of call. Otherwise, use the cause and diagnostic codes to determine why the CTCP application issued the CLEAR.

VIRIG44I termid luname CLEAR RECEIVED FROM LOCAL applname CAUSE=xx DIAG=yy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IG
Meaning
    VIRTEL received an X25 CLEAR command from the CTCP application applname. The command was received on the data session with CVC relay LU name luname associated with AntiGATE terminal termid. xx and yy are the X25 cause and diagnostic codes in hexadecimal. This message is suppressed if the cause and diagnostic codes are zero and the SILENCE parameter is specified in the VIRTCT.
Action
    If the cause and diagnostic codes are zero, this indicates a normal end of call. Otherwise, use the cause and diagnostic codes to determine why the CTCP application issued the CLEAR.

VIRIG45I n-xxxxxx(linename) CALL FROM ctcpappl CLEARED BY VIRTEL CAUSE=xx DIAG=yy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IG
Meaning
    VIRTEL terminated the outbound call by the CTCP application ctcpappl on the AntiGATE line whose internal name is n-xxxxxx and whose external name is linename. xx and yy are the cause and diagnostic codes generated by VIRTEL. The following codes are possible:
    
    - Cause=01 Diag=E5 : Line n-xxxxxx has no available terminals which accept calls from CTCP
    - Cause=02 Diag=E5 : Could not connect CVC LU to ctcpappl
    - Cause=03 Diag=E5 : Error sending Call Connected packet to ctcpappl

Action
    For Cause=01, Diag=E5: Check the definition of the terminals associated with AntiGATE line n-xxxxxx and verify that the “Possible calls” field is set to 1 or 3. For other codes, examine preceding error messages to determine the cause.

VIRIG52I linename DECONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00IG
Meaning
    Terminal termname disconnected from the AntiGATE line with external name linename.
Action
    None.

6.48   Messages VIRIPAxx
========================

VIRIPA1I linename CONNECTING termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PASS
Meaning
    An incoming call on the VIRPASS/NT line whose external name is linename has been allocated to terminal termid.
Action
    None.

VIRIPA2I linename DECONNECTING termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PASS
Meaning
    Terminal termid has disconnected from the VIRPASS/NT line whose external name is linename.
Action
    None.

VIRIPA3I linename ACCEPTED termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PASS
Meaning
    An incoming call on the VIRPASS/NT line whose external name is linename has been accepted on terminal termid.
Action
    None.

VIRIPA4I linename NO OUTPUT LINE FOUND FOR termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PASS
Meaning
    VIRTEL was unable to connect output terminal termid on the VIRPASS/NT line whose external name is linename.
Action
    Wait until the partner VIRNT server retries the connection. Restart the connection at the VIRNT server if necessary. Check the definition of line linename and the terminals associated with line linename.

VIRIPA6E linename PROTOCOL ERROR - SNAP TAKEN
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PASS
Meaning
    VIRTEL received a message received on the VIRPASS/NT line whose external name is linename. The message did not contain a valid VIRPASS identifier.
Action
    Contact technical support.

VIRIPA7I linename HAS NO MORE PSEUDO TERMINALS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PASS
Meaning
    There are no more terminals associated with the VIRPASS/NT line whose external name is linename.
Action
    Check the definition of the line. Add more terminals if necessary.

VIRIPA8E linename UNKNOWN CORRELATOR xxxxxxxx IN COMMAND c
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PASS
Meaning
    VIRTEL received a message with an unknown correlator on the VIRPASS/NT line whose external name is linename.
Action
    Contact technical support.


VIRIPA9I INITIALISATION FOR linename (n-xxxxxx), VERSION 4.xx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIRPASS
Meaning
    The VIRPASS/NT line with external name linename and internal name n-xxxxxx has been initialised.
Action
    None.

6.49   Messages VIRNAxxx
========================

VIRNA01I NATIVE IP INITIALISATION FOR linename (n-xxxxxx), VERSION x.xx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRNATV
Meaning
    The line with external name linename and internal name n-xxxxxx has been initialised with the TCP/IP NATIVE protocol.
Action
    None.

VIRNA04I NATIVE IP LINE linename WAS STOPPED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRNATV
Meaning
    The line with external name linename was stopped, either by console command, or by setting the “Possible calls” parameter to 0 in the line definition.
Action
    None.

VIRNA05E linename UNDEFINED PARTNER n.n.n.n:p IS CALLING m.m.m.m:q
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRNATV
Meaning
    VIRTEL has rejected an incoming call to a native IP line. n.n.n.n:p represents the IP address and port of the caller, m.m.m.m:q represents the called IP address and port in VIRTEL. VIRTEL rejected the call because none of the TCP/IP lines listening on address/port m.m.m.m:q specifies address n.n.n.n as partner.
Action
    Define an XOT line specifying m.m.m.m:q in the “Local ident” field and n.n.n.n:p in the “Remote ident” field

VIRNA06I linename (n-xxxxxx) IS USING A GENERIC ADDRESS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIRNATV
Meaning
    The IP address and port number of the line with external name linename and internal name n-xxxxxx is treated as sharable with other TCP/IP lines as a result of the SHAREDA=Y parameter specified in the definition of line linename.
Action
    None.

VIRNA07I linename (n-xxxxxx) IS USING A GENERIC ADDRESS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRNATV
Meaning
    The IP address and port number of the line with external name linename and internal name n-xxxxxx is shared with another TCP/IP line. VIRTEL found the same address and port number specified in the definition of another line. Neither SHAREDA nor UNIQUEP were specified in the definition of line linename.
Action
    None.

VIRNA26E linename HAS NO PSEUDO TERMINALS: CANNOT CONTINUE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRNATV
Meaning
    No terminals are defined for the native IP line whose external name is linename.
Action
    VIRTEL continues but the line cannot be used. Define the associated terminals, then stop and start the line.

VIRNA27E linename IS REJECTED AT ENTRY POINT epname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRNATV
Meaning
    VIRTEL received an incoming call on the line whose external name is linename, but the entry point epname specified on the line definition does not exist.
Action
    Check the definition of the line.

VIRNA28I linename CALLER ipaddr:port GETS ENTRY POINT 'epname' FROM RULE 'rulename'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRNATV
Meaning
    VIRTEL selected entry point epname for an incoming call on the line whose external name is linename, because the call matched the rule rulename.
Action
    None.

VIRNA51I linename CONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRNATV
Meaning
    An incoming call on the line whose external name is linename has been allocated to terminal termname. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRNA52I linename DECONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRNATV
Meaning
    Terminal termname has been disconnected from the line whose external name is linename.
Action
    None.

VIRNA53E linename HAS NO MORE PSEUDO TERMINALS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRNATV
Meaning
    There are no more terminals associated with the line whose external name is linename.
Action
    Check the definition of the line. Add more terminals if necessary.

VIRNA55E INVALID RULE rulename ENTRY POINT 'epname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRNATV
Meaning
    Rule rulename attached to a native IP line specifies an unknown entry point epname.
Action
    Check the entry point name specified in the rule definition.

VIRNA98E linename ERROR errcode RECEIVING FROM SOCKET sockno
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIRNATV
Meaning
    An error occurred when receiving a message from the native IP line whose external name is linename. errcode is an error code whose meaning is:
    - 00000001 : No session exists for this line.
    - 00000002 : Unable to identify incoming message with an existing session.
    - 00000003 : No more pseudo terminals, or line not linked to TCP.
    - 00000004 : TCP/IP receive error; see preceding message VIRT923E or VIRT924E.
    - 00000005 : Socket is closed.
    - 00000006 : A message received on the line does not conform to the VIRTEL native IP protocol. The message length is invalid or exceeds the maximum packet size.

Action
    If the cause cannot be determined by preceding messages, use the VIRTEL SNAP command to produce a dump of the internal trace table. Determine whether the partner sent an invalid message, and if so, perform the appropriate diagnostic procedures. Otherwise contact technical support.

VIRNA99I linename ERROR errcode SENDING TO SOCKET socknum
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRNATV
Meaning
    An error occurred when sending a message to the native IP line whose external name is linename. errcode is an error code whose meaning is:
    - 00000001 : Invalid pseudo terminal.
    - 00000002 : Message not identified with an active session.
    - 00000003 : Line not linked to TCP stack.
    - 00000004 : TCP/IP send error; see preceding message VIRT923E or VIRT924E.
    - 00000005 : VIRTEL internal task dispatching error.
    - 00000006 : Session cleared before message could be sent.

Action
    If the cause cannot be determined by preceding messages, use the VIRTEL SNAP command to produce a dump of the internal trace table and contact technical support.

6.50   Messages VIRP1xxx
========================

VIRP121E PAGE NOT FOUND FOR termid ENTRY POINT 'epname' SCENARIO 'scenname' DIRECTORY 'tranid'(dirname) NAME 'filename' URL'url'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0P12
Meaning
    The scenario scenname invoked from terminal termid requested a file named filename which does not exist. dirname is the name of the current VIRTEL directory and tranid is the external name of the corresponding transaction which belongs to entry point epname. VIRTEL sent a 404 NOT FOUND reply to the terminal with the text “Failed on missing page:filename”.
Action
    Change the scenario to specify the correct file name.

VIRP122E VARIABLE NOT FOUND FOR termid ENTRY POINT 'epname' SCENARIO 'scenname' DIRECTORY 'tranid'(dirname) NAME 'varname' URL'url'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0P12
Meaning
    The scenario scenname invoked from terminal termid requested a VIRTEL variable named varname which does not exist. dirname is the name of the current VIRTEL directory and tranid is the external name of the corresponding transaction which belongs to entry point epname. VIRTEL sent a 404 NOT FOUND reply to the terminal with the text “Failed on missing variable:varname”.
Action
    Change the scenario to specify the correct variable name.

VIRP123E SCENARIO NOT FOUND FOR termid ENTRY POINT 'epname' DIRECTORY 'dirname’ NAME 'filename' URL 'url'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0P12
Meaning
    The scenario filename (filetype .390) invoked from terminal termid for URL url was not found in the scenario directory dirname defined in entry point epname.
Action
    Use Virtel Studio to upload the scenario to the directory specified by the entry point.

VIRP1251I termid CONNECTED TO "epname"
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0P12
Meaning
    An input message from terminal termid has been assigned to entry point epname.
Action
    None.

6.51   Messages VIRPAxxx
========================

VIRPA54E termid INVALID REQUEST ON linename FROM CALLER ipaddr:port ENTRY POINT 'epname' TRANSACTION OR SERVER 'servid'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PASS
Meaning
    VIRTEL received an incoming call on terminal termid associated with the VIRPASS line whose external name is linename. The call originated from IP address ipaddr port port. The service requested was servid. But the chosen entry point epname contains no transaction whose external name is servid, nor does it contain a default transaction capable of invoking the external server named servid.
Action
    Check that entry point epname has been defined in accordance with the documentation for setting up the VIRTEL Videotex Plugin.

6.52   Messages VIRPExxx
========================

VIRPE27E termid IS REJECTED AT ENTRY POINT epname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR00PE
Meaning
    VIRTEL received an incoming call from terminal termid, but the requested entry point epname does not exist.
Action
    Check the entry point specified in the logdata (for SNA) or in the call user data (for X25).

VIRPE52I termid DISCONNECTED AFTER nn MINUTES
---------------------------------------------
Module
    VIR00PE
Meaning
    Terminal termid was connected to an application and has disconnected after nn minutes of connection time.
Action
    None.

6.53   Messages VIRPFxxx
========================

VIRPF01I INITIALISATION FOR linename (n-xxxxxx), VERSION x.xx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PRF
Meaning
    The line with external name linename and internal name n-xxxxxx has been initialised with the PREFIXED protocol.
Action
    None.

VIRPF04I LINE linename WAS STOPPED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0PRF
Meaning
    The line with external name linename was stopped, either by console command, or by setting the “Possible calls” parameter to 0 in the line definition.
Action
    None.

VIRPF27E linename IS REJECTED AT ENTRY POINT epname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PRF
Meaning
    VIRTEL received an incoming call on the line whose external name is linename, but the entry point epname specified on the line definition does not exist.
Action
    Check the definition of the line.

VIRPF28I linename CALLER ipaddr:port GETS ENTRY POINT 'epname' FROM RULE 'rulename'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PRF
Meaning
    VIRTEL selected entry point epname for an incoming call on the line whose external name is linename, because the call matched the rule rulename. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRPF29I linename HAS NO MORE PSEUDO TERMINALS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PRF
Meaning
    There are no more terminals associated with the line whose external name is linename.
Action
    Check the definition of the line. Add more terminals if necessary.

VIRPF51I linename CONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PRF
Meaning
    An incoming call on the line whose external name is linename has been allocated to terminal termname. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRPF52I linename DECONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PRF
Meaning
    Terminal termname has been disconnected from the line whose external name is linename. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRPF54E INVALID REQUEST ON linename ENTRY POINT 'epname' DIRECTORY 'dirname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PRF
Meaning
    VIRTEL received a request on the line whose external name is linename. The requested directory path dirname does not exist under the entry point epname.
Action
    Check the definition of the entry point epname. Ensure that there is a type 4 transaction with external name dirname.

VIRPF55E INVALID RULE rulename ENTRY POINT 'epname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PRF
Meaning
    Rule rulename attached to an MQ line specifies an unknown entry point epname.
Action
    Check the entry point name specified in the rule definition.

VIRPF99I linename MESSAGE RECEIVED FROM SOCKET socknum
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0PRF
Meaning
    Input data has been received by the line whose external name is linename.
Action
    None.

VIRPF99I linename SEND TO SOCKET socknum
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0PRF
Meaning
    Output data has been sent to the line whose external name is linename. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

6.54   Messages VIRPSxxx
========================

VIRPS01I INITIALISATION FOR linename (n-xxxxxx), VERSION nn.nn
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    The VIRPESIT line with external name linename and internal name n-xxxxxx has been initialised.
Action
    None.

VIRPS02I linename DECONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    Terminal termname has been disconnected from the VIRPESIT line whose external name is linename.
Action
    None.

VIRPS04I VIRPESIT LINE linename WAS STOPPED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    VIRPESIT line with external name linename was stopped, either by console command, or by setting the “Possible calls” field to 0 in the line definition.
Action
    None.

VIRPS06E linename HAS NO PSEUDO TERMINALS: CANNOT CONTINUE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIRPESIT
Meaning
    No terminals are defined for the VIRPESIT line whose external name is linename.
Action
    VIRTEL continues but the line cannot be used. Define the associated terminals, then stop and start the line.

VIRPS07I linename HAS NO MORE PSEUDO TERMINALS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    There are no more terminals associated with the VIRPESIT line whose external name is linename.
Action
    Check the line definition. Add more terminals if necessary.

VIRPS08E linename PSEUDO termname LOST
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    VIRTEL was unable to identify the terminal termname associated with the VIRPESIT line whose external name is linename.
Action
    Contact technical support.

VIRPS11I linename PSEUDO termname RECEIVED ABORT REQUEST FROM emitter TO receiver WITH FIRST ABORT PID : pid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    VIRTEL received an abort request of type pid via terminal termname associated with the VIRPESIT line whose external name is linename. Emitter is the name of the file transfer requester and receiver is the name of the destination partner.
Action
    The file transfer terminates. Inspect the emitter logs to determine why the partner application terminated the transfer.

VIRPS12I linename RECEIVED ABORT REQUEST FOR termname (partnerid)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    VIRTEL received an abort request via the VIRPESIT line whose external name is linename. termname is the terminal name and partnerid is the name of the destination partner.
Action
    The file transfer terminates. Inspect the logs of the file transfer application to determine why the application terminated the transfer.

VIRPS13I linename OUTBOUND CONNECTION STARTING ON termname | linename CLIENT 'requesterid' SERVER 'serverid' PROTOCOL 'protocol'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning 
    VIRTEL is starting an outbound file transfer session via the VIRPESIT line whose external name is linename. termname is the terminal name, requesterid is the name of the requesting partner defined in the file transfer application, serverid is the name of the destination partner, and protocol is the protocol name (for example, PESIT).
Action
    None.

VIRPS14I linename INBOUND CONNECTION STARTING ON termname TO ENTRY POINT 'epname' TRANSACTION 'tranid' | linename CLIENT ''requesterid' SERVER 'serverid' PROTOCOL 'protocol'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    VIRTEL is has received an inbound request for a file transfer session via terminal termname on the VIRPESIT line whose external name is linename. The request has been assigned to entry point epname and transaction tranid. requesterid is the name of the requesting partner defined in the file transfer application, serverid is the name of the destination partner, and protocol is the protocol name (for example, PESIT).
Action
    None.

VIRPS15I linename RECEIVED REJECT CONNECT REQUEST FROM 'serverid' TO 'requesterid' WITH DIAGNOSTIC :'hexcode' ('deccode')
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    A file transfer request via the VIRPESIT line whose external name is linename has been rejected by the partner file transfer application. serverid is the name of the destination partner, and requesterid is the name of the requesting partner. hexcode is the hexadecimal abort code and deccode is the decimal abort code.
Action
    Inspect the logs of the file transfer application to determine why the application terminated the transfer. Refer to the file transfer application’s protocol documentation to determine the meaning of the abort codes.

VIRPS16I linename RECEIVED REJECT CONNECT REQUEST FOR 'termname' WITH DIAGNOSTIC :'hexcode' ('deccode')
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIRPESIT
Meaning
    A file transfer request via the VIRPESIT line whose external name is linename has been rejected by the partner file transfer application. termname is the terminal name, hexcode is the hexadecimal abort code and deccode is the decimal abort code.
Action
    Inspect the logs of the file transfer application to determine why the application terminated the transfer. Refer to the file transfer application’s protocol documentation to determine the meaning of the abort codes.

VIRPS17I linename CONNECTION ENDING FOR 'termname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    An inbound file transfer session via terminal termname on the VIRPESIT line whose external name is linename has been terminated by the partner file transfer application.
Action
    None.

VIRPS18I linename CONNECTION ENDING FOR 'termname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    An outbound file transfer session via terminal termname on the VIRPESIT line whose external name is linename has been terminated by the partner file transfer application.
Action
    None.

VIRPS28I linename CALLER ipaddr:port GETS ENTRY POINT 'epname' FROM RULE 'rulename'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    VIRTEL chose entry point epname for an incoming call on the VIRPESIT line whose external name is linename, because the call matched the rule named rulename. ipaddr:port is the IP address and port number of the calling application.
Action
    None.

VIRPS29E INVALID RULE rulename ENTRY POINT 'epname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    Rule rulename used by a VIRPESIT line specifies a non-existent entry point epname.
Action
    Check the entry point name specified in the rule definition.

VIRPS50E linename CANNOT CONNECT termname TO CALLER ipaddr:port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    An inbound file transfer session request was received on the VIRPESIT line whose external name is linename. The request originated from IP address ipaddr  and port number port and the VIRTEL terminal  name is termname.     The request could not be processed because the entry point was not valid or there was no transaction definition corresponding to the request.
Action
    Refer to subsequent message displayed on the console (VIRPS52E through VIRPS57E) for detailed explanation.

VIRPS51I linename PSEUDO termname CALLING ipaddr:port (servname)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    VIRTEL is sending an outbound session request to the file transfer application at IP address ipaddr and port number port. linename is the external name of the VIRPESIT line, termname is the terminal name, and servname is the name of the external server.
Action
    None.

VIRPS52E linename ENTRY POINT 'epname' WAS NOT FOUND
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    An inbound file transfer session request was received on the VIRPESIT line whose external name is linename. The request could not be processed because the default entry point name specified in the line definition does not exist.
Action
    Correct the default entry point name specified in the line definition.

VIRPS53E linename DEFAULT ENTRY POINT MISSING OR INVALID
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    An inbound file transfer session request was received on the VIRPESIT line whose external name is linename. The request could not be processed because it did not match any rule and the default entry point name specified in the line definition is blank.
Action
    Add a rule or specify a default entry point name in the line definition.

VIRPS54E linename IN ENTRY POINT 'epname', TRANSACTION 'tranid', THE SERVER 'servname' WAS NOT FOUND
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    An inbound file transfer session request was received on the VIRPESIT line whose external name is linename.       The request was assigned to entry point epname and transaction tranid. The transaction calls for a server named servname (either explicitly, or by reference to the destination partner name specified by the file transfer application), but there is no external server definition of that name.
Action
    Add an external server definition for servname.

VIRPS56E linename IN ENTRY POINT 'epname', THE TRANSACTION 'partnerid' WAS NOT FOUND, AND THERE IS NO DEFAULT TRANSACTION
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    An inbound file transfer session request was received on the VIRPESIT line whose external name is linename. The request was assigned to entry point epname, but the entry point has no transaction corresponding to the destination partner partnerid.
Action
    Correct the definition of the entry point, either by adding a transaction whose external name is partnerid, or by adding a default transaction whose external name is the same as the entry point name epname.

VIRPS57E linename IN ENTRY POINT 'epname', THE EMULATION 'emtype' IS NOT SUPPORTED, SHOULD BE '$NONE$'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRPESIT
Meaning
    An inbound file transfer session request was received on the VIRPESIT line whose external name is linename. The request was assigned to entry point epname, but the entry point specifies emulation type emtype which is not compatible with the VIRPESIT protocol.
Action
    Ensure that only entry points with emulation type $NONE$ are specified in the rules and in the line definition for a VIRPESIT line.

6.55   Messages VIRQ9xxx
======================== 

VIRQ903W LINE linename HAS A SESSION STARTED WITH MQM mqmname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0Q09
Meaning
    The line with external name linename has successfully connected to the message-queue manager named mqmname
Action
    None.

VIRQ904W linename OBJECT socknum WAITING FOR INPUT
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0Q09
Meaning
    The line with external name linename is waiting for input data to arrive. Message VIRQ904W can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRQ904W linename OBJECT socknum HAS MESSAGE OF LENGTH 'hexlen' WAITING
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0Q09
Meaning
    Input data has arrived on the line with external name linename. The length of the input data (in hexadecimal) is hexlen. Message VIRQ904W can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRQ912W linename OBJECT socknum STARTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0Q09
Meaning
    The line with external name linename has opened the message queue. Message VIRQ912W can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRQ922W linename ENDING OBJECT socknum FOR mqmname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0Q09
Meaning
    The line with external name linename has closed the message queue. Message VIRQ922W can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRQ923E linename REQ reqtype COMPLETION CODE ccc REASON CODE xx (ddd) MQM mqmname | linename PARAM queuename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0Q09
Meaning
    A message queue manager request of type reqtype for the line whose external name is linename was not successful. mqmname is the name of the message queue manager, ccc is the message queue manager completion code, and xx and ddd are respectively the hexadecimal and decimal reason codes. queuename is the name of the message queue, if any, associated with the error.
Action
    For an explanation of the error codes, refer to Appendix A of the IBM manual MQSeries Application Programming Reference.
    The following codes are commonly encountered:
    - REQ MQCONN COMPLETION CODE 00000002 REASON CODE 0000080A (00002058) : indicates that the message queue manager name is not known. Specify the correct name in the MQn parameter of the VIRTCT.
    - REQ MQOPEN COMPLETION CODE 00000002 REASON CODE 00000825 (00002085) : indicates that the message queue name is not known. Check the “Local address” field in the definition of the MQ line, and the queue name prefix in the MQn parameter of the VIRTCT.
    - REQ MQCONN COMPLETION CODE 00000002 REASON CODE 00000851 (00002129) : indicates that the required MQSeries libraries are not present in the STEPLIB concatenation of the VIRTEL started task JCL. Refer to “Executing VIRTEL in an MVS environment” in the VIRTEL Installation Guide.

VIRQ924E linename OBJECT socknum REQ reqtype COMPLETION CODE ccc REASON CODE xx (ddd) MQM mqmname | linename PARAM queuename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0Q09
Meaning
    A message queue manager request of type reqtype for the line whose external name is linename was not successful. mqmname is the name of the message queue manager, ccc is the message queue manager completion code, and xx and ddd are respectively the hexadecimal and decimal reason codes. queuename is the name of the message queue, if any, associated with the error.
Action
    For an explanation of the error codes, refer to Appendix A of the IBM manual MQSeries Application Programming Reference.

VIRQ925W linename MQM mqmname IS QUIESCING
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0Q09
Meaning
    The message queue manager mqmname is terminating. linename is the external name of the associated VIRTEL line. MQ services will not be available until the queue manager is restarted.
Action
    Restart the queue manager.

6.56   Messages VIRR2xxx
========================

VIRR211E termid INVALID SERVER CALLED: 'servid' FROM TRANSACTION tranid BY USER userid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0021R
Meaning
    Transaction tranid either specifies a non-existent external server servid in its “application” field, or the “application type” field in the transaction definition is not valid.
Action
    Correct the definition of transaction tranid.

6.57   Messages VIRRWxxx
========================

VIRRW01I INITIALISATION FOR linename (n-xxxxxx), VERSION x.xx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0RAW
Meaning
    The line with external name linename and internal name n-xxxxxx has been initialised with the RAW protocol.
Action
    None.

VIRRW04I LINE linename WAS STOPPED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0RAW
Meaning
    The line with external name linename was stopped, either by console command, or by setting the “Possible calls” parameter to 0 in the line definition.
Action
    None.

VIRRW27E linename IS REJECTED AT ENTRY POINT epname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0RAW
Meaning
    VIRTEL received an incoming call on the line whose external name is linename, but the entry point epname specified on the line definition does not exist.
Action
    Check the definition of the line.

VIRRW28I linename CALLER ipaddr:port GETS ENTRY POINT 'epname' FROM RULE 'rulename'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0RAW
Meaning
    VIRTEL selected entry point epname for an incoming call on the line whose external name is linename, because the call matched the rule rulename.
Action
    None.

VIRRW29I linename HAS NO MORE PSEUDO TERMINALS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0RAW
Meaning
    There are no more terminals associated with the line whose external name is linename.
Action
    Check the definition of the line. Add more terminals if necessary.

VIRRW30I linename REQUEST FROM termname SENT AT timestamp1 CORR=correlator
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0RAW
Meaning
    A request has been sent from terminal termname on the line whose external name is linename. The time of the request is timestamp1 and the correlator is correlator.
Action
    None.

VIRRW30I linename REPLY timestamp1 AT timestamp2 CORR=correlator Q=qname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0RAW
Meaning
    A response to a message sent by terminal termname on the line whose external name is linename has been received. The time of the request is timestamp1. The time of the response is timestamp2. The correlator is correlator. The queue name is qname.
Action
    None.

VIRRW31I linename REQUEST timestamp1 CORR=correlator TIMEOUT Q=qname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0RAW
Meaning
    VIRTEL has not received a response to a message sent by terminal termname on the line whose external name is linename. The time of the request is timestamp1. The correlator is correlator. The queue name is qname.
Action
    Check the message queue manager log to determine why no response was received.

VIRRW51I linename CONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0RAW
Meaning
    An incoming call on the line whose external name is linename has been allocated to terminal termname.
Action
    None.

VIRRW52I linename DECONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0RAW
Meaning
    Terminal termname has been disconnected from the line whose external name is linename.
Action
    None.

VIRRW54E INVALID REQUEST ON linename ENTRY POINT 'epname' DIRECTORY 'dirname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0RAW
Meaning
    VIRTEL received a request on the line whose external name is linename. The requested directory path dirname does not exist under the entry point epname.
Action
    Check the definition of the entry point epname. Ensure that there is a type 4 transaction with external name dirname.

VIRRW55E INVALID RULE rulename ENTRY POINT 'epname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0RAW
Meaning
    Rule rulename attached to an MQ line specifies an unknown entry point epname.
Action
    Check the entry point name specified in the rule definition.

VIRRW99I linename MESSAGE RECEIVED FROM SOCKET socknum
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0RAW
Meaning
    Input data has been received by the line whose external name is linename.
Action
    None.

VIRRW99I linename SEND TO SOCKET socknum
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0RAW
Meaning
    Output data has been sent to the line whose external name is linename.
Action
    None.

6.58   Messages VIRS1xxx
========================

VIRS121W termid ERROR LOADING SCENARIO modname IN TRANSACTION tranid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    Transaction tranid at terminal termid called for a presentation module modname which could not be loaded.
Action
    Check the log for a previous message VIR0031W. Check the module name specified in the “Initial Scenario”, “Final Scenario”, “Input Scenario” or “Output Scenario” field of transaction tranid. Ensure that this module exists in the VIRTEL load library and that it contains a valid scenario of the requested type. Recompile the module using the current version of the VIRTEL SCRNAPI macro library.

VIRS122W termid INVALID FA39 SCENARIO RECEIVED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0S12
Meaning
    The transaction at terminal termid called for a presentation module which was not valid.
Action
    Check the module name specified in the “Initial Scenario”, “Final Scenario”, “Input Scenario” or “Output Scenario” field of the transaction. Ensure that this module contains a valid scenario of the requested type. Recompile the module using the current version of the VIRTEL SCRNAPI macro library.

VIRS123W termid ERROR LOADING SCENARIO modname IN ENTRY POINT epname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    Entry point epname invoked from terminal termid called for a presentation module modname which could not be loaded.
Action
    Check the log for a previous message VIR0031W. Check the module name specified in the “Identification Scenario” field of entry point epname. Ensure that this module exists in the VIRTEL load library and that it contains a valid scenario of the requested type. Recompile the module using the current version of the VIRTEL SCRNAPI macro library.

VIRS124E termid VIRSV CREATE ERROR – R15 : xxxxxxxx (dddddddd)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    A scenario invoked from terminal termid was unable to call a service program using the VIRSV$ macro instruction. xxxxxxxx is the hexadecimal return code from program VSVPCREA, and dddddddd is the decimal equivalent of the low-order byte of the return code.
Action
    Refer to the VIRSV User’s Guide manual to determine the meaning of the VSVPCREA return code. Check the VIRTEL log and the VSVTRACE file for additional messages. Check the VIRTEL started task JCL to ensure that the VIRSV load library is referenced in both the STEPLIB and the SERVLIB concatenations. If VIRTEL runs as an APF-authorized task, check that the VIRSV load library is APF-authorized.

VIRS125E termid VIRSV REQUEST ERROR – R15 : xxxxxxxx (dddddddd)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    A scenario invoked from terminal termid was unable to call a service program using the VIRSV$ macro instruction. xxxxxxxx is the hexadecimal return code from program VSVPREQS, and dddddddd is the decimal equivalent of the low-order byte of the return code.
Action
    Refer to the VIRSV User’s Guide manual to determine the meaning of the VSVPREQS return code. Check the VIRTEL log and the VSVTRACE file for additional messages. Check that the requested service program exists in a load library in the SERVLIB concatenation of the VIRTEL started task JCL. If VIRTEL runs as an APF-authorized task, check that the load library containing the service program is APF-authorized.

VIRS126E termid VIRSV APPLICATION ERROR CODE : xxxxxxxx (dddddddd)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    A scenario invoked from terminal termid called a service program using the VIRSV$ macro instruction. The service program completed with a non-zero return code. xxxxxxxx is the hexadecimal return code from the service program, and dddddddd is the decimal equivalent.
Action
    Determine the meaning of the service program return code and take appropriate action.

VIRS127E termid VIRSV SERVICES UNAVAILABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    A scenario invoked from terminal termid was unable to call a service program using the VIRSV$ macro instruction because the VIRSV service call facility is not available to VIRTEL.
Action
    Check that the VIRTCT contains a VIRSV1 parameter. If so, check the VIRTEL log to determine why the VIRSV facility failed to initialise at VIRTEL startup. Refer to message VIR0090E.

VIRS129E termid ERROR: SCENARIO scenname ABENDED AT OFFSET 'xxxxxxxx' ON INSTRUCTION STARTING WITH 'yyyyyyyy' [INPUT|OUTPUT|IDENTIFICATION SCENARIO IS DISCARDED]
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    The scenario scenname invoked from terminal termid contains an instruction which is invalid, or which attempted to perform an invalid operation such as copying into a protected field on the 3270 screen, or a MAP$ ABEND instruction was executed. xxxxxxxx is the hexadecimal offset within the module of the instruction. yyyyyyyy represents the first four bytes (in hexadecimal) of the instruction. The scenario is abandoned (as if SCENARIO DISCARD had been coded).
Action
    Check the assembly listing to verify that the scenario has been correctly assembled. Check that the correct level macro library was used.

VIRS12AI termid ERROR: SCENARIO scenname WAS ABNORMALLY STOPPED AT OFFSET 'xxxxxxxx'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    The scenario scenname invoked from terminal termid was terminated abnormally using the KILL command. xxxxxxxx is the hexadecimal offset within the module.
Action
    None.

VIRS12BE SCENARIO REQUIRES HEADER 'headername' NOT FOUND IN TCT : ABORTING
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    A COPY$ SYSTEM-TO-VARIABLE instruction in a scenario is attempting to obtain the value of the HTTP header headername but the name was not declared in the VIRTCT. A subsequent VIRS129E instruction shows the name of the scenario and the location of the instruction in error.
Action
    Add headername to the HTHEADR parameter of the VIRTCT.

VIRS12CE termid VIRSV REQUEST ERROR – R15 : xxxxxxxx (dddddddd) FROM progname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    A call from a scenario to VIRSV returned an error. xxxxxxxx is the hexadecimal return code from VIRSV module progname and dddddddd is the decimal equivalent.
Action
    Refer to the VIRSV documentation for the meaning of the return code.

VIRS12DE termid VIRSV TRANSACTION ERROR CODE : xxxxxxxx (dddddddd) FROM progname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    A call from a scenario to VIRSV returned an error. xxxxxxxx is the hexadecimal return code from VIRSV module progname and dddddddd is the decimal equivalent.
Action
    Refer to the VIRSV documentation for the meaning of the return code.

VIRS12EE termid SCENARIO scenname RETURNED ERROR : 'dddddddd'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    The scenario scenname invoked from terminal termid terminated using the ERROR$ macro instruction. dddddddd is the decimal return code.
Action
    Determine the meaning of the scenario return code and take appropriate action.

VIRS12FE termid ERROR: SCENARIO 'scenname' CALLS UNDEFINED TRANSACTION 'tranname' AT OFFSET 'xxxxxxxx'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    The scenario scenname invoked from terminal termid issued a SEND$ TO or SEND$ VARIABLE-TO instruction specifying an invalid transaction name tranname. xxxxxxxx is the hexadecimal offset of the SEND$ instruction within the module.
Action
    Verify that the entry point contains a type 5 transaction whose external name is tranname, or correct the transaction name in the scenario.

VIRS12GE CANNOT RESOLVE PASSTICKET OF TYPE 'applname' ABORTING SCENARIO
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    VIRTEL was unable to process an instruction of type PASSTICKET-FOR-TRANSACTION contained in a scenario.
Action
    Possible causes are: (1) Not signed on (2) Transaction not found (3) No application name in transaction (4) PASSTCK not specified in VIRTCT (5) Application name not found in PASSTCK table (6) Request is neither GENERATE nor EVALUATE (7) Request specifies GENERATE or EVALUATE but does not match corresponding entry in the PASSTCK table (8) Insufficient storage for workarea (9) Error linking to module IRRSPK00

VIRS12HE termid ERROR: SCENARIO scenname RACF ticketserv GENERATE|EVALUATE SAF RC: 'safrc' RACF RC: 'racfrc' RACF reason: 'racfreas'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    The security subsystem returned an error code during processing of an instruction of type PASSTICKET-FOR- TRANSACTION contained in scenario scenname for terminal termid.
Action
    For an explanation of the return codes and reason codes, refer to the IBM manual z/OS Security Server RACF Callable Services chapter 2: “R_ticketserv”.

VIRS12IE termid LOOP WAS DETECTED IN SCENARIO scenname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0S12
Meaning
    A possible loop has been detected in scenario scenname. The scenario is abended.
Action
    For an explanation on the way to identify or manage loops in scenario, refer to the HANDLE$ LOOP instrauction in the VIRTEL Web Access documentation.

6.59   Messages VIRSMxxx
========================

VIRSM01I SMTP INITIALISATION FOR linename (n-xxxxxx), VERSION x.xx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRSMTP
Meaning
    The SMTP line with external name linename and internal name n-xxxxxx has been initialised.
Action
    None.

VIRSM04I SMTP LINE linename WAS STOPPED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRSMTP
Meaning
    The SMTP line with external name linename was stopped, either by console command, or by setting the “Possible calls” parameter to 0 in the line definition.
Action
    None.

VIRSM27E linename IS REJECTED AT ENTRY POINT epname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRSMTP
Meaning
    VIRTEL received an incoming call on the SMTP line whose external name is linename, but the entry point epname specified on the line definition does not exist.
Action
    Check the definition of the SMTP line.

VIRSM28I linename CALLER ipaddr:port GETS ENTRY POINT 'epname' FROM RULE 'rulename'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRSMTP
Meaning
    VIRTEL selected entry point epname for an incoming call on the SMTP line whose external name is linename, because the call matched the rule rulename.
Action
    None.

VIRSM29I linename HAS NO MORE PSEUDO TERMINALS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIRSMTP
Meaning
    There are no more terminals associated with the SMTP line whose external name is linename.
Action
    Check the definition of the line. Add more terminals if necessary.

VIRSM51I linename CONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRSMTP
Meaning
    An incoming call on the SMTP line whose external name is linename has been allocated to terminal termname.
Action
    None.

VIRSM52I linename DECONNECTING termname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRSMTP
Meaning
    Terminal termname has been disconnected from the SMTP line whose external name is linename.
Action
    None.

VIRSM55E INVALID RULE rulename ENTRY POINT 'epname'
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRSMTP
Meaning
    Rule rulename attached to an SMTP line specifies an unknown entry point epname.
Action
    Check the entry point name specified in the rule definition.

VIRSM571 MESSAGE FROM xxx@xxx.xxx TO xxx@xxx.xxx WAS REJECTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRSMTP
Meaning
    VIRTEL received an incomplete message on an SMTP line. The message does not contain the required headers In-Reply-To: (or alternatively References:) and Mime-Version:. The message has been rejected with response 571 Delivery not authorized, message refused sent to the SMTP requester.
Action
    To upload an HTML page, you must reply to a message sent by VIRTEL and include an attached file.

6.60   Messages VIRT2xxx
========================

VIRT251E termid INVALID SERVER CALLED: 'servid' FROM TRANSACTION tranid BY USER userid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0025T
Meaning
    Transaction tranid either specifies a non-existent external server servid in its “application” field, or the “application type” field in the transaction definition is not valid.
Action
    Correct the definition of transaction tranid.

6.61   Messages VIRT9xxx
========================

VIRT903W LINE linename HAS A SESSION STARTED WITH TCP/IP tcpname HIGHEST SOCKET IS 'xxxxxxxx' (dddddddd)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0T09
Meaning
    The line with external name linename has opened a session with TCP/IP name tcpname. xxxxxxxx is the highest socket number (in hexadecimal) for this line. dddddddd is the highest socket number in decimal. The highest socket number is assigned by the TCP/IP stack and will normally be one less than the maxsock subparameter of the TCPn parameter in the VIRTCT.
Action
    None

VIRT904I LINE linename (n-xxxxxx) IS USING TCP/IP KEEPALIVE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0T09
Meaning
    VIRTEL has requested the TCP/IP  stack to send “keepalive” messages on the line with external name linename     and internal name n-xxxxxx. You must also activate keepalive in the TCP/IP stack parameter file. See the “Action” parameter of the Line Definition in the VIRTEL Connectivity Reference manual.
Action
    None.

VIRT905I linename SOCKET socknum LISTENING ipaddr:port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^   
Module
    VIR0T09
Meaning
    VIRTEL has opened a TCP/IP listening socket for the line with external name linename. port is the listening port number, and ipaddr is the IP address on which VIRTEL will accept incoming connections. If ipaddr is 000.000.000.000 then VIRTEL accepts connections on any of the host’s home IP addresses.
Action
    None.

VIRT906I linename SOCKET socknum CALL FROM ipaddr:port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0T09
Meaning
    VIRTEL has accepted an incoming connection on the line with external name linename. socknum is the TCP/IP socket number, and ipaddr:port is the client’s IP address and port number.
Action
    None.

VIRT907I linename SOCKET socknum CALLING ipaddr:port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0T09
Meaning
    VIRTEL is making an outgoing connection on the line with external name linename. socknum is the TCP/IP socket number, and ipaddr:port is the destination IP address and port number.
Action
    None.

VIRT912W linename SOCKET socknum STARTED FOR ipaddr:port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0T09
Meaning
    VIRTEL has opened TCP/IP socket socknum on the line with external name linename. If socknum is 00000000 then this is a listening socket, port is the listening port number, and ipaddr is the IP address on which VIRTEL accepts incoming connections (000.000.000.000 means that VIRTEL accepts connections on any of the host’s home IP addresses). If socknum is non-zero and port is non-zero, then this is an incoming connection, and ipaddr:port is the client’s IP address and port number. If socknum is non-zero and port is 00000, then this is an outgoing connection, and ipaddr is VIRTEL’s  IP address (000.000.000.000 means that VIRTEL is using the host’s default home address).  For VIRTEL 4.33 onwards, this message is replaced by messages VIRT905I, VIRT906I and VIRT907I respectively. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRT918S NO MORE OSCORE AVAILABLE
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0T09
Meaning
    VIRTEL has insufficient memory to start a new TCP/IP task.
Action
    Check the OSCORE parameter in the VIRTCT.

VIRT920W TCP SESSION LOST FOR LU linename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0T09
Meaning
    Loss of TCP/IP session for the line with external name linename.
Action
    Check the partner system to determine the cause of the error.

VIRT922W linename SOCKET socknum ENDED FOR ipaddr:port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0T09
Meaning
    VIRTEL has closed the TCP/IP socket socknum on the line with external name linename on the indicated IP address ipaddr and the indicated port number port. This message can be suppressed by the SILENCE parameter in the VIRTCT.
Action
    None.

VIRT923E ERROR ON: linename REQ: reqtype - RETCODE: FFFFFFFF ERRNO: xx (ddd)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0T09
Meaning
    A request of type reqtype in TCP/IP mode for the line indicated by the external name linename was not successful. xx and ddd are respectively the hexadecimal and decimal error codes.
Action
    For an explanation of the error codes, refer to Appendix B of the IBM manual z/OS Communications Server: IP Sockets Application Programming Interface Guide and Reference. For VSE, refer to “ERRNO values” in chapter 8 of the IBM manual TCP/IP for VSE/ESA IBM Program Setup and Supplementary Information.
    The following codes are commonly encountered:
    - REQ: SOCKET - RETCODE: FFFFFFFF ERRNO:00000018 (00000024) : indicates that the value of the MAXFILEPROC parameter in PARMLIB member BPXPRMxx is insufficient for the number of TCP/IP connections. Use the console command D OMVS,O to determine the current value of MAXFILEPROC. The command SETOMVS MAXFILEPROC=nnnn can be used to increase the value temporarily until the next IPL.
    - REQ: SOCKET - RETCODE: FFFFFFFF ERRNO: 0000045D (00001117) : indicates that TCP/IP for VSE is not started.
    - REQ: GTHOSTID - RETCODE: FFFFFFFF ERRNO: 00000000 (00000000) : may indicate that TCP/IP for VSE is not started.
    - REQ: GTHOSTID - RETCODE: FFFFFFFF ERRNO: 0000009C (00000156) : may indicate that the USER assigned to the VIRTEL started task does not have the necessary authorization (RACF, TOP SECRET) to access TCP/IP facilities via MVS OPEN-EDITION.
    - REQ: ACCEPT - RETCODE: FFFFFFFF ERRNO: 000003EA (00001002) : indicates that the maxsock subparameter of the TCPn parameter in the VIRTCT is insufficient for the number of incoming calls received.
    - REQ: INITAPI - RETCODE: FFFFFFFF ERRNO: 000003F3 (00001011) : indicates that the name specified in the TCPn parameter in the VIRTCT does not match the name of the z/OS TCP/IP stack.
    - REQ: INITAPI - RETCODE: FFFFFFFF ERRNO: 000027D6 (00010198) : indicates that the maxsock subparameter of the TCPn parameter in the VIRTCT exceeds the maximum allowed by the TCP/IP stack.

VIRT924E ERROR ON: linename SOCKET: socknum REQ: reqtype - RETCODE: FFFFFFFF ERRNO: xx (ddd)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0T09
Meaning
    Socket socknum has not been successful in establishing a TCP/IP  session. reqtype is the TCP/IP  API call which  failed, linename is the external name of the line, and xx and ddd are respectively the hexadecimal and decimal representations of the TCP/IP error code. This message can appear several times, as VIRTEL retries periodically to obtain the connection.
Action
    For an explanation of the error codes, refer to Appendix B of the IBM manual z/OS Communications Server: IP Sockets Application Programming Interface Guide and Reference. For VSE, refer to “ERRNO values” in chapter 8 of the IBM manual TCP/IP for VSE/ESA IBM Program Setup and Supplementary Information.
    The following codes are commonly encountered:
    - REQ :BIND - RETCODE: FFFFFFFF ERRNO: 00000030 (00000048) : indicates that the field “Local ident” in the line definition specified a port number which is already in use by another application or by another VIRTEL line.
    - REQ :BIND - RETCODE: FFFFFFFF ERRNO: 00000031 (00000049) : indicates the the field “Local ident” in the line definition specifies an IP address which is not accepted by the TCP/IP stack as a valid home address.

VIRT925E ERROR CALLING PORT port AT SERVER servname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0T09
Meaning
    An outbound HTTP call to port port at server servname has failed.
Action
    Check preceding messages in the log. Check whether a firewall has blocked access to the specified port.

6.62   Messages VIRU1xxx
======================== 

VIRU121E termid FILE UPLOAD FAILED : ENTRY POINT 'epname' DIRECTORY 'dirname' FILE 'filename’ USER 'username’
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0U12
Meaning
    A request by user username to upload the file filename into the directory dirname at VIRTEL entry point epname failed.
Action
    Check, if necessary, that the user has successfully installed a cookie (see “Uploading pages via HTML secured by cookie” in the VIRTEL Web Access Guide). Check the definition of entry point epname. Check (using F6 in the VIRTEL configuration menu) that the directory has permissions “Copy to”, “Copy from”, and “Delete” all marked with “X”. Check that the DD name specified in the directory definition is included in the VIRTEL started task JCL.

VIRU122I termid FILE UPLOAD : ENTRY POINT 'epname' DIRECTORY 'dirname' FILE 'filename’ USER 'username’
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0U12
Meaning
    A request by user username to upload the file filename into the directory dirname at VIRTEL entry point epname was successful.
Action
    None.

6.63   Messages VIRUCSxx
========================

VIRUCS1E termid COULD NOT FIND TRANSLATION TABLE tablename
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0UCS
Meaning
    Translation table tablename requested by terminal termid was not found.
Action
    Check that the CODEPAGE parameter of the URL contains a valid translation table name, and that the table has been loaded by VIRTEL at startup, either as standard, or by the CHARSET parameter of the VIRTCT (see “Parameters of the VIRTCT” in the VIRTEL Installation Guide).

6.64   Messages VIRV1xxx
======================== 

VIRV121E termid COULD NOT FIND TRANSLATION TABLE 'tablname' FOR PAGE 'pagename' DIRECTORY 'tranid' (dirname)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0V12
Meaning
    The HTML page pagename in the directory referenced by the transaction with external name tranid and internal name dirname specifies an unknown translation table tablname.
Action
    Check that the table tablname specified in the SET-OUTPUT-ENCODING-UTF-8 instruction in the HTML page was loaded into VIRTEL at startup time, either as standard, or by being specified in the CHARSET parameter of the VIRTCT (see the VIRTEL Installation Guide manual).

VIRV122E termid WAS STOPPED
^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0V12
Meaning
    As a result of a KILL command, the scenario which was active on terminal termid has been abnormally terminated.
Action
    None.

6.65   Messages VIRX9xxx
========================

VIRX903W linename STARTING A VIRPASS SERVICE OF LOCAL NAME xmident REMOTE NAME relayname IN JOB jobname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0X09
Meaning
    VIRTEL is starting a VIRPASS XM (cross-memory) connection to VIRKIX running in a CICS region in the same MVS image. linename is the name of the XM line, jobname is the job name of the CICS region, relayname is the name of the VIRPASS XM relay in VIRKIX, and xmident is the link name defined in the VIRPASS XM relay.
Action
    None.

VIRX907I linename DETACHING VXMTRECV SUBTASK
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0X09
Meaning
    VIRTEL is terminating a VIRPASS XM (cross-memory) connection as a result of a TERMAPI request. linename is the name of the XM line.
Action
    None.

VIRX908I linename DETACHING VXMTRECV SUBTASK
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0X09
Meaning
    VIRTEL is terminating a VIRPASS XM (cross-memory) connection as a result of a CLOSE request. linename is the name of the XM line.
Action
    None.

VIRX909I linename DETACHING VXMTRECV SUBTASK
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0X09
Meaning
    VIRTEL is terminating a VIRPASS XM (cross-memory) connection as a result of a CANCEL request. linename is the name of the XM line.
Action
    None.

VIRX912W linename CONTEXT: sessionid STARTED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0X09
Meaning
    A session has started on cross-memory line linename. The session identifier is sessionid.
Action
    None.

VIRX922W linename ENDING CONTEXT sessionid FOR jobname
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0X09
Meaning
    A session has ended on cross-memory line linename. The session identifier is sessionid. The job name of the session partner is jobname.
Action
    None.

VIRX923E ERROR ON linename REQ reqtype R15 r15code RETCODE retcode ERRNO xxxxxxxx (dddddddd)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ 
Module
    VIR0X09
Meaning
    An error has occurred on cross-memory line linename. reqtype is the VIRXM request type, r15code and retcode are hexadecimal return codes, xxxxxxxx is the hexadecimal error code, and dddddddd is the decimal value of the low- order byte of the error code.
Action
    Refer to the VIRXM User Guide manual to determine the meaning of the return code and error code for the specified request type.

VIRX924E ERROR ON linename CONTEXT sessionid REQ reqtype RETCODE retcode ERRNO xxxxxxxx (dddddddd)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIR0X09
Meaning
    An error has occurred on cross-memory line linename. with session identifier sessionid. reqtype is the VIRXM request type, retcode is the decimal return code, xxxxxxxx is the hexadecimal error code, and dddddddd is the decimal value of the low-order byte of the error code.
Action
    Refer to the VIRXM User Guide manual to determine the meaning of the return code and error code for the specified request type.

6.66   Messages VIRXOxxx
========================

VIRXO01I XOT INITIALISATION FOR linename (n-xxxxxx), VERSION 4.xx
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRXOT
Meaning
    The XOT line with external name linename and internal name n-xxxxxx has been initialised.
Action
    None.

VIRXO04I XOT LINE linename WAS STOPPED
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRXOT
Meaning
    The XOT line with external name linename was stopped, either by console command, or by setting the “Possible calls” parameter to 0 in the line definition.
Action
    None.

VIRXO05E linename UNDEFINED PARTNER n.n.n.n:p IS CALLING m.m.m.m:q
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRXOT
Meaning
    VIRTEL has rejected an incoming call from an XOT line. n.n.n.n:p represents the IP address and port of the caller (usually an XOT router), m.m.m.m:q represents the called IP address and port in VIRTEL. VIRTEL rejected the call because none of the XOT lines listening on address/port m.m.m.m:q specifies address n.n.n.n as partner.
Action
    Define an XOT line specifying m.m.m.m:q in the “Local ident” field and n.n.n.n:1998 in the “Remote ident” field. If necessary, use the xot-source parameter of the x25 route instruction in the router to ensure that the router presents the expected address to VIRTEL in its incoming calls. For additional information, refer to the section “Defining an XOT line” in the VIRTEL Connectivity Reference manual.

VIRXO06I linename (n-xxxxxx) IS USING A GENERIC ADDRESS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRXOT
Meaning
    The IP address and port number of the line with external name linename and internal name n-xxxxxx is treated as sharable with other TCP/IP lines as a result of the SHAREDA=Y parameter specified in the definition of line linename.
Action
    None.

VIRXO07I linename (n-xxxxxx) IS USING A GENERIC ADDRESS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRXOT
Meaning
    The IP address and port number of the line with external name linename and internal name n-xxxxxx is shared with another TCP/IP line. VIRTEL found the same address and port number specified in the definition of another line. Neither SHAREDA nor UNIQUEP were specified in the definition of line linename.
Action
    None.

VIRXO11I termid CLEAR RECEIVED FROM REMOTE linename CAUSE=xx DIAG=yy
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRXOT
Meaning
    VIRTEL received an X25 CLEAR command from the router attached to the XOT line with external name linename. VIRTEL determined that the command was associated with CVC terminal termid. xx and yy are the X25 cause and diagnostic codes in hexadecimal. This message is suppressed if the cause and diagnostic codes are zero and the SILENCE parameter is specified in the VIRTCT.
Action
    If the cause and diagnostic codes are zero, this indicates a normal end of call from the remote partner. Otherwise, use the cause and diagnostic codes to determine why the router or the remote partner application issued the CLEAR.

VIRXO51I termid CALLING x25callednumber VIA ROUTER ipaddr:port
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRXOT
Meaning
    VIRTEL is placing an outbound call to X25 number x25callednumber via the router whose IP address and port number is ipaddr:port. termid is the name of the VIRTEL terminal which represents the virtual circuit.
Action
    None.

VIRXO52I linename DECONNECTING termid
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRXOT
Meaning
    Terminal termid has been disconnected from the XOT line whose external name is linename.
Action
    None.

VIRXO53E linename HAS NO MORE PSEUDO TERMINALS
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRXOT
Meaning
    There are no more terminals associated with the XOT line whose external name is linename.
Action
    Check the line definition. Add more terminals if necessary.

VIRXO98E termid ERROR errcode RECEIVING FROM SOCKET sockno
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRXOT
Meaning
    An error occurred when receiving a message from the router on an XOT line. termid is the name of the virtual circuit, if available, otherwise it is the external name of the XOT line. errcode is an error code whose meaning is:

    - 000D0001 : No session exists for this line.
    - 000D0002 : Unable to identify incoming message with an existing session.
    - 000D0003 : No more pseudo terminals, or line not linked to TCP.
    - 000D0004 : TCP/IP receive error; see preceding message VIRT923E or VIRT924E.
    - 000D0005 : Socket is closed.
    - 000D0006 : A message received on the XOT line does not conform to the XOT protocol. Either the version number in the XOT header is invalid, or the message length exceeds the negotiated packet size.

Action
    If the cause cannot be determined by preceding messages, use the VIRTEL SNAP command to produce a dump of the internal trace table. Determine whether the router sent an invalid XOT message, and if so, perform the appropriate router diagnostic procedures. Otherwise contact technical support.

VIRXO99E termid ERROR errcode SENDING TO SOCKET sockno
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Module
    VIRXOT
Meaning
    An error occurred when sending a message to the router on an XOT line. termid is the name of the virtual circuit, if available, otherwise it is the external name of the XOT line. errcode is an error code whose meaning is:

    - 000B0001 : Invalid pseudo terminal.
    - 000B0002 : Message not identified with an active session.
    - 000B0003 : Line not linked to TCP stack.
    - 000B0004 : TCP/IP send error; see preceding message VIRT923E or VIRT924E.
    - 000B0005 : VIRTEL internal task dispatching error.
    - 000B0006 : Session cleared before message could be sent.

Action
    If the cause cannot be determined by preceding messages, use the VIRTEL SNAP command to produce a dump of the internal trace table and contact technical support.


A. Appendix
===========

A.1 Trademarks
--------------

SysperTec, the SysperTec logo, syspertec.com and VIRTEL are trademarks or registered trademarks of SysperTec Communication Group, registered in France and other countries.

IBM, VTAM, CICS, IMS, RACF, DB2, MVS, WebSphere, MQSeries, System z are trademarks or registered trademarks of International Business Machines Corp., registered in United States and other countries.

Adobe, Acrobat, PostScript and all Adobe-based trademarks are either registered trademarks or trademarks of Adobe Systems Incorporated in the United States and other countries.

Microsoft, Windows, Windows NT, and the Windows logo are trademarks of Microsoft Corporation in the United States and other countries.

UNIX is a registered trademark of The Open Group in the United States and other countries. Java and all Java-based trademarks and logos are trademarks or registered trademarks of Oracle and/or its affiliates.

Linux is a trademark of Linus Torvalds in the United States, other countries, or both. 

Other company, product, or service names may be trademarks or service names of others.

A.2. Open Source Software
-------------------------

The current VIRTEL Web Access product uses the following open source software:

- jQuery 
    Under MIT license - https://jquery.org/license/
- StoreJson
    Under MIT license - https://github.com/marcuswestin/store.js/commit/baf3d41b7092f0bacd441b768a77650199c25fa7
- jQuery_UI
    Under MIT license - http://en.wikipedia.org/wiki/JQuery_UI

.. |image0| image:: images/media/image1.jpeg
   :width: 8.26389in
   :height: 0.85000in
.. |image1| image:: images/media/image2.jpeg
   :width: 3.49562in
   :height: 1.01500in
.. |image_01| image:: images/media/image01.png
.. |image_02| image:: images/media/image02.png
.. |image_03| image:: images/media/image03.png
.. |image_04| image:: images/media/image04.png
.. |image_05| image:: images/media/image05.png
.. |image_06| image:: images/media/image06.png
.. |image_07| image:: images/media/image07.png
.. |image_08| image:: images/media/image08.png   