(let ((n (read))
      (s (read-line)))
  (format t "~:[No~;Yes~]" (or (search "ab" s) (search "ba" s))))
