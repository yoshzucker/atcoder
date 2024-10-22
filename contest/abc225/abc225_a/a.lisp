(let ((s (remove-duplicates (read-line))))
  (print (cond ((= (length s) 1) 1)
               ((= (length s) 2) 3)
               (t 6))))
