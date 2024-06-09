(let* ((n (read))
       (a (loop repeat (1- n) sum (read))))
  (print (- a)))
