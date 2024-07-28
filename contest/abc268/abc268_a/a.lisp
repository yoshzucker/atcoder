(let ((lst (loop repeat 5 collect (read))))
  (print (length (remove-duplicates lst))))
