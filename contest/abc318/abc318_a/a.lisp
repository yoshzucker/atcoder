(let ((n (read))
      (m (read))
      (p (read)))
  (loop for d from m by p for i from 0 until (< n d)
        finally (print i)))