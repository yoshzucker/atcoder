(let ((n (read)))
  (loop with x = (1+ n)
        collect (setf x (logand (1- x) n)) into it
        until (zerop x)
        finally (format t "~{~a~%~}" (nreverse it))))
                 
