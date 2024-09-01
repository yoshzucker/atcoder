(let ((s (read-line)))
  (print (loop for c across (reverse s) for codec = (char-code c)
               for i from 0
               with codea = (char-code #\A)
               sum (* (1+ (- codec codea)) (expt 26 i)))))
