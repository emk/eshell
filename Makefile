# Makefile for Eshell lisp code

# Copyright (C) 1998-1999  John Wiegley <johnw@gnu.org>

# This file is free software; you can redistribute it and/or modify it
# under the terms of the GNU General Public License as published by the
# Free Software Foundation; either version 2, or (at your option) any
# later version.

# This file is distributed in the hope that it will be useful, but WITHOUT
# ANY WARRANTY; without even the implied warranty of MERCHANTABILITY or
# FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public License
# for more details.

# You should have received a copy of the GNU General Public License
# along with GNU Emacs; see the file COPYING.  If not, write to
# the Free Software Foundation, 675 Mass Ave, Cambridge, MA 02139, USA.

prefix  = /usr/local
datadir = $(prefix)/share

# the directory where you install third-party emacs packges
lispdir = $(datadir)/emacs/site-lisp

# the directory where you install the info doc
infodir = $(prefix)/info
docdir	= $(prefix)/doc

EMACS	 = emacs
MAKEINFO = makeinfo
TEXI2DVI = texi2dvi
SHELL	 = /bin/sh
DVIPS	 = dvips
CP	 = cp
MKDIR	 = mkdir -p
ETAGS	 = etags

######################################################################
###        No changes below this line should be necessary          ###
######################################################################

PACKAGE = eshell

# the directory where the .elc files will be installed
elcdir  = $(lispdir)/$(PACKAGE)
eldir   = $(elcdir)

MARGS   = --no-init-file --no-site-file -L . -l esh-maint.el -batch
BEMACS  = $(EMACS) $(MARGS)
ELC	= $(BEMACS) -f batch-byte-compile

ELFILES =		\
	eshell.el	\
	esh-arg.el	\
	esh-cmd.el	\
	esh-ext.el	\
	esh-io.el	\
	esh-mode.el	\
	esh-module.el	\
	esh-opt.el	\
	esh-proc.el	\
	esh-test.el	\
	esh-toggle.el	\
	esh-util.el	\
	esh-var.el	\
	em-alias.el	\
	em-banner.el	\
	em-basic.el	\
	em-cmpl.el	\
	em-dirs.el	\
	em-glob.el	\
	em-hist.el	\
	em-ls.el	\
	em-pred.el	\
	em-prompt.el	\
	em-rebind.el	\
	em-script.el	\
	em-smart.el	\
	em-term.el	\
	em-unix.el	\
	em-xtra.el

ELCFILES = $(ELFILES:.el=.elc)

TEXEXTS =  *.cps *.fns *.kys *.vr *.tp *.pg *.log *.aux *.toc *.cp *.ky *.fn *.vrs

.SUFFIXES: .elc .el .info .ps .dvi .texi
.PHONY: elcfiles info clean distclean default
.PHONY: install_elc install install_el install_info

.el.elc:
	$(ELC) $<

.texi.info:
	$(MAKEINFO) $<

.texi.dvi:
	$(TEXI2DVI) $<

.dvi.ps:
	$(DVIPS) -f $< >$@

######################################################################

default: eshell-auto.el elcfiles

dist: eshell-auto.el

eshell-auto.el: $(ELFILES)
	echo ";;; DO NOT MODIFY THIS FILE" > eshell-auto.el
	echo "(if (featurep 'eshell-auto) (error \"Already loaded\"))" \
		>> eshell-auto.el
	$(BEMACS) -f eshell-generate-autoloads ./eshell-auto.el .
	echo "(provide 'eshell-auto)" >> eshell-auto.el
	ln -f eshell-auto.el auto-autoloads.el

elcfiles: Makefile $(ELFILES)
	$(ELC) $(ELFILES)

info: $(PACKAGE).info

install_elc: $(ELCFILES) eshell-auto.el _pkg.el
	$(MKDIR) $(elcdir)
	$(CP) $(ELCFILES) auto-autoloads.el \
		eshell-auto.el _pkg.el $(elcdir)/

install_el: $(ELFILES)
	$(MKDIR) $(eldir)
	$(CP) $(ELFILES) $(eldir)/

install_info: $(PACKAGE).info
	$(MKDIR) $(infodir)
	$(CP) *.info* $(infodir)/
	-[ ! -w $(infodir)/dir ] || install-info $(PACKAGE).info $(infodir)/dir

install: install_elc install_info install_el

TAGS tags:
	$(ETAGS) $(ELFILES)

clean:
	$(RM) *~ core .\#* $(TEXEXTS)

distclean: clean
	$(RM) *.elc *.dvi *.info* *.texi *.ps README TAGS
	$(RM) eshell-auto.el* esh-groups.el* auto-autoloads.el*
