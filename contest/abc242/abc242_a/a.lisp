(destructuring-bind (a b c x) (loop repeat 4 collect (read))
  (format t "~f" (cond ((<= x a) 1.0)
                       ((<= x b) (/ c (- b a)))
                       (t 0))))
