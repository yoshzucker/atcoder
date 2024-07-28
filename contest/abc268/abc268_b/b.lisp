(let ((s (read-line))
      (u (read-line)))
  (format t "~:[No~;Yes~]" (and (<= (length s) (length u))
                                (string= s (subseq u 0 (length s))))))
