(let ((n (read))
      (s (read-line)))
  (loop for c across s
        do (format t "~a~a" c c)))
