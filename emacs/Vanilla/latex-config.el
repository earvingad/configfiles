;;LaTex config

;(require 'auto-complete-auctex)
(load "auctex.el" nil t t)
;(load "preview.el" nil t t)

; basic configuration
;(add-hook 'TeX-mode-hook '(lambda () (setq TeX-command-default "CustomLatex")))
;; Enable PDF from DVI creation
;(setq TeX-PDF-from-DVI "Dvips")


(setq-default TeX-master t)
(add-hook 'LaTeX-mode-hook 'auto-fill-mode)
(add-hook 'LaTeX-mode-hook 'visual-line-mode)
(add-hook 'LaTeX-mode-hook 'LaTeX-math-mode)
;(add-hook 'LaTeX-mode-hook 'linum-mode)
;(add-hook 'LaTeX-mode-hook #'latex-extra-mode)

 	

(add-hook 'LaTeX-mode-hook (lambda ()
							 (TeX-fold-mode 1)
							 (add-hook 'find-file-hook 'TeX-fold-buffer t t)
							 ;(setq TeX-fold-auto 1)

							 (setq TeX-command-default "CustomLatex")))

;; YASnippet
(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"                 ;; personal snippets
        ))
(require 'yasnippet)
(yas-global-mode 1)
(setq yas-wrap-around-region 1)

;(defun my-yas-try-expanding ()
;  (when yas-minor-mode (yas-expand)))
;(add-hook 'post-command-hook #'my-yas-try-expanding)

(defun my-yas-try-expanding-auto-snippets ()
  (when yas-minor-mode
    (let ((yas-buffer-local-condition ''(require-snippet-condition . auto)))
      (yas-expand))))
(add-hook 'post-command-hook #'my-yas-try-expanding-auto-snippets)
