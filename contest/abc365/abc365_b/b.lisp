(let* ((n (read))
       (an (loop repeat n collect (read)))
       (sort (sort (copy-seq an) #'>)))
  (print (1+ (position (second sort) an))))
