(setq user-full-name "Uri Arev" ;; If you didn't know, this is my name 🙃
      user-mail-address "me@wantyapps.xyz") ;; Hosted by my own website!

(setq doom-theme 'doom-one)

(setq display-line-numbers-type 'relative)

;; (menu-bar-mode t)

(set-face-attribute 'default nil
                    :font "SauceCodePro Nerd Font"
                    :weight 'medium)
(add-to-list 'default-frame-alist '(font . "SauceCodePro Nerd Font"))

(add-to-list 'load-path "/usr/local/share/emacs/site-lisp/mu/mu4e")
(require 'smtpmail)

(setq mu4e-mu-binary "/usr/local/bin/mu"
      mu4e-maildir "~/.maildir" ;; I like my maildir being ".maildir"
      mu4e-get-mail-command (concat (executable-find "mbsync") " -a")
      mu4e-update-interval 300 ;; I don't like my mail updating every 10 seconds or so
      mu4e-attachment-dir "~/Desktop" ;; Where macOS stores screenshots by default
      mu4e-change-filenames-when-moving t)
(add-hook 'mu4e-compose-mode-hook 'company-mode) ;; Address autocompletion

(setq smtpmail-smtp-service 587 ;; My website's smtp port
      smtpmail-smtp-server "mail.wantyapps.xyz") ;; My website's smtp server

(map! :after tex
      :map TeX-mode-map
      "\"" nil)
(after! smartparens-latex
  (sp-local-pair '(tex-mode plain-tex-mode latex-mode LaTeX-mode)
                 "``" "''" :actions :rem))

(setq tex-pdf-view-command "zathura")

(after! org
  (add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
  (setq org-directory "~/Documents/Org/" ;; I like my Org files directory being at my home directory
        org-agenda-files (list org-directory) ;; ALL the files in the Org directory are being searched for tasks
        org-default-notes-file (expand-file-name "notes.org" org-directory) ;; My notes are at notes.org
        org-ellipsis " ▼ " ;; Yes.
        org-log-done 'time
        org-journal-dir "~/Documents/Org/journal" ;; For some weird reason, this doesn't work
        org-journal-date-format "%B %d, %Y (%A)"
        org-journal-file-format "%Y-%m-%d.org" ;; Even this doesn't work. TODO: Fix Org Journal
        org-hide-emphasis-markers t))

(setq alert-default-style 'osx-notifier)
(org-wild-notifier-mode)
