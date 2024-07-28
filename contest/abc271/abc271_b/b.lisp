(let* ((n (read))
       (q (read))
       (lan (make-array
             n
             :initial-contents
             (loop repeat n
                   collect
                   (coerce (loop repeat (read) collect (read)) 'vector))))
       (stq (loop repeat q collect (cons (read) (read)))))
  (loop for (s . u) in stq
        do (format t "~a~%" (elt (elt lan (1- s)) (1- u)))))
