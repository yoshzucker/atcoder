(let* ((n (read))
       (m (mod n 5)))
  (print (if (<= m 2) (- n m) (+ n (- 5 m)))))
