(let ((a (read))
      (b (read))
      (d (read)))
  (loop for i from a by d to b
        do (format t "~a " i)))
