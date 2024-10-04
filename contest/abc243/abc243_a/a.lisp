(destructuring-bind (v a b c) (loop repeat 4 collect (read))
  (loop for i from 0
        for who = (let ((m (mod i 3)))
                    (cond ((= m 0) (cons 'F a))
                          ((= m 1) (cons 'M b))
                          (t (cons 'T c))))
        do (decf v (cdr who))
        until (minusp v)
        finally (print (car who))))
