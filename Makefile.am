XTRA_ELFILES	= eshell-auto.el esh-groups.el auto-autoloads.el
DISTCLEANFILES	= $(XTRA_ELFILES) $(XTRA_ELFILES:.el=.elc) $(TESTS)
EXTRA_DIST	= _pkg.el $(XTRA_ELFILES) autogen.sh FEATURES esh-maint.el
BUILT_SOURCES	= eshell-auto.el esh-groups.el
CLEANFILES	= TAGS $(BUILT_SOURCES)
info_TEXINFOS	= eshell.texi

dist_lisp_LISP =	\
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

TAGS: $(dist_lisp_LISP)
	@etags $(dist_lisp_LISP)
	@echo TAGS rebuilt.

eshell-auto.el: $(ELFILES)
	echo ";;; DO NOT MODIFY THIS FILE" > $(top_builddir)/eshell-auto.el
	echo "(if (featurep 'eshell-auto) (error \"Already loaded\"))" \
		>> $(top_builddir)/eshell-auto.el
	$(EMACS) -batch -L $(srcdir) -l esh-maint.el \
		-f eshell-generate-autoloads \
		$(top_builddir)/eshell-auto.el $(srcdir)
	echo "(provide 'eshell-auto)" >> $(top_builddir)/eshell-auto.el
	ln -f $(top_builddir)/eshell-auto.el $(top_builddir)/auto-autoloads.el

esh-groups.el: $(ELFILES)
	$(EMACS) -batch -L $(srcdir) -l esh-maint.el -f batch-byte-compile \
		$(srcdir)/esh-module.el

TESTS = eshell-test

eshell-test:
	echo "$(EMACS) -batch -L . -l esh-test.el --eval '(eshell-test)'" > $@
	chmod u+x $@

# Makefile.am ends here
