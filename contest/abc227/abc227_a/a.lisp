(destructuring-bind (n k a) (loop repeat 3 collect (read))
  (loop repeat k for i = (1- a) then (mod (1+ i) n)
        finally (print (1+ i))))
