(let ((an (loop repeat 10 collect (read))))
  (loop with i = 0 for a = (elt an i) repeat 3
        do (setf i a)
        finally (print i)))
