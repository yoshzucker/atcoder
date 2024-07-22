(let* ((n (read))
       (an (loop repeat n collect (read))))
  (mapcar #'(lambda (x) (and (evenp x) (format t "~a " x))) an))
