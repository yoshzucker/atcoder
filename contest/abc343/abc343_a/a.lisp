(let ((a (read))
      (b (read)))
  (loop for i from 0
        when (/= i (+ a b))
          return (print i)))
