(let ((s (read-line)))
  (format t "~a" (subseq s (1+ (position #\. s :from-end t)))))
