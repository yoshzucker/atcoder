(let ((x (read))
      (y (read)))
  (format t "~:[No~;Yes~]" (<= -3 (- y x) 2)))
