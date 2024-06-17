(let* ((n (read))
       (l (read))
       (r (read))
       (ai (loop repeat n collect (read))))
  (loop for a in ai
        collect (min (max a l) r)
          into lst
        finally (format t "~{~a ~}" lst)))
