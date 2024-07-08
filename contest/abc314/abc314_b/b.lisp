(let* ((n (read))
       (cacn (loop repeat n
                   collect (let ((c (read)))
                             (cons c (loop repeat c collect (read))))))
       (x (read)))
  (loop for i below n for cac in cacn
        when (find x (cdr cac))
          count it into cnt
          and minimize (length (cdr cac)) into min
          and collect (list (1+ i) (length (cdr cac))) into lst
        finally (let ((winner (remove nil (mapcar #'(lambda (x)
                                                      (if (= min (second x))
                                                          (first x)))
                                                  lst))))
                  (format t "~a~%" (length winner))
                  (format t "~{~a ~}~%" winner))))
