(let* ((n (read))
       (an (loop repeat n collect (read)))
       (parent (make-array (+ (* 2 n) 2) :initial-element 0))
       (answer (make-array (+ (* 2 n) 2) :initial-element nil)))
  (loop for a in an for i from 0
        do (setf (elt parent (* 2 (1+ i))) a
                 (elt parent (1+ (* 2 (1+ i)))) a))
  (loop for k below (1+ (* 2 n))
        do (setf (elt answer k) (1+ (elt answer (elt parent k)))))
  )
