***********************************
Customizing Wizardlab-docs
***********************************

Introduction
=============
Sphinx is a popular html engine for publishing documentation pages. Sphinx runs on
Python, and plays nice with being containerized. About a year ago, I was introduced
to this type of website through my work.

My public website `billthewizard.net <https://billthewizard.net>`_ is generated using
a similar system to what I present here. I enjoy the simplicity of publishing pages
with Sphinx. I can open up my terminal, write down my ideas, and Sphinx formats it into
a beautiful webpage.

One gripe that I had with my old system is that I managed the container and files without
``docker compose``. Managing Python, the source files, the html, and configuration was
a little painful. I'd execute the same little shell scripts to run ``docker`` commands.

My approach with wizardlab-docs boils things down to just the conf.py file and 
two directories. If something needs to be tweaked, the settings are all acessible.

Being able to quickly ``docker compose up -d``, open up a browser, and view generated pages
is super helpful.

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

