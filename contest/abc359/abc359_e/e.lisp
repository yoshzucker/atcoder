(let* ((n (read))
       (hi (loop repeat n collect (read))))
  (loop for h in  hi for i from 0
        ;; do (format t "~a " (1+ (elt hi (position-if #'(lambda (x) (<= h x)) hi)) ))
        do (format t "~a " (1+
                            (elt hi (position-if #'(lambda (x) (<= h x)) hi)) ))
        do (format t "~a ~a ~a~%" (position-if #'(lambda (x) (<= h x)) hi) h i)
  ))
