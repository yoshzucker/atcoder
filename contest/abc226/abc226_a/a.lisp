(let ((x (read)))
  (format t "~d" (if (< (mod x 1) 0.5)
                     (floor x)
                     (ceiling x))))
