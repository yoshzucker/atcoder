(let* ((n (read))
       (s (loop repeat n collect (loop repeat 7 sum (read)))))
  (format t "~{~a ~}" s))
