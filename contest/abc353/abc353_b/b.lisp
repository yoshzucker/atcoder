(let* ((n (read))
       (k (read))
       (ai (loop repeat n collect (read))))
  (loop for i below n with rem = k and st = 0
        do (let ((a (elt ai i)))
             (cond ((<= a rem)
                    (decf rem a))
                   (t
                    (incf st)
                    (setf rem (- k a)))))
        finally (print (1+ st))))
