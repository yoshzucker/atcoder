(let ((s (read-line)))
  (format t "~:[No~;Yes~]" (< (position #\R s) (position #\M s))))
