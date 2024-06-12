(let* ((n (read))
       (s (read))
       (k (read))
       (pqi (loop repeat n collect (list (read) (read)))))
  (loop for pq in pqi
        sum (* (first pq) (second pq)) into sum
        finally (unless (<= s sum) (incf sum k))
                (print sum)))
