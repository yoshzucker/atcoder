(let ((n (read))
      (l (read))
      (r (read)))
  (loop for i from 1 to n
        collect (if (<= l i r)
                    (- r (- i l))
                    i)
          into lst
        finally (format t "~{~a ~}" lst)))
    
