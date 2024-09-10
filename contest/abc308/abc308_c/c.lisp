(let* ((n (read))
       (lst (loop for i from 1 to n
                  collect (let ((a (read))
                                (b (read)))
                            (cons i (/ a (+ a b)))))))
  (format t "~{~a ~}" (mapcar #'car (sort lst #'> :key #'cdr))))
