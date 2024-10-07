(let ((a (read))
      (b (read)))
  (format t "~:[No~;Yes~]" (or (= (abs (- a b)) 1)
                               (= (abs (- a b)) 9))))
