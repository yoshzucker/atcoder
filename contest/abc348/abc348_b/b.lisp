(let* ((n (read))
       (xyi (loop repeat n collect (list (read) (read)))))
  (loop for (x2 y2) in xyi
        do (loop for (x1 y1) in xyi for i from 1 with mx = 0 and mxi
                 do (let ((d (+ (expt (- x1 x2) 2) (expt (- y1 y2) 2))))
                      (when (< mx d)
                        (setf mx d)
                        (setf mxi i)))
                 finally (print mxi))))
