# Configuring Sphinx

## Editing conf.py
 
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

* ``html_theme`` is where you set the theme for your static pages. ``alabaster`` is the
  default theme, but I have already installed an additional theme `furo`.

* Static paths are important because they are files that get copied over to 
  Sphinx' ``build/html`` directory.


```python
 # -- Options for HTML output -------------------------------
 # https://www.sphinx-doc.org/en/master/usage/configuration.html#options-for-html-output

 html_theme = 'alabaster'
 html_static_path = ['_static']
```

