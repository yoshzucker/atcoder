(let ((n (read))
      (s (read))
      (m (read))
      (l (read)))
  (loop for i from 0 until (< n (* (1- i) 6))
        minimize (loop for j from 0 until (< n (* (1- j) 8))
                       minimize (loop for k from 0 until (< n (* (1- k) 12))
                                      minimize
                                      (if (<= n (+ (* i 6) (* j 8) (* k 12)))
                                          (+ (* i s) (* j m) (* k l))
                                          (* (+ s m l) n))))
          into min
        finally (print min)))
