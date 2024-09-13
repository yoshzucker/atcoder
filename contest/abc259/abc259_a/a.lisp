(let ((n (read))
      (m (read))
      (x (read))
      (u (read))
      (d (read)))
  (loop for i downfrom n to 0 while (<= m i) with l = u
        when (< i x)
          do (decf l d)
        finally (print l)))
