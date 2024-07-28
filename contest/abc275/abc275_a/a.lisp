(let* ((n (read))
       (hn (loop repeat n collect (read))))
  (print (1+ (position (apply #'max hn) hn))))
