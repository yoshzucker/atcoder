(let ((s (read-line))
      (u (read-line)))
  (format t "~:[No~;Yes~]" (search u s)))
