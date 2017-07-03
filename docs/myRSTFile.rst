Example File
============
.. contents::

.. section-numbering::

.. footer::

 Page: ###Page###/###Total###, Example file.

Section/Header 1
----------------

Texts underlined with '=' will be main header and 
Texts underlined with '-' are Sub-section.

Sub-section
~~~~~~~~~~~

Texts underlined with '~' will be Sub-sub-section

Text format
------------

Texts enclosed within **bold** will be Bold.
And those enclosed within *italic* will be Italicized

* ``Texts in double block-quote`` will lok different.

Auto numbering
~~~~~~~~~~~~~~
#. '#' will number the line automaticaly
#. this will be line number 2. 

Images
~~~~~~

.. image:: logo.png

you can specify attribute of image also

.. image:: logo.png
   :height: 140px
   :width: 250px
   :scale: 100
   :alt: alternate text

you can put inline images also:

Assuming |logo.png| is already there on your machine.

.. |logo.png| image:: logo.png
   :height: 10px
   :width: 10px

Block
~~~~~

* you can put any text like command in box using '::'. 
For example, to convert .rst to PDF enter following command ::

 rst2pdf myFile.rst

* you can number the line as follow:

.. code-block:: c
 :linenos:

 #include 
 int main() {
 printf("Hello World\n");
 return 0;
 }

Links
~~~~~

**Links** can be put in following manner

My Blog ``_

you can put **reference link** like this way.
For example, you can visit my blog  [#]_

.. [#] `<http://khuntronak.blogspot.com/>`_

Lists
~~~~~

* a bullet point using "*"

  - a sub-list using "-"

    + yet another sub-list

  - another item

