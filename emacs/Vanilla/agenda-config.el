;;path of agenda files
(setq org-agenda-files '("/home/earving/.emacs.d/agenda"))

(setq org-default-notes-file "/home/earving/.emacs.d/refile.org")

;;Include diary
(setq org-agenda-include-diary t)
(setq calendar-mark-diary-entries-flag t)


;; == Custom State Keywords ==
(setq org-use-fast-todo-selection t)
(setq org-todo-keywords
      '((sequence "☛ TODO(t)" "➔ NEXT(n)" "|" "✔ DONE(d)")
(sequence "⚑ WAITING(w@/!)" "∅ INACTIVE(i)" "|" "✘ CANCELLED(c@/!)" "⬜ MEETING(m@/!)")))


;; == Capture Mode Settings ==
;; Define the custum capture templates
(defvar org-capture-templates
       '(("t" "todo" entry (file org-default-notes-file)
	  "* ☛ TODO %?\n%u\n%a\n" :clock-in t :clock-resume t)
	 ("b" "Blank" entry (file org-default-notes-file)
	  "* %?\n%u")
	 ("m" "Meeting" entry (file org-default-notes-file)
	  "* ⬜ MEETING with %? :MEETING:\n" :clock-in t :clock-resume t)
	 ("d" "Diary" entry (file+datetree "~/org/diary.org")
	  "* %?\n%U\n" :clock-in t :clock-resume t)
	 ("D" "Daily Log" entry (file "~/org/daily-log.org")
	  "* %u %?\n#+BEGIN: gjs-daily-clocktable :maxlevel 4 :date \"%u\" :link t :compact t \n#+END:\n\n*Summary*: \n\n*Problem*: \n\n*Insight*: \n\n*Tomorrow*: " :clock-in t :clock-resume t)
	 ("i" "Idea" entry (file org-default-notes-file)
	  "* %? :IDEA: \n%u" :clock-in t :clock-resume t)
	 ("n" "Next Task" entry (file+headline org-default-notes-file "Tasks")
	  "** ➔ NEXT %? \nDEADLINE: %t")
	 ("l" "Ledger entries")
	 ("lc" "MBNA" plain
	  (file "~/ledger/main-test.ledger")
	  "%(org-read-date) %^{Payee}
    ; %^{Comments/Tags}
    Expenses:%?  %^{Amount}
    Assets:Checking
")
	 ))

;; == Refile ==
;; Targets include this file and any file contributing to the agenda - up to 9 levels deep
(setq org-refile-targets (quote ((nil :maxlevel . 9)
                                 (org-agenda-files :maxlevel . 9))))

;;  Be sure to use the full path for refile setup
(setq org-refile-use-outline-path t)
(setq org-outline-path-complete-in-steps nil)

;; Allow refile to create parent tasks with confirmation
(setq org-refile-allow-creating-parent-nodes 'confirm)

(add-hook 'org-mode-hook (lambda ()
  "Beautify Org Checkbox Symbol"
  (push '("[ ]" . "☐") prettify-symbols-alist)
  (push '("[X]" . "✔" ) prettify-symbols-alist)
  (push '("[-]" . "❍" ) prettify-symbols-alist)
  (prettify-symbols-mode)))


(setq org-ellipsis " ↴")
(require 'org-bullets)
(setq  org-bullets-bullet-list '("◉" "◎" "♠" "○" "►" "◇"))
(add-hook 'org-mode-hook (lambda () (org-bullets-mode 1)))
