(let* ((n (read))
       (d (read))
       (sn (loop repeat n collect (read-line))))
  (loop for j below d with cnt = 0
        when (loop for i below n for s = (elt sn i)
                   do (unless (char= (elt s j) #\o)
                        (return nil))
                   finally (return t))
          maximize (incf cnt) into m
        else
          do (setf cnt 0)
        finally (print m)))
