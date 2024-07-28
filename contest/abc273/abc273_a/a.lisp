(let ((n (read)))
  (labels ((f (x acc)
             (if (zerop x)
                 acc
                 (f (1- x) (* acc x)))))
    (print (f n 1))))
