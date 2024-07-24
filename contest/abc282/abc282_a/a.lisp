(let ((k (read)))
  (loop for i below k for c from (char-code #\A)
        do (princ (code-char c))))
