(let* ((n (read))
       (an (sort (loop for i below n collect (cons i (read))) #'> :key #'cdr)))
  (loop for ((nil . a) . ((i . r))) on an
        with sum = 0 and stock = 0 and vec = (make-array n :initial-element 0)
        when r
          do (if (/= a r)
                 (setf sum (+ sum a stock)
                       stock 0)
                 (incf stock a))
             (setf (elt vec i) sum)
        finally (loop for i below n do (format t "~a " (elt vec i)))))
