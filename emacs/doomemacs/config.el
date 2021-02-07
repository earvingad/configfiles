(setq user-full-name "Earving Arciga"
      user-mail-address "arciga.duran@gmail.com")

(setq doom-theme 'doom-solarized-dark)
(setq doom-font (font-spec :family "Mononoki" :size 16)
      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 14))
;; (setq evil-move-cursor-back nil)
(setq fancy-splash-image "~/Imágenes/Inkscape Works/cacochan.svg")

(setq org-directory "~/Documentos/Dropbox/org")
(setq default-directory "~/")
(setq org-roam-directory"~/Documentos/roam")
(setq org-roam-buffer-width 0.25)
(setq org-roam-graph-viewer "qutebrowser")

(global-visual-line-mode t)
(setq display-line-numbers-type 'relative)

(load! "lisp/align.el")
(map! :leader
      :desc "Align the current region" "a r" #'align-regexp)

(add-hook! 'after-init-hook 'global-company-mode)

;; (load! "lisp/ewal-theme.el")

(defun xah-syntax-color-hex ()
  "Syntax color text of the form 「#ff1100」 and 「#abc」 in current buffer.
URL `http://ergoemacs.org/emacs/emacs_CSS_colors.html'
Version 2017-03-12"
  (interactive)
  (font-lock-add-keywords
   nil
   '(("#[[:xdigit:]]\\{3\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background
                      (let* (
                             (ms (match-string-no-properties 0))
                             (r (substring ms 1 2))
                             (g (substring ms 2 3))
                             (b (substring ms 3 4)))
                        (concat "#" r r g g b b))))))
     ("#[[:xdigit:]]\\{6\\}"
      (0 (put-text-property
          (match-beginning 0)
          (match-end 0)
          'face (list :background (match-string-no-properties 0)))))))
  (font-lock-flush))
(add-hook 'css-mode-hook 'xah-syntax-color-hex)
(add-hook 'php-mode-hook 'xah-syntax-color-hex)
(add-hook 'html-mode-hook 'xah-syntax-color-hex)

(setq! org-ellipsis " ▾")
;;↴ ▼
(setq! org-superstar-headline-bullets-list '("●" "◉" "◎" "☉" "○" "◌"))
;;"◉" "◎" "○" "∙" "►" "◇"))
(font-lock-add-keywords 'org-mode
                        '(("^ +\\([+*]\\) "
                           0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "‣")))
                          ("^\\([-]\\) "
                           0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•")))
                          ("^ +\\([-]\\) "
                           0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "•")))
                          ;; ("\\(!=\\)"
                          ;;  0 (prog1 () (compose-region (match-beginning 1) (match-end 1) "≠")))
                          ))

(defun yas-try-expanding-auto-snippets ()
  "Expand snippets with the `auto' condition.
This is intended to be added to `post-command-hook'."
  (when (bound-and-true-p yas-minor-mode)
    (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
      (yas-expand))))

(load! "lisp/olivetti.el")
(map! :leader
      (:prefix-map ("t" . "toggle")
        :desc "Zen mode" "z" #'olivetti-mode
        :desc "Modeline" "m" #'doom-modeline-mode
        :desc "menu bar" "M" #'menu-bar-mode))

(map! :leader
      "SPC" nil
      :desc "M-x" "SPC"                      #'execute-extended-command)

(map! :leader
      (:prefix "b"
        :desc "Switch to buffer" "b"           #'switch-to-buffer
        :desc "Switch workspace buffer" "B"    #'persp-switch-to-buffer))

(map! :leader
      (:prefix ("k" . "kill, yes kill")
        :desc "Kill one" "b"            #'kill-buffer
        :desc "Some die, some live" "s" #'kill-some-buffers))

(defun spellcheck-change ()
  ;"Run `some-command' and `some-other-command' in sequence."
  (interactive)
  (let* ((dic ispell-current-dictionary)
    	 (change (if (string= dic "es") "en_US" "es")))
        (ispell-change-dictionary change)
        (flyspell-buffer)
        (message "Dictionary switched from %s to %s" dic change)
        ))
(map! :leader
      :desc "Change spell language" "s c" #'spellcheck-change)
(require 'flyspell-correct-ivy)
(define-key flyspell-mode-map (kbd "C-:") 'flyspell-correct-wrapper)

(defun global-search ()
  ;"ivy project global search"
  (interactive)
  (cd "~/")
  (counsel-ag))
(map! :leader
      :desc "Global search" "s g" #'global-search)

(defun CustomLatex ()
  "run a command on the current file and revert the buffer"
  (interactive)
  (shell-command
   (format "st -e ~/.scripts/pdflatexcompile.sh %s & disown"
       (shell-quote-argument (buffer-file-name))))
  (revert-buffer t t))
(global-set-key (kbd "M-m") 'CustomLatex)
(map! :map org-mode-map
      :localleader
      (:prefix ("l" . "links")
        "p" #'org-latex-preview))

(setq! markdown-command "pandoc -f markdown -t html --mathjax --highlight-style=pygments")

(map! :map evil-markdown-mode-map
        :i "M-<left>"  #'markdown-promote
        :i "M-<right>" #'markdown-demote)
(map! :map markdown-mode-map
        :localleader
        (:prefix ("i" . "insert")
          "h"          #'markdown-insert-header-atx-1))

;; (custom-set-faces!
  ;; '(italic ((t (:slant italic :weight bold :family "Script12 BT"))))
  ;; '(italic :slant italic :weight normal :family "Script12 BT")
  ;; '(org-document-title :weight bold :height 2.1 :family "Nimbus Roman" )
  ;; '(font-lock-comment-face :slant normal :weight normal :family "Script12 BT" )
 ;; )

;; (custom-set-faces
;;   '(org-level-1 ((t (:inherit outline-1 :height 1.5))))
;;   '(org-level-2 ((t (:inherit outline-2 :height 1.25))))
;;   '(org-level-3 ((t (:inherit outline-3 :height 1.12))))
;; )

(setq! org-file-apps
       '((auto-mode . emacs)
         (directory . emacs)
         ("\\.pdf\\'" . "zathura %s")))

(setq! org-crypt-key "arciga.duran@gmail.com")
