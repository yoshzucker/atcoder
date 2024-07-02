(let* ((n (read))
       (an (sort (loop for i below n collect (cons i (read))) #'> :key #'cdr)))
  (loop for ((nil . a) . ((i . r))) on an with sum = 0 and stock = 0
        when r
          do (if (/= a r)
                 (setf sum (+ sum a stock)
                       stock 0)
                 (incf stock a))
          and collect (cons i sum) into it
        finally (setf it (acons (car (first an)) 0 it))
                (loop for i below n
                      do (format t "~a " (cdr (assoc i it))))))
