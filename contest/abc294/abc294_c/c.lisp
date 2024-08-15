(let* ((n (read))
       (m (read))
       (an (loop for i below n collect (cons i (read))))
       (bm (loop for i from n repeat m collect (cons i (read))))
       (cs (sort (append an bm) #'< :key #'cdr)))
  (loop for i from 1 to (+ n m) for (j . nil) in cs
        with a = (make-array n :initial-element nil)
        and b = (make-array m :initial-element nil)
        when (< j n)
          do (setf (elt a j) i)
        else
          do (setf (elt b (- j n)) i)
        finally (format t "~{~a ~}~%" (coerce a 'list))
                (format t "~{~a ~}~%" (coerce b 'list))))
