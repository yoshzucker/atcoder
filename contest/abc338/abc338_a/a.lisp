(let ((s (read-line)))
  (format t "~:[No~;Yes~]" (and (upper-case-p (elt s 0))
                                (every #'lower-case-p (subseq s 1)))))
