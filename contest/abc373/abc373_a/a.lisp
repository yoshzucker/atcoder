(let ((sn (loop repeat 12 collect (read-line))))
  (loop for s in sn for i from 1
        count (= i (length s)) into cnt
        finally (print cnt)))
