(let* ((n (read))
       (m (read))
       (si (loop repeat n
                 collect (map 'list (lambda (x) (char= x #\o)) (read-line)))))
  (loop for b below (expt 2 n)
        minimize (loop for i below n with r = (loop repeat m collect nil)
                       when (logbitp i b)
                         do (setf r (mapcar #'(lambda (x y) (or x y))
                                            r (nth i si)))
                       finally (return (if (every #'(lambda (x) (and x t)) r)
                                           (logcount b) n)))
          into min
        finally (print min)))

