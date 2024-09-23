(let ((a (read))
      (b (read))
      (c (read)))
  (format t "~:[No~;Yes~]" (or (<= a b c) (<= c b a))))
