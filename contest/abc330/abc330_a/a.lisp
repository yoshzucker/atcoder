(let* ((n (read))
       (l (read))
       (ai (loop repeat n collect (read))))
  (print (length (remove-if-not #'(lambda (x) (<= l x)) ai))))
