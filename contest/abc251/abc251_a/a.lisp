(let ((s (read-line)))
  (loop repeat (floor 6 (length s))
        do (princ s)))
