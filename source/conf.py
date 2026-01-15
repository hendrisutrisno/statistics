# -- General configuration ---------------------------------------------------

extensions = ["myst_parser", "sphinx.ext.mathjax"]

templates_path = ["_templates"]
exclude_patterns = []

source_suffix = {
    ".rst": "restructuredtext",
    ".md": "markdown",
}

# -- MyST configuration ------------------------------------------------------

myst_enable_extensions = ["dollarmath", "amsmath"]


# -- MathJax configuration ---------------------------------------------------

mathjax3_config = {
    "tex": {
        "inlineMath": [["$", "$"], ["\\(", "\\)"]],
        "displayMath": [["$$", "$$"], ["\\[", "\\]"]],
    }
}

# -- HTML output -------------------------------------------------------------

html_theme = "sphinx_rtd_theme"
html_static_path = ["_static"]
