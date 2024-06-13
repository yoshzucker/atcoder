(let* ((n (read))
       (x (read))
       (si (loop repeat n collect (read))))
  (print (reduce #'+ (remove-if-not #'(lambda (y) (<= y x)) si))))
