(let ((n (read))
      (s (read-line)))
  (format t "~:[No~;Yes~]" (every #'char/= s (subseq s 1))))
