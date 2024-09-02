(let ((s (read-line)))
  (if (< (count-if #'lower-case-p s) (count-if #'upper-case-p s))
      (princ (string-upcase s))
      (princ (string-downcase s))))
