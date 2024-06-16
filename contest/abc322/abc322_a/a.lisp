(let ((n (read))
      (s (read-line)))
  (format t "~a" (1+ (or (search "ABC" s) -2))))
