(let ((s (read-line)))
  (format t "~a" (concatenate 'string
                              (subseq s 0 (position #\| s))
                              (subseq s (1+ (position #\| s :from-end t))))))
