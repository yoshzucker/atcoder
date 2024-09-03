(let* ((n (read))
       (k (read))
       (an (coerce (sort (loop repeat n collect (read)) #'<) 'vector)))
  (loop with lange = (- n k 1) for i from 0 below (- n lange)
        minimize (- (elt an (+ i lange)) (elt an i))
          into m
        finally (print m)))
