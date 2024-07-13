(let ((a (read))
      (b (read)))
  (format t "~:[No~;Yes~]" (and (= 1 (- b a)) (not (= a 3)) (not (= a 6)))))
