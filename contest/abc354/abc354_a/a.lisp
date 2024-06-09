(let ((h (read)))
  (loop for i from 1
        and p = 1 then (+ p (expt 2 i)) while (<= p h)
        finally (print i)))
