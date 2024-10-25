(load-file "~/.emacs.rc/rc.el")

(require 'crystal-mode)
(require 'ido-completing-read+)
(require 'web-mode)

(setq backup-directory-alist '(("." . "~/.emacs-backups")))
(setq custom-file "~/.emacs.custom.el")

(set-frame-font "Hack 10" nil t)

;(rc/require-theme 'gruvbox)

(menu-bar-mode 0)
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)

(rc/require 'smex 'ido-completing-read+)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(add-to-list 'load-path "~/.emacs.local")

(require 'simpc-mode)
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(setq web-mode-markup-indent-offset 2
      web-mode-code-indent-offset 2
      web-mode-css-indent-offset 2
      web-mode-enable-auto-quoting nil ;; Disable automatic quoting of attributes
      web-mode-enable-css-colorization t)

(add-to-list 'auto-mode-alist '("\\.[jt]s[x]?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.cr\\'" . crystal-mode))

(use-package company
  :ensure t
  :config
  (setq company-minimum-prefix-length 1
        company-idle-delay 0.0) ;; Immediate suggestions
  (add-hook 'web-mode-hook 'company-mode)
  (add-hook 'crystal-mode-hook 'company-mode))

(use-package yasnippet
  :ensure t
  :config
  (yas-global-mode 1)
  (add-hook 'web-mode-hook 'yas-minor-mode)
  (add-hook 'crystal-mode-hook 'yas-minor-mode))

(defun my-web-mode-setup ()
  "Custom setup for web-mode."
  (company-mode +1)
  (yas-minor-mode +1))
(add-hook 'web-mode-hook 'my-web-mode-setup)

;; Custom setup for crystal-mode
(defun my-crystal-mode-setup ()
  "Custom setup for crystal-mode."
  (company-mode -1)
  (yas-minor-mode +1))
(add-hook 'crystal-mode-hook 'my-crystal-mode-setup)

(load-file custom-file)
