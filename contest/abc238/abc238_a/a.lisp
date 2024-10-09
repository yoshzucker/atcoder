(let ((n (read)))
  (format t "~:[No~;Yes~]" (> (expt 2 n) (expt n 2))))
