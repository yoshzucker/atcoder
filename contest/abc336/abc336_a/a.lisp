(let ((n (read)))
  (format t "~a"
          (concatenate 'string "L" (make-array n :initial-element #\o) "ng")))
