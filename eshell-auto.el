;;; DO NOT MODIFY THIS FILE
(if (featurep 'eshell-auto) (error "Already loaded"))

;;;### (autoloads (eshell-mode) "esh-mode" "esh-mode.el" (14774 50798))
;;; Generated autoloads from esh-mode.el

(autoload (quote eshell-mode) "esh-mode" "\
Emacs shell interactive mode.

\\{eshell-mode-map}" nil nil)

;;;***

;;;### (autoloads (eshell-test) "esh-test" "esh-test.el" (14679 21979))
;;; Generated autoloads from esh-test.el

(autoload (quote eshell-test) "esh-test" "\
Test Eshell to verify that it works as expected." t nil)

;;;***

;;;### (autoloads (eshell-toggle eshell-toggle-cd) "esh-toggle" "esh-toggle.el"
;;;;;;  (14763 2466))
;;; Generated autoloads from esh-toggle.el

(autoload (quote eshell-toggle-cd) "esh-toggle" "\
Calls `eshell-toggle' with a prefix argument.
See the command `eshell-toggle'" t nil)

(autoload (quote eshell-toggle) "esh-toggle" "\
Toggles between the *eshell* buffer and the current buffer.
With a prefix ARG also insert a \"cd DIR\" command into the eshell,
where DIR is the directory of the current buffer.

Call twice in a row to get a full screen window for the *eshell*
buffer.

When called in the *eshell* buffer returns you to the buffer you were
editing before caling the first time.

Options: `eshell-toggle-goto-eob'" t nil)

;;;***

;;;### (autoloads (eshell-report-bug eshell-command-result eshell-command
;;;;;;  eshell) "eshell" "eshell.el" (14822 57769))
;;; Generated autoloads from eshell.el

(autoload (quote eshell) "eshell" "\
Create an interactive Eshell buffer.
The buffer used for Eshell sessions is determined by the value of
`eshell-buffer-name'.  If there is already an Eshell session active in
that buffer, Emacs will simply switch to it.  Otherwise, a new session
will begin.  A new session is always created if the the prefix
argument ARG is specified.  Returns the buffer selected (or created)." t nil)

(autoload (quote eshell-command) "eshell" "\
Execute the Eshell command string COMMAND.
With prefix ARG, insert output into the current buffer at point." t nil)

(autoload (quote eshell-command-result) "eshell" "\
Execute the given Eshell COMMAND, and return the result.
The result might be any Lisp object.
If STATUS-VAR is a symbol, it will be set to the exit status of the
command.  This is the only way to determine whether the value returned
corresponding to a successful execution." nil nil)

(autoload (quote eshell-report-bug) "eshell" "\
Report a bug in Eshell.
Prompts for the TOPIC.  Leaves you in a mail buffer.
Please include any configuration details that might be involved." t nil)

;;;***

;;;### (autoloads nil "_pkg" "_pkg.el" (14406 44719))
;;; Generated autoloads from _pkg.el

(if (fboundp (quote package-provide)) (package-provide (quote eshell) :version 2.1 :type (quote regular)))

;;;***
(provide 'eshell-auto)
