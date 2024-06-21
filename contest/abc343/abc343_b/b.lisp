(let* ((n (read))
       (aii (loop repeat n collect (loop repeat n collect (read)))))
  (loop for ai in aii
        do (loop for i below (length ai)
                 do (when (plusp (elt ai i)) (format t "~a " (1+ i)))
                 finally (format t "~%"))))
