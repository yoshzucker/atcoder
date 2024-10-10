(let ((n (read))
      (m (expt 2 31)))
  (format t "~:[No~;Yes~]" (and (<= (- m) n) (< n m))))
