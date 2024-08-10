(let* ((n (read))
       (an (sort (loop repeat n collect (read)) #'>))
       (cnt (make-array n :initial-element 0)))
  (loop for (a b) on an with i = 0 and c = 1
        when (eql a b)
          do (incf c)
        else
          do (setf (elt cnt i) c)
             (incf i)
             (setf c 1)
        finally (format t "~{~a~%~}" (coerce cnt 'list))))
