(destructuring-bind (x y) (list (read) (read))
  (print (ceiling (max 0 (- y x)) 10)))
