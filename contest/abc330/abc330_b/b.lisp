(let* ((n (read))
       (l (read))
       (r (read))
       (ai (loop repeat n collect (read))))
  (loop for a in ai
        append (loop for x from l to r
                     collect (max a (abs (- x a)) for y from l to r
                                unless (<= (abs (- x a)) (abs (- y a)))
                                  do (return nil)
                                finally (return t))
                       collect x)
          into lst
        finally (format t "~{~a ~}" lst)))
