(let ((a (read))
      (b (read))
      (k (read)))
  (loop with slime = a until (<= b slime)
        count (setf slime (* slime k)) into cnt
        finally (print cnt)))
