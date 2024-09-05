(let* ((n (read))
       (iacn (sort (loop for i below n collect (list i (read) (read))) #'> :key #'second)))
  (loop for (i nil c) in iacn
        with minc = (third (elt iacn 0)) and lst
        do (when (<= c minc)
             (push (1+ i) lst))
           (setf minc (min c minc))
        finally (format t "~a~%~{~a ~}" (length lst) (sort lst #'<))))
