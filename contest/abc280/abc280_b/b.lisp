(let* ((n (read))
       (sn (loop repeat n collect (read))))
  (format t "~{~a ~}" (cons (car sn) (mapcar #'- (rest sn) sn))))
