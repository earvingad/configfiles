;;; ~/.doom.d/align.el -*- lexical-binding: t; -*-


;; Align regexp once
(defun align-repeato (start end regexp)
    "Repeat alignment with respect to
     the given regular expression."
     (interactive "r\nsAlign regexp: ")
    (align-regexp start end
                  (concat "\\(\\s-*\\)" regexp) 1 1 nil)
    (message "%S" (concat "\\(\\s-*\\)" regexp)))
;; Align regexp repeat
(defun align-repeat (start end regexp &optional justify-right after)
  "Repeat alignment with respect to the given regular expression.
If JUSTIFY-RIGHT is non nil justify to the right instead of the
left. If AFTER is non-nil, add whitespace to the left instead of
the right."
  (interactive "r\nsAlign regexp: ")
  (let* ((ws-regexp (if (string-empty-p regexp)
                        "\\(\\s-+\\)"
                      "\\(\\s-*\\)"))
         (complete-regexp (if after
                              (concat regexp ws-regexp)
                            (concat ws-regexp regexp)))
         (group (if justify-right -1 1)))
    (message "%S" complete-regexp)
    (align-regexp start end complete-regexp group 1 t)))


(defmacro create-align-repeat-x (name regexp &optional justify-right default-after)
  (let ((new-func (intern (concat "align-repeat-" name))))
    `(defun ,new-func (start end switch)
       (interactive "r\nP")
       (let ((after (not (eq (if switch t nil) (if ,default-after t nil)))))
         (align-repeat start end ,regexp ,justify-right after)))))

(create-align-repeat-x "comma"       ","        nil t)
(create-align-repeat-x "semicolon"   ";"        nil t)
(create-align-repeat-x "colon"       ":"        nil t)
(create-align-repeat-x "equal"       "="             )
(create-align-repeat-x "math-oper"   "[+\\-*/]"      )
(create-align-repeat-x "ampersand"   "&"             )
(create-align-repeat-x "bar"         "|"             )
(create-align-repeat-x "left-paren"  "("             )
(create-align-repeat-x "right-paren" ")"            t)
(create-align-repeat-x "backslash"   "\\\\"          )

(map! :leader
      (:prefix "a"
        :desc "Align to regexp"       "r"  #'align-repeat
        :desc "Align to regexp once"  "o"  #'align-repeato
        :desc "Align to comma"        ","  #'align-repeat-comma
        :desc "Align to semicolon"    ";"  #'align-repeat-semicolon
        :desc "Align to colon"        ":"  #'align-repeat-colon
        :desc "Align to equal"        "="  #'align-repeat-equal
        :desc "Align to math-oper"    "m"  #'align-repeat-math-oper
        :desc "Align to ampersand"    "&"  #'align-repeat-ampersand
        :desc "Align to bar"          "|"  #'align-repeat-bar
        :desc "Align to left-parent"  "("  #'align-repeat-left-paren
        :desc "Align to right-parent" ")"  #'align-repeat-right-paren
        :desc "Align to backslash"    "\\" #'align-repeat-backslash))
