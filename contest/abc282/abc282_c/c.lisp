(let ((n (read))
      (s (read-line)))
  (loop for c across s with inquate
        when (char= c #\")
          do (setf inquate (if inquate nil t))
        when (and (not inquate) (char= c #\,))
          do (princ ".")
        else
          do (princ c)))
