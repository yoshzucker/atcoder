(let* ((n (read))
       (m (read))
       pn cn fn)
  (loop repeat n
        do (push (read) pn)
           (loop repeat (car (push (read) cn) ) collect (read))
        finally (setf pn (nreverse pn))
                (setf cn (nreverse cn)))
  cn)
