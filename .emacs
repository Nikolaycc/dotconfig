					; custom functions
(defun kill-other-buffers ()
    "Kill all other buffers."
    (interactive)
    (mapc 'kill-buffer
          (delq (current-buffer)
                (remove-if-not 'buffer-file-name (buffer-list)))))

(setq custom-file "~/.emacs.custom.el")

(setq package-archives
      '(("GNU ELPA"     . "https://elpa.gnu.org/packages/")
	("MELPA"        . "https://melpa.org/packages/")
	("ORG"          . "https://orgmode.org/elpa/")
	("MELPA Stable" . "https://stable.melpa.org/packages/")
	("nongnu"       . "https://elpa.nongnu.org/nongnu/"))
      package-archive-priorities
      '(("GNU ELPA"     . 20)
	("MELPA"        . 15)
	("ORG"          . 10)
	("MELPA Stable" . 5)
	("nongnu"       . 0)))

(package-initialize)

;(set-face-attribute 'default nil :font "Hack" :height 160)

(setq make-backup-files nil) ; stop creating ~ files
(tool-bar-mode 0)
(scroll-bar-mode 0)
(global-display-line-numbers-mode 1)
(show-paren-mode 1)
(setq inhibit-startup-screen 0)
(menu-bar-mode 0)

(global-set-key (kbd "C-x C-b") 'kill-other-buffers)

					; packages

(add-to-list 'load-path "/home/nikolaycc/.emacs.local")
;; Importing simpc-mode
(require 'simpc-mode)
;; Automatically enabling simpc-mode on files with extensions like .h, .c, .cpp, .hpp
(add-to-list 'auto-mode-alist '("\\.[hc]\\(pp\\)?\\'" . simpc-mode))

(require 'peacock-theme)

(load-theme 'gruber-darker)

(require 'company)

(global-company-mode)

(add-hook 'tuareg-mode-hook
          (lambda ()
            (interactive)
            (company-mode 0)))

(require 'yasnippet)

(yas-global-mode 1)

(require 'ido-completing-read+)

(ido-mode 1)
(ido-everywhere 1)
(ido-ubiquitous-mode 1)

(require 'dired-x)

(setq dired-omit-files
      (concat dired-omit-files "\\|^\\..+$"))
(setq-default dired-dwim-target t)
(setq dired-listing-switches "-alh")
(setq dired-mouse-drag-files t)
(put 'dired-find-alternate-file 'disabled nil)

;; Add this to your init.el
(setq treesit-language-source-alist
   '((elixir "https://github.com/elixir-lang/tree-sitter-elixir")
     (heex "https://github.com/phoenixframework/tree-sitter-heex")))

;; Then run this command to install the grammars
;; M-x treesit-install-language-grammar RET elixir RET
;; M-x treesit-install-language-grammar RET heex RET
