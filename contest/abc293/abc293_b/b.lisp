(let* ((n (read))
       (an (loop repeat n collect (read)))
       (cn (make-array n :initial-element nil)))
  (loop for i below n for a in an
        unless (elt cn i)
          do (setf (elt cn (1- a)) t)
        finally (format t "~a~%~{~a ~}"
                        (count nil cn)
                        (loop for i below n for c in (coerce cn 'list)
                              unless c
                                collect (1+ i)))))
