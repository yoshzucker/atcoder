(let* ((n (read))
       (xyn (loop repeat n collect (cons (read) (read)))))
  (loop for (x1 . y1) in xyn
        maximize (loop for (x2 . y2) in xyn
                       maximize (sqrt (+ (expt (- y2 y1) 2)
                                         (expt (- x2 x1) 2))))
          into m
        finally (format t "~,10f" m)))
