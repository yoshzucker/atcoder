(let ((n (read))
      (k (read))
      (s (read-line)))
  (loop for c across s with count = 0
        when (and (char= c #\o) (< count k))
          do (incf count)
             (princ "o")
        else
          do (princ "x")))
