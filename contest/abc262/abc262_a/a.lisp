(let ((y (read)))
  (loop for i from y until (= (mod i 4) 2)
        finally (print i)))
