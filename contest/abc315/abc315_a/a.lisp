(let ((s (read-line)))
  (loop for c in '(#\a #\e #\i #\o #\u)
        do (setf s (remove c s))
        finally (princ s)))
