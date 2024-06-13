(let ((s (read-line)))
  (loop for i from 1 to 15 by 2
        when (char/= (elt s i) #\0)
          return (format t "No")
        finally (format t "Yes")))
