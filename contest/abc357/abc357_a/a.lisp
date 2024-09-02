(let* ((n (read))
       (m (read))
       (hn (loop repeat n collect (read))))
  (loop for h in hn with i = 0
        while (<= h m)
        do (decf m h)
           (incf i)
        finally (print i)))
