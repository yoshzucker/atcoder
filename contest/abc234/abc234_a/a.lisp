(let ((u (read)))
  (flet ((f (x)
           (+ (* x x) (* 2 x) 3)))
    (print (f (+ (f (+ (f u) u))
                 (f (f u)))))))