(let ((st (read-line)))
  (format t "~a san" (subseq st 0 (position #\Space st))))
