;; Spell-check
(require 'flyspell)
(setq ispell-list-command "--list")
(setq flyspell-issue-message-flag nil
      ispell-dictionary "en_US"
      ispell-program-name "aspell"
      ispell-extra-args '("--sug-mode=ultra"))

(add-hook 'LaTeX-mode-hook 'flyspell-mode) ;
(add-hook 'text-mode-hook 'flyspell-mode)
(add-hook 'prog-mode-hook 'flyspell-prog-mode)
(add-hook 'find-file-hook  'flyspell-buffer)

(require 'flyspell-correct-ivy)
(define-key flyspell-mode-map (kbd "C-;") 'flyspell-correct-wrapper)

;;company
(add-hook 'after-init-hook 'global-company-mode)

(defun spellcheck-quick-change ()
  ;"Run `some-command' and `some-other-command' in sequence."
  (interactive)
  ;(ispell-change-dictionary "es_ANY")
  (let* ((dic ispell-current-dictionary)
    	 (change (if (string= dic "es") "en_US" "es")))
        (ispell-change-dictionary change)
        (message "Dictionary switched from %s to %s" dic change)
        )
  (flyspell-buffer))

(global-set-key (kbd "C-c s") 'spellcheck-quick-change)

;;Avy
(global-set-key (kbd "C-:") 'avy-goto-char-2)
