(let ((a (loop repeat 9 sum (read)))
      (b (loop repeat 8 sum (read))))
  (print (1+ (- a b))))
