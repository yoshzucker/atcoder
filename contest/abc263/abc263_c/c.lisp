(let ((n (read))
      (m (read)))
  (labels ((recursion (cur acc)
             (if (= (length acc) n)
                 (format t "~{~a ~}~%" (reverse acc))
                 (loop for i from (1+ cur) to m
                       do (recursion i (cons i acc))))))
    (recursion 0 nil)))
