(let* ((n (read))
       (p (read))
       (q (read))
       (dn (loop repeat n collect (read))))
  (print (min p (+ q (apply #'min dn)))))
