.. _#_howToATLS:

=============
How To - ATLS
=============
    
1. How to activate VIRTEL https using AT-TLS on z/OS V1R7
---------------------------------------------------------

**1.1 Software pre-requisites** 
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

**1.2 Installation steps**

*1.2.1 Install Policy Agent procedure*
    
    If you do not already have the Communications Server Policy Agent
    (PAGENT) active in your z/OS system, copy the cataloged procedure
    EZAPAGSP from TCPIP.SEZAINST into your proclib, renaming it as
    PAGENT.

*1.2.2 Create the Policy Agent configuration file*
    
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

*1.2.3 Allow the Policy Agent to run during TCP/IP initialization*
    
    The Policy Agent must be given READ access to the resource
    EZB.INITSTACK.\* in RACF class SERVAUTH. See step EZBAUTH in the
    SSLSETUP sample job (delivered in VIRTEL SAMPLIB).

*1.2.4 Create the server certificate*
    
    A server certificate for VIRTEL must be created, signed by a
    certificate authority, and stored in the RACF database. In the
    SSLSETUP sample job we create a signing certificate and use RACF
    itself as the certificate authority. Alternatively, you may use an
    external certificate authority such as Verisign to create and sign
    the certificate, then import it into RACF.

    At SSLSETUP line 228, replace %virtssl% by the DNS name assigned to
    the VIRTEL host (for example, virtssl.syspertec.com)

*1.2.5 Add the certificate to the keyring*
    
    The server certificate must be added to the VIRTRING keyring. See
    step CCERTIF in the SSLSETUP sample job.

*1.2.6 Allow VIRTEL to access its own certificate*
    
    To allow VIRTEL to access its own keyring and server certificate,
    the VIRTEL started task must have READ access to the resource
    IRR.DIGTCERT.LISTRING in the RACF class FACILITY. See step IRRAUTH
    in the SSLSETUP sample job.

*1.2.7 Activate AT-TLS*
    
    To activate AT-TLS, add the following statements to TCPIP PROFILE:

::

    TCPCONFIG TTLS
 
    AUTOLOG 5 PAGENT ENDAUTOLOG

Stop and restart TCP/IP to activate the TCPCONFIG TTLS profile
statement. The AUTOLOG statement will cause the PAGENT procedure to
be started automatically during TCP/IP initialization.

**1.3 Operations**

*1.3.1 Starting the Policy Agent*
    
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

*1.3.2 Altering the Policy Agent configuration*
    
    To make changes to the Policy Agent configuration file, either edit
    and resubmit the PCONFIG step of the SSLSETUP sample job, or use the
    TSO ISHELL command to edit the file /etc/pagent.conf directly from
    ISPF.

    After you make changes to the Policy Agent configuration, use the
    MVS command F PAGENT,REFRESH to force PAGENT to reread the file.

*1.3.3 Logon to VIRTEL using secure session*
    
    To access VIRTEL line C-HTTP you must now use URL

    *https://n.n.n.n:41002* instead of *http://n.n.n.n:41002* 

    (where n.n.n.n is the IP address of the z/OS host running VIRTEL).

**1.4 Problem determination**

*1.4.1 Policy Agent log file*
    
    Policy Agent startup messages are written to the /tmp/pagent.log
    file of z/OS Unix System Services. You can use the TSO ISHELL
    command to browse this file from ISPF.

*1.4.2 Common error messages*
    
    Error messages relating to session setup are written to the MVS
    SYSLOG. The most common error message is:

    EZD1287I TTLS Error RC: nnn event

    where nnn represents a return code. Return codes under 5000 are
    generated by System SSL and are defined in the System SSL
    Programming manual. Return codes over 5000 are generated by AT-TLS
    and are defined in the IP Diagnosis Guide. Some commonly encountered
    return codes are:

    7   No certificate

    8   Certificate not trusted

    109 No certification authority certificates

    202 Keyring does not exist

    401 Certificate expired or not yet valid

    402 or 412 Client and server cannot agree on cipher suite

    416 VIRTEL does not have permission to list the keyring

    431 Certificate is revoked

    434 Certificate key not compatible with cipher suite

    435 Certificate authority unknown

    5003 Browser sent clear text (http instead of https)

    5006 SSL failed to initialize. Check job SSLSETUP.

*1.4.3 Cipher suite*
    
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

**1.5 Client certificates**

*1.5.1 Extracting the userid from a client certificate*

Virtel can extract the userid of a user from a client certificate presented to Virtel during the SSL handshake. For this to occur the following must be true:-

- The HTTP session is secured using AT-TLS. URL = https://....
- The Policy Agent TTLSConnectionAction or TTLSEnvironmentAction statement contains the parameter "HandShakeRole ServerWithClientAuth"
- The client has provided a valid certificate.
- The security subsystem has validate the certificate as belonging to a user.
- The Virtel transaction has Security = 3 defined.

If these conditions are met then the userid contained within the clients digital certificate can be extracted by Virtel and used in the signon process. In this process it is normal that a PASS Ticket is generated and associated with the extracted userid.

*1.5.2 Example members*

See the SAMPLIB members SSLSETUP and SSLUCERT for examples on setting up AT-TLS and client certificates.

**1.6 Virtel AT-TLS Problem determination**

Virtel or AT-TLS can issue error messages if the environment has not been correctly setup. The following offers some guide lines on what to check for if secured sessions are not working.

*1.6.1 Debugging AT-TLS*

VIRHT57E LINE IS NOT SET UP FOR HTTPS means that the browser sent an https request, but it has not been decrypted by AT-TLS before being sent to VIRTEL, and VIRTEL has received the message in encrypted format. Normally this means the AT-TLS rules did not match the incoming request.

EZD1287I TTLS Error RC: 5003 is the opposite situation. It means that the AT-TLS rules matched the incoming request, and so AT-TLS was expecting to receive an https request, but it received an http request instead.

Normally AT-TLS is transparent to VIRTEL. AT-TLS performs the decryption and transforms the https request into an http request before passing it to VIRTEL. The only case where VIRTEL is AT-TLS aware is when the VIRTEL transaction definition specifies SECURITY=3 (TLS) and in this case VIRTEL will check that the session has been processed by AT-TLS and will issue an IOCTL to obtain the userid associated with the certificate.
In the normal case, you should specify HandshakeRole Server, ClientAuthType Full, and ApplicationControlled Off in the AT-TLS rules, as in the example in VIRT447.SAMPLIB(SSLSETUP).

VIRTEL does not issue an IOCTL to turn decryption on and off, so if you specified ApplicationControlled On then you would get VIRHT57E because AT-TLS has not been instructed to start decryption.

If you still get an error when you have ApplicationControlled Off then we will need to see the SYSLOG (for the EZD TTLS messages), the JESMSGLG from the VIRTEL started task, and the SYSPRINT resulting from a z/OS command F VIRTEL,SNAP immediately after the error occurs. We would also like to see the exact URL which was entered at the browser, as well as the AT-TLS pagent.conf file.

*1.6.2 Verifying AT-TLS is active*

To verify that AT-TLS is still activated, you can submit this MVS command:

::

    D TCPIP,,N,TTLS

The response is:

::

    EZD0101I NETSTAT CS V1R12 TCPIP 378 TTLSGRPACTION GROUP ID CONNS VIRTELGROUP 00000002 0 1 OF 1 RECORDS DISPLAYED END OF THE REPORT

The UNIX command 

::

    pasearch

displays the parameters used by PAGENT from /etc/pagent.conf

The TSO command:- 

::

    netstat conn

displays active connexions for the VIRTEL STC.

Once a connexion has been established between a client and a Virtel port, the TSO command:-

::

 netstat ttls conn nnnn detail 

where nnnn is the identification of the connexion will display the AT-TLS parameters used in the Virtel connexion.

**1.7 Bibliography**

::

  -  SA22-7683-07 z/OS V1R7 Security Server: RACF Security Administrator's Guide 
     Chapter 21. RACF and Digital Certificates
 
  -  SC24-5901-04 z/OS V1R6 Cryptographic Services: System SSL Programming
     Chapter 12. Messages and Codes
 
  -  SC31-8775-07 z/OS V1R7 Communications Server: IP Configuration Guide
     Chapter 14. Policy-based networking
     Chapter 18. Application Transparent Transport Layer Security (AT-TLS) data protection Configuration Reference
     Chapter 21. Policy Agent and policy applications
 
  -  GC31-8782-06 z/OS V1R7 Communications Server:* IP Diagnosis Guide
     Chapter 28. Diagnosing Application Transparent Transport Layer Security (AT-TLS)
 
  -  SC31-8784-05 z/OS V1R7 Communications Server: IP Messages: Volume 2 (EZB, EZD)
     Chapter 10. EZD1xxxx messages

**1.8 Related Material**

- :ref:`Pass tickets and supporting Proxy Servers – CA-SiteMinder© & IBM Tivoli WebSeal© <#_tn201407>`
- :ref:`Virtel TLS/SSL Security: Signing on using server and client certificates <#_tn201416>`    

.. |image00| image:: images/media/logo_virtel_web.png
            :scale: 50 % 