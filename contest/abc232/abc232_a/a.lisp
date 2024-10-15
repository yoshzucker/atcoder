(let ((s (loop repeat 3 collect (read-char))))
  (print (* (digit-char-p (elt s 0)) (digit-char-p (elt s 2)))))
