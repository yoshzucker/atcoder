(let ((s (coerce (read-line) 'list)))
  (loop for c across "ABC"
        do (loop while (when (eql (first s) c) (pop s)))
        finally (format t "~:[No~;Yes~]" (null s))))
