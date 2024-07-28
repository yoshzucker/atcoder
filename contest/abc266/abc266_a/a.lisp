(let ((s (read-line)))
  (princ (elt s (floor (length s) 2))))
