(let* ((n (read))
       (an (coerce (loop repeat n collect (read)) 'vector)))
  (if (= n 1)
      (print (elt an 0))
      (loop for i from 2 below n
            with dp = (make-array (list 2 n) :initial-element 0)
              initially (setf (aref dp 1 0) (elt an 0)) ; 0を倒して even 0, odd 1
                        (setf (aref dp 1 1)
                              (max
                               (aref dp 1 0)
                               (elt an 1)))
                        (setf (aref dp 0 1)
                              (+ (aref dp 1 0) (* 2 (elt an 1))))
            do (setf (aref dp 1 i)
                     (max
                      (aref dp 1 (1- i))
                      (+ (aref dp 0 (1- i)) (elt an i))))
               (setf (aref dp 0 i)
                     (max
                      (aref dp 0 (1- i))
                      (+ (aref dp 1 (1- i)) (* 2 (elt an i)))))
            finally (print (max (aref dp 0 (1- n))
                                (aref dp 1 (1- n)))))))
