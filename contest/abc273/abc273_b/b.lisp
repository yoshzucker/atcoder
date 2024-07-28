(let ((x (read))
      (k (read)))
  (loop for i below k with tt = 1 and d
        do (setf d (mod (floor x tt) 10))
           (setf tt (* tt 10))
           (setf x (* (floor x tt) tt))
           (if (<= 5 d) (incf x tt))
        finally (print x)))
