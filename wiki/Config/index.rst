***************************
Configuration
***************************

The approach
=============
To configure your own documentation project, all you need to do is
configure global settings in ``conf.py``, add your text files under
``wiki/`` and issue ``docker compose restart``. 

You don't need to customize ``conf.py``, but you'll be stuck with the 
default theme and credit to "The Wizard."

If you are just building one page, you can add your file to the existing
file structure, so you can observe your pages in a mildly complex
``toctree``. 

.. toctree::
   :maxdepth: 3
   :caption: Contents:
   
   edit-conf.md

