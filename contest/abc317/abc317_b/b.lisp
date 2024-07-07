(let* ((n (read))
       (an (sort (loop repeat n collect (read)) #'<)))
  (print (1+ (elt an (position -2 (mapcar #'- an (rest an)))))))
