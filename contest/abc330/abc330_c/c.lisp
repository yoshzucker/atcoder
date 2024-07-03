(let ((d (read)))
  (flet ((rad (x y)
           (+ (* x x) (* y y))))
    (loop with x = 0 while (<= (1- x) (sqrt d)) with y = (1+ (floor (sqrt d)))
          when (< d (rad x y))
            do (setf y (max 0 (1- y)))
          else
            minimize (min (abs (- d (rad x y)))
                          (abs (- d (rad x (1+ y)))))
              into it
              and do (incf x)
          do (format t "~a ~a~%" x y)
          finally (print it))))

