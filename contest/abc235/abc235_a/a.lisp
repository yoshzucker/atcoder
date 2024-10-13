(let* ((s (read-line)))
  (print (loop for i below (length s)
               sum (* 111 (digit-char-p (elt s i))))))
