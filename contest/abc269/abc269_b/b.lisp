(let ((mat (loop repeat 10 collect (read-line))))
  (loop for m in mat for i from 1 with a and b and c and d
        when (find #\# m)
          do (setf c (1+ (position #\# m)))
             (setf d (1+ (position #\# m :from-end t)))
          and collect i into ablst
        finally (setf a (apply #'min ablst))
                (setf b (apply #'max ablst))
                (format t "~a ~a~%~a ~a" a b c d)))
