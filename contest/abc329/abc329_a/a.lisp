(let ((s (read-line)))
  (loop for i from 1 below (length s)
          initially (format t "~a" (elt s 0))
        do (format t " ~a" (elt s i))))
