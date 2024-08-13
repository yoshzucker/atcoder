(let* ((n (read))
       (u (read))
       (an (loop repeat n collect (read)))
       (length (reduce #'+ an)))
  (loop for a in an
        for i from 1 to n
        with u = (mod u length)
        do (decf u a)
        when (minusp u)
          return (format t "~a ~a" i (+ a u))))
