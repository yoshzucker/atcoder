(let ((n (read)))
  (flet ((patterns (x)
           (let ((root (floor (sqrt x))))
             (loop for k from 1 to root
                   count (zerop (mod x k)) into cnt
                   finally (return (if (= (* root root) x)
                                       (1- (* 2 cnt))
                                       (* 2 cnt)))))))
    (loop for i from 1 below n
          sum (* (patterns i) (patterns (- n i)))
            into s
          finally (print s))))
