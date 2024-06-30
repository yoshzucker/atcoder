(let* ((n (read))
       (q (read))
       (sn (coerce (read-line) 'list))
       (lrq (loop repeat q collect `(,(read) ,(read)))))
  (loop for (l r) in lrq
        with amount = (loop for c in (mapcar #'char= sn (rest sn)) with a = 0
                            collect (if c (incf a) a) into lst
                            finally (return (coerce (cons 0 lst) 'vector)))
        do (format t "~a~%" (- (elt amount (1- r)) (elt amount (1- l))))))
