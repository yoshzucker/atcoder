(let* ((h (read))
       (w (read))
       (sh (loop repeat h collect (read-line))))
  (loop for s in sh
        sum (count #\# s) into it
        finally (print it)))
