# Wizardlab-docs
[github.com/ashemath/wizardlab-docs](https://github.com/ashemath/wizardlab-docs)

Wizardlab-docs is a base project for developing static documentation
pages with Docker and Sphinx. 

After cloning this repo, issue a `docker compose up -d`, and navigate to 
`http://locahost:5000` in a web browser.

What you are viewing are html files Sphinx built as configured by `build/docs/conf.py`
from the source files placed under `wiki/`.

Docker does all the heavy lifting though configuration we set in ``compose.yaml``.

``compose.yaml`` leverages the ``Dockerfile`` and DockerHub to build two containers:

* ``wizardlab-doc-sphinx-1`` generates the html files
* ``wizardlab-doc-httpd-1`` hosts them using apache2

The generated html can be examined under ``html/``

![Screenshot of creating documentation pages with wizardlab-docs](/images/sphinx-doc.png)

## Resources
Learn about **.rst**:
[Sphinx's reStructuredText Primer](https://www.sphinx-doc.org/en/master/usage/restructuredtext/basics.html)

Learn about **.md**:
[Writing on Github: Basic formatting syntax](https://docs.github.com/en/get-started/writing-on-github/getting-started-with-writing-and-formatting-on-github/basic-writing-and-formatting-syntax)

## Configuring Sphinx

Configuring Sphinx is a matter of adjusting a single file ``conf.py``. 
This file normally lives under the ``docs/source/`` directory, which 
is where the source files for your documentation would go.

In wizardlab-docs, I stash a golden-copy of conf.py in the ``build/docs/`` 
folder, and I copy it over to the container's ``/doc/source/`` just prior to zapping the 
container with a command ``make html``.

After building the html, I clean up the copied ``conf.py`` prior to mounting
the html onto the ``httpd`` container. 

To view how we accomplish this shuffling of files, see ``compose.yaml``


### Editing conf.py
 
The conf.py file that you need to edit lives under `build/docs/conf.py`

### Project Information
[sphinx-doc/usage/configuration/project-information](https://www.sphinx-doc.org/en/master/usage/configuration.html#project-information)

The Project Information section configures properties that add attribution to your project:

```python
 # -- Project information -----------------------------------
 html_title = 'Wizardlab Docs'
 project = 'wizardlab-docs'
 copyright = '2023, The Wizard'
 author = 'Wizard Lab'
 release = '2023'
```
Edit the strings as needed. These settings will effect the `footer` and the 
Title of your documentation pages.

### General Configuration
The general configuration section allows you to define extensions for Sphinx like 
``myst_parser`` which allows you to build html from ``.md`` files.

* ``templates_path`` effects how themes are staged
* ``exclude_patterns`` allows you to instruct the engine to ignore source files. 
  For example, you could use a ``_draft_*.rst`` exclude pattern to indicate that files
  that begin with ``_draft`` should be excluded from the ``toctree``.
* ``source_suffix`` provides a mapping between file extensions and documentation parsers.

[sphinx-doc/usage/configuration/general-configuration](https://www.sphinx-doc.org/en/master/usage/configuration.html#general-configuration)

```python
 # -- General configuration ---------------------------------
 
 extensions = ['myst_parser']
 
 templates_path = ['_templates']
 exclude_patterns = []
 source_suffix = {
     '.rst': 'restructuredtext',
     '.txt': 'markdown',
     '.md': 'markdown',
 }
```
NOTE: In order for a plugin to function, will will need to ensure it's python package is being
installed in our ``Dockerfile``. See in ``build/Dockerfile`` where we install ``myst_parser``. 

### Options for HTML output
The HTML output options are where you set themes, and define static paths. 

* ``html_theme`` is where you set the theme for your static pages.
  ``alabaster`` is the default theme, but I have already installed an
  additional theme `furo` via the `Dockerfile`

* Static paths are important because they are files that get copied over to 
  Sphinx' ``build/html`` directory.

[sphinx-doc/usage/configuration/options-for-html-output](https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output
)

```python
 # -- Options for HTML output -------------------------------
 # https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

 html_theme = 'alabaster'
 html_static_path = ['_static']
```

