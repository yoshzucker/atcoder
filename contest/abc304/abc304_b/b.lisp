(let ((n (read)))
  (loop for c across (write-to-string n) for i from 0
        when (< i 3)
          do (princ c)
        else
          do (princ #\0)))
