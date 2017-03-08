How to activate VIRTEL https using AT-TLS
=========================================    

    \ |image0|

    |image1|\ *VIRTEL*

1. **How to activate VIRTEL https using AT-TLS on z/OS V1R7**

   1. .. rubric:: Software pre-requisites
         :name: software-pre-requisites

    To provide secure HTTP (https) sessions to client browsers, VIRTEL
    uses the Application Transparent Transport Layer Security (AT-TLS)
    feature of z/OS Communication Server. AT-TLS is included with z/OS
    V1R7 and later releases.

    AT-TLS allows socket applications to access encrypted sessions by
    invoking system SSL within the transport layer of the TCP/IP stack.
    The Policy Agent decides which connections are to use AT-TLS, and
    provides system SSL configuration for those connections. The
    application continues to send and receive clear text over the
    socket, but data sent over the network is protected by system SSL.
    The supported protocols are TLS, SSLv3, and SSLv2.

1. .. rubric:: Installation steps
      :name: installation-steps

   1. .. rubric:: Install Policy Agent procedure
         :name: install-policy-agent-procedure

    If you do not already have the Communications Server Policy Agent
    (PAGENT) active in your z/OS system, copy the cataloged procedure
    EZAPAGSP from TCPIP.SEZAINST into your proclib, renaming it as
    PAGENT.

Create the Policy Agent configuration file
------------------------------------------

    If you do not already run the Policy Agent, you will need to create
    a configuration file /etc/pagent.conf using z/OS Unix System
    Services. If you already run Policy Agent, you will need to find the
    existing configuration file and add the TTLS definitions to it.

    Step PCONFIG in the SSLSETUP sample job contains a starter
    configuration. The following changes should be made:

-  Replace %virtjob% by the name of your VIRTEL started task (SSLSETUP
   line 70)

-  Replace *41000-41002* by *41002* in the LocalPortRange parameter
   (SSLSETUP line 71) to activate AT-TLS for VIRTEL line C-HTTP

-  Replace *ServerWithClientAuth* by *Server* in the HandshakeRole
   parameter (SSLSETUP line 82) as we will not be using Client
   Certificates.

   1. .. rubric:: Allow the Policy Agent to run during TCP/IP
         initialization
         :name: allow-the-policy-agent-to-run-during-tcpip-initialization

    The Policy Agent must be given READ access to the resource
    EZB.INITSTACK.\* in RACF class SERVAUTH. See step EZBAUTH in the
    SSLSETUP sample job (delivered in VIRTEL SAMPLIB).

Create the server certificate
-----------------------------

    A server certificate for VIRTEL must be created, signed by a
    certificate authority, and stored in the RACF database. In the
    SSLSETUP sample job we create a signing certificate and use RACF
    itself as the certificate authority. Alternatively, you may use an
    external certificate authority such as Verisign to create and sign
    the certificate, then import it into RACF.

    At SSLSETUP line 228, replace %virtssl% by the DNS name assigned to
    the VIRTEL host (for example, virtssl.syspertec.com)

Add the certificate to the keyring
----------------------------------

    The server certificate must be added to the VIRTRING keyring. See
    step CCERTIF in the SSLSETUP sample job.

Allow VIRTEL to access its own certificate
------------------------------------------

    To allow VIRTEL to access its own keyring and server certificate,
    the VIRTEL started task must have READ access to the resource
    IRR.DIGTCERT.LISTRING in the RACF class FACILITY. See step IRRAUTH
    in the SSLSETUP sample job.

Activate AT-TLS
---------------

    To activate AT-TLS, add the following statements to TCPIP PROFILE:

    TCPCONFIG TTLS

    AUTOLOG 5 PAGENT ENDAUTOLOG

    Stop and restart TCP/IP to activate the TCPCONFIG TTLS profile
    statement. The AUTOLOG statement will cause the PAGENT procedure to
    be started automatically during TCP/IP initialization.

1. .. rubric:: Operations
      :name: operations

   1. .. rubric:: Starting the Policy Agent
         :name: starting-the-policy-agent

    The AUTOLOG statement in the TCP/IP profile will start the PAGENT
    procedure automatically at TCP/IP initialization. Alternatively you
    can issue the MVS command S PAGENT.

    *Note:* if this is the first time you have activated the SERVAUTH
    class, you are likely to see RACF failure messages during TCP/IP
    initialization indicating that other applications are unable to
    access the resource EZB.INITSTACK. This is normal, because
    Communications Server uses this mechanism to prevent applications
    from accessing TCP/IP before the Policy Agent is started. Do not be
    tempted to authorize applications to use this RACF resource. Either
    ignore the messages (they will go away once PAGENT has started), or
    ensure that PAGENT starts before all other applications.

Altering the Policy Agent configuration
---------------------------------------

    To make changes to the Policy Agent configuration file, either edit
    and resubmit the PCONFIG step of the SSLSETUP sample job, or use the
    TSO ISHELL command to edit the file /etc/pagent.conf directly from
    ISPF.

    After you make changes to the Policy Agent configuration, use the
    MVS command F PAGENT,REFRESH to force PAGENT to reread the file.

Logon to VIRTEL using secure session
------------------------------------

    To access VIRTEL line C-HTTP you must now use URL
    *https://n.n.n.n:41002* instead of *http://n.n.n.n:41002* (where

    n.n.n.n is the IP address of the z/OS host running VIRTEL).

1. .. rubric:: Problem determination
      :name: problem-determination

   1. .. rubric:: Policy Agent log file
         :name: policy-agent-log-file

    Policy Agent startup messages are written to the /tmp/pagent.log
    file of z/OS Unix System Services. You can use the TSO ISHELL
    command to browse this file from ISPF.

Common error messages
---------------------

    Error messages relating to session setup are written to the MVS
    SYSLOG. The most common error message is:

    EZD1287I TTLS Error RC: nnn event

    where nnn represents a return code. Return codes under 5000 are
    generated by System SSL and are defined in the System SSL
    Programming manual. Return codes over 5000 are generated by AT-TLS
    and are defined in the IP Diagnosis Guide. Some commonly encountered
    return codes are:

7. No certificate

8. Certificate not trusted

    109 No certification authority certificates

    202 Keyring does not exist

    401 Certificate expired or not yet valid

    402 or 412 Client and server cannot agree on cipher suite

    416 VIRTEL does not have permission to list the keyring

    431 Certificate is revoked

    434 Certificate key not compatible with cipher suite

    435 Certificate authority unknown

    5003 Browser sent clear text (http instead of https)

Cipher suite
------------

    The client and server cipher specifications must contain at least
    one value in common. The TTLSEnvironmentAdvancedParms parameter of
    the Policy Agent configuration file allows you to turn on or off the
    SSLv2, SSLv3, and TLSv1 protocols at the server end. The list of
    supported cipher suites for each protocol is in the TTLSCipherParms
    parameter. Check the /tmp/pagent.log file to determine whether any
    cipher suites were discarded at startup time.

    In Microsoft Internet Explorer, follow the menu *Tools – Internet
    Options – Advanced*. Under the security heading there are three
    options which allow you to enable or disable the SSL 2.0, SSL 3.0,
    and TLS 1.0 protocols. You cannot enable or disable individual
    cipher suites.

    In Firefox the cipher specifications are accessed by typing
    *about:config* in the address bar and typing *security* in the
    filter box. By default, ssl2 is disabled, and ssl3 and tls are
    enabled. By default, all weak encryption cipher suites are disabled,
    and 128-bit or higher cipher suites are enabled.

Bibliography
============

-  ***SA22-7683-07 z/OS V1R7 Security Server: RACF Security
   Administrator's Guide*** Chapter 21. RACF and Digital Certificates

-  .. rubric:: *SC24-5901-04 z/OS V1R6 Cryptographic Services:* System
      SSL Programming
      :name: sc24-5901-04-zos-v1r6-cryptographic-services-system-ssl-programming

    Chapter 12. Messages and Codes

-  .. rubric:: *SC31-8775-07 z/OS V1R7 Communications Server:* IP
      Configuration Guide
      :name: sc31-8775-07-zos-v1r7-communications-server-ip-configuration-guide

    Chapter 14. Policy-based networking

    Chapter 18. Application Transparent Transport Layer Security
    (AT-TLS) data protection

-  .. rubric:: *SC31-8776-08 z/OS V1R7 Communications Server:* IP
      Configuration Reference
      :name: sc31-8776-08-zos-v1r7-communications-server-ip-configuration-reference

    Chapter 21. Policy Agent and policy applications

-  .. rubric:: *GC31-8782-06 z/OS V1R7 Communications Server:* IP
      Diagnosis Guide
      :name: gc31-8782-06-zos-v1r7-communications-server-ip-diagnosis-guide

    Chapter 28. Diagnosing Application Transparent Transport Layer
    Security (AT-TLS)

-  .. rubric:: *SC31-8784-05 z/OS V1R7 Communications Server:* IP
      Messages: Volume 2 (EZB, EZD)
      :name: sc31-8784-05-zos-v1r7-communications-server-ip-messages-volume-2-ezb-ezd

    Chapter 10. EZD1xxxx messages

.. |image0| image:: images/media/image1.png
   :width: 4.16534in
   :height: 0.80000in
.. |image1| image:: images/media/image2.jpeg
   :width: 1.48500in
   :height: 1.08667in
