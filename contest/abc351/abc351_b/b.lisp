(let* ((n (read))
       (aij (loop repeat n collect (coerce (read-line) 'vector)))
       (bij (loop repeat n collect (coerce (read-line) 'vector))))
  (loop named outer for i below n
        for aj = (elt aij i) and bj = (elt bij i)
        do (loop for j below n
                 do (when (char/= (elt aj j) (elt bj j))
                      (return-from outer (format t "~a ~a" (1+ i) (1+ j)))))))
