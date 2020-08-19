Virtel documentation project
============================

Installing the RTD theme template.

Issue the following PIP command:-

pip install sphinx-rtd-theme

Converting PDFs to DOCX
-----------------------

Use `Smallpdf <https://smallpdf.com>`_


Converting DOCX to RST
----------------------

Source docx files are c:\Virtel\foo_manuals

pandoc foo.docx -o foo.rst --extract-media=images

Use the build_howto bat files. Run from GitHub\Virtel directory.

Warning - Take a backup of the DOCS directory before running. - Will destroy all of your modifications as directories are deleted. Once you are OK you can delete the backup docs. You can also recover from GITHUB.


GitHub
------

Use `GitHub <https://github.com/ed-syspertec>`_

https://github.com/ed-syspertec

ed-syspertec ed.holt@syspertec.com/l7777 

Repositories - Virtel


readthedocs
-----------

`readthedocs <https://readthedocs.org>`_

ed-syspertec/l7777

`Virtel <http://virtel.readthedocs.io>`_

make
----

Use the make command to prepare the HTML for the Read The Docs Website.


make clean	Clean directories
make html	Build files

Building PDFs with Sphinx
=========================

Sphinx Build
------------

From within the directory issue the command:-

::

	sphinx-build -b latex . latex 

Then open TexWorks folder and process the .tex file to create the PDF. Select LuaLaTex+... in the drop down.
 
================================
ReStructuredText Markup Language
================================

Headers
=======

1. Incoming calls
=================

1.1 Introduction
----------------

1.1.1. VIRTEL Web Access (VWA)
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

Notes and Warnings
==================

.. note::

    Reproduction, transfer, distribution, or storage, in any form, of all or any part of 
    the contents of this document, except by prior authorization of SysperTec 
    Communication, is prohibited.

.. danger:: This book is currently under construction. Do not use!   


Labels
======

.. _V456UG_Introduction:

Fonts
=====

**VIRTEL User Guide**

*Virtel User Guide*

References
==========

:ref:`Creating HTML and XML templates <#_V456UG_creating_HTML>`

Literal Blocks
==============

::
    http://ipaddr:port/pagename


