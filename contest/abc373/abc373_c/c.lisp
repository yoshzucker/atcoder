(let* ((n (read))
       (a (loop repeat n maximize (read)))
       (b (loop repeat n maximize (read))))
  (print (+ a b)))
