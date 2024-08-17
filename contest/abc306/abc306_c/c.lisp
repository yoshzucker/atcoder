(let* ((n (read))
       (a3n (loop repeat (* 3 n) collect (1- (read))))
       (cnt (make-array (* 3 n) :initial-element 0)))
  (loop for a in a3n for i from 0 with lst
        do (incf (elt cnt a))
        when (= (elt cnt a) 2)
          do (push (cons i (1+ a)) lst)
        finally (format t "~{~a ~}"
                        (mapcar #'cdr (sort lst #'< :key #'car)))))
