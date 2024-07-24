(let ((s (read-line)))
  (print (1+ (position-if #'upper-case-p s))))
