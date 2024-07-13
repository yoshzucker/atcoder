(let* ((n (read))
       (ann (make-array (list n n)
                        :initial-contents
                        (loop repeat n collect (read-line))))
       (bnn (make-array (list n n))))
  (loop for i below n
        do (loop for j below n
                 do (setf (aref bnn i j) (aref ann i j))))
  (loop for i from 1 below (1- n)
        for f = (1+ i)
        and b = (1- i)
        with l = (1- n)
        with e = (1- l)
        do (setf (aref bnn 0 i) (aref ann 0 b))
           (setf (aref bnn i l) (aref ann b l))
           (setf (aref bnn l i) (aref ann l f))
           (setf (aref bnn i 0) (aref ann f 0))
        finally  (setf (aref bnn 0 0) (aref ann 1 0))
                 (setf (aref bnn 0 l) (aref ann 0 e))
                 (setf (aref bnn l l) (aref ann e l))
                 (setf (aref bnn l 0) (aref ann l 1)))
  (loop for i below n
        do (loop for j below n
                 do (format t "~a" (aref bnn i j)))
           (format t "~%")))
