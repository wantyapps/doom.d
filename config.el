;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets.
(setq user-full-name "Uri Arev"
      user-mail-address "me@wantyapps.xyz")

;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two:
;; (setq doom-font (font-spec :family "monospace" :size 12 :weight 'semi-light)
;;       doom-variable-pitch-font (font-spec :family "sans" :size 13))

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/Org/")

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; Here are some additional functions/macros that could help you configure Doom:
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(require 'smtpmail)
      ;; we installed this with homebrew
      (setq mu4e-mu-binary "/usr/local/bin/mu")

      ;; this is the directory we created before:
      (setq mu4e-maildir "~/.maildir")

      ;; this command is called to sync imap servers:
      (setq mu4e-get-mail-command (concat (executable-find "mbsync") " -a"))
      ;; how often to call it in seconds:
      (setq mu4e-update-interval 300)

      ;; save attachment to desktop by default
      ;; or another choice of yours:
      (setq mu4e-attachment-dir "~/Desktop")

      ;; rename files when moving - needed for mbsync:
      (setq mu4e-change-filenames-when-moving t)

      ;; list of your email adresses:
      (setq user-mail-address "me@wantyapps.xyz")
      (setq mu4e-get-mail-command "true")
      (setq smtpmail-smtp-service 587)
      (setq smtpmail-smtp-server "mail.wantyapps.xyz")

(map! :after tex
      :map TeX-mode-map
      "\"" nil)

(after! smartparens-latex
  (sp-local-pair '(tex-mode plain-tex-mode latex-mode LaTeX-mode)
                  "``" "''" :actions :rem))
(after! org
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/Org/"
        org-agenda-files (list org-directory)
        org-default-notes-file (expand-file-name "notes.org" org-directory)
        org-ellipsis " ▼ "
        org-log-done 'time
        org-journal-dir "~/Org/journal/"
        org-journal-date-format "%B %d, %Y (%A) "
        org-journal-file-format "%Y-%m-%d.org"
        org-hide-emphasis-markers t))


(set-face-attribute 'default nil
        :font "SauceCodePro Nerd Font"
        :weight 'medium)
(add-to-list 'default-frame-alist '(font . "SauceCodePro Nerd Font"))
