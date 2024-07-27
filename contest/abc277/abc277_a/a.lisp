(let* ((n (read))
       (x (read))
       (pn (loop repeat n collect (read))))
  (print (1+ (position x pn))))
