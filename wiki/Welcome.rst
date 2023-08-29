Welcome
=========

Wizardlab-docs is a base project for developing static documentation
pages with Docker and Sphinx.

What you're viewing at "localhost:5000" is the generated html files that 
were produced by Sphinx as configured by `build/docs/conf.py` from the
source files placed under `wiki/`.

Docker does all the heavy lifting though configuration we set in ``compose.yaml``.

``compose.yaml`` leverages the ``Dockerfile`` and DockerHub to build two containers:

* ``wizardlab-doc-sphinx-1`` generates the html files
* ``wizardlab-doc-httpd-1`` hosts them using apache2

The generated html can be examined under ``html/``


Resources
------------
Learn about **.rst**:
`Sphinx's reStructuredText Primer <https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html>`_

Learn about **.md**:
`Writing on Github: Basic formatting syntax <https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax>`_

