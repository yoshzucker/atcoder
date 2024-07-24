(let* ((n (read))
       (sn (loop repeat n collect (read-line))))
  (format t "~{~a~%~}" (nreverse sn)))
