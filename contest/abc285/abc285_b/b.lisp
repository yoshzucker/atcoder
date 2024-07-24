(let ((n (read))
      (s (read-line)))
  (loop for i from 1 below n
        do (loop for l below n for r = (+ l i)
                 until (<= n r)
                 while (char/= (elt s l) (elt s r))
                 count t into it
                 finally (print it))))
