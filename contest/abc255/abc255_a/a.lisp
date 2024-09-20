(let ((r (read))
      (c (read))
      (as (loop repeat 2 collect (loop repeat 2 collect (read)))))
  (print (elt (elt as (1- r)) (1- c))))
