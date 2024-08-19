(let* ((n (read))
       (m (read))
       (am (nreverse (loop repeat m collect (1- (read))))))
  (loop for i downfrom (1- n) to 0 with j = 0
        with a = (pop am)
        when (and a (= i a))
          do (setf j 0
                   a (pop am))
        else
          do (incf j)
        collect j into lst
        finally (format t "~{~a~%~}" (nreverse lst))))
