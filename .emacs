;; .emacs
;; top-level / loadpath
(defconst dl/emacs-dir (concat (getenv "HOME") "/.emacs.d/"))

(defun dl/emacs-subdir (d) (expand-file-name d dl/emacs-dir))
;; + subdirs
(let* ((subdirs '("elisp" "vendor" "backups" "snippets" "ac-dict"))
       (fulldirs (mapcar (lambda (d) (dl/emacs-subdir d)) subdirs)))
  (dolist (dir fulldirs)
    (when (not (file-exists-p dir))
      (message "Make directory: %s" dir)
      (make-directory dir))))

;; custom in .emacs.d
(setq custom-file (expand-file-name "custom.el" dl/emacs-dir))
(when (file-exists-p custom-file)
  (load custom-file))

;; init || themes || vendor
(add-to-list 'load-path (dl/emacs-subdir "elisp")) 
(add-to-list 'custom-theme-load-path (dl/emacs-subdir "themes"))

;; package init
(require 'package)
(setq package-archives '(("org"       . "http://orgmode.org/elpa/")
                         ("gnu"       . "http://elpa.gnu.org/packages/")
                         ("melpa"     . "http://melpa.milkbox.net/packages/")
	                 ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("tromey"    . "http://tromey.com/elpa/")))

;; initialize && refresh && install
(package-initialize)

;; use-package
(unless (package-installed-p 'use-package)
  (package-refresh-contents)
  (package-install 'use-package))
(require 'use-package)

;; mail-addr
(if (equal "dled" user-login-name)
    (setq user-mail-address "dt@ledbetter.co")
  (setq user-mail-address "dt@ledbetter.co"))

;; initialize
(load-file "~/.emacs.d/elisp/init-main.el")

;;; .emacs ends here
