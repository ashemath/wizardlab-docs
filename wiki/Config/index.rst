***********************************
Customizing Wizardlab-docs
***********************************

The approach
=============
To configure your own documentation project, all you need to do is
configure global settings in ``conf.py``, add your text files under
``wiki/``. 

Issue ``docker compose up -d`` to build your html under ``html/``
and send it to a webserver container. Your documentation is ready to view at:
``http://locahost:5000``.

In this project, I have abstracted all the file management, so you can focus on
the source directory: ``wiki/`` and the build directory ``html/``.

You don't need to customize ``conf.py``, but you'll be stuck with the 
default theme and credit to "The Wizard" if you do not.

The guide
============
.. toctree::
   :maxdepth: 3
   
   edit-conf.md

