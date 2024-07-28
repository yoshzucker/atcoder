(let* ((x (read))
       (y (read))
       (z (read)))
  (print (cond ((or (and (< 0 y x) (< 0 y z))
                    (and (> 0 y x) (> 0 y z)))
                -1)
               ((or (< z 0 y x) (> z 0 y x))
                (+ (abs x) (abs z) (abs z)))
               (t
                (abs x)))))
         
