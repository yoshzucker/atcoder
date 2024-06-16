(let* ((n (read))
       (a (read))
       (ti (loop repeat n collect (read))))
  (loop for i below n with last = 0 and now = 0
        do (setf now (max last (elt ti i)))
           (setf last (+ now a))
        collect last into lst
        finally (format t "~{~a~%~}" lst)))
