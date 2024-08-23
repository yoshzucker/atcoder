(let* ((n (read))
       (m (read))
       (acm (make-array m :initial-element nil)))
  (loop for i below m
        do (setf (elt acm i) (loop repeat (read) collect (read))))
  (loop with digit = m for d below (ash 1 digit)
        count (loop for i below digit with u
                    when (logbitp i d)
                      do (setf u (union (elt acm i) u))
                    finally (return
                              (subsetp (loop for i from 1 to n collect i) u)))
          into cnt
        finally (print cnt)))
