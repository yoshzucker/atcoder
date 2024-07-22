(let ((n (read))
      (s (read-line)))
  (format t "~:[No~;Yes~]" (and (find #\o s) (not (find #\x s)))))
