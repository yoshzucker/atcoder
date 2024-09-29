(let ((s (read-line)))
  (loop for i from 0 to 9
        unless (find (digit-char i) s)
          return (print i)))
