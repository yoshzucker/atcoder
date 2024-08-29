(let* ((n (read))
       (abn (loop repeat n collect (cons (read) (read)))))
  (print (+ (apply #'max (mapcar #'(lambda (x) (- (cdr x) (car x))) abn))
            (reduce #'+ abn :key #'car))))
