DISTCLEANFILES	= $(ELFILES:.el=.elc) \
		  eshell-auto.el  esh-groups.el  auto-autoloads.el \
		  eshell-auto.elc esh-groups.elc auto-autoloads.elc
EXTRA_DIST      = _pkg.el
BUILT_SOURCES   = eshell-auto.el
CLEANFILES      = TAGS
info_TEXINFOS	= eshell.texi

lisp_LISP =		\
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

eshell-auto.el: $(ELFILES) Makefile
	echo ";;; DO NOT MODIFY THIS FILE" > eshell-auto.el
	echo "(if (featurep 'eshell-auto) (error \"Already loaded\"))" \
		>> eshell-auto.el
	$(EMACS) -batch -L . -l esh-maint.el \
		-f eshell-generate-autoloads ./eshell-auto.el .
	echo "(provide 'eshell-auto)" >> eshell-auto.el
	ln -f eshell-auto.el auto-autoloads.el

lisp_TESTS = eshell-test.el

eshell-test.el:
	echo "$(EMACS) -batch -L . -l esh-test.el --eval '(eshell-test)'" > $@
	chmod u+x $@

# Makefile.am ends here
