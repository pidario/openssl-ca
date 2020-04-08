# Minimal makefile for Sphinx documentation

# You can set these variables from the command line.
SPHINXOPTS  ?=
SPHINXBUILD ?= sphinx-build
SPHINXINTL  ?= sphinx-intl
PIP         ?= pip3

SOURCEDIR   = .
BUILDDIR    = _build

# make gettext -> generate pot file
# make -e SPHINXOPTS="-D language='it'" html -> build italian language html

install:
	@$(PIP) install sphinx sphinx-intl sphinx_rtd_theme

po:
	@$(SPHINXINTL) update -p $(BUILDDIR)/gettext -l en -l it

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help install po Makefile

# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option. $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
