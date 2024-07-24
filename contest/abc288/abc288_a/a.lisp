(let* ((n (read))
       (abn (loop repeat n collect (cons (read) (read)))))
  (loop for (a . b) in abn
        do (format t "~a~%" (+ a b))))
