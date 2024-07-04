(let ((n (read)))
  (flet ((repunit (x)
           (parse-integer (make-string x :initial-element #\1))))
    (loop for i from 1 to 12
          append (loop for j from 1 to 12
                       append (loop for k from 1 to 12
                                    collect (+ (repunit i)
                                               (repunit j)
                                               (repunit k))))
            into it
          finally (print (nth (1- n) (remove-duplicates (sort it #'<)))))))
