(let ((a (read))
      (b (read)))
  (format t "~:[No~;Yes~]" (or (= (* a 2) b) (= (* a 2) (1- b)))))
