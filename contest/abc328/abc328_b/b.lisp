(let* ((n (read))
       (di (loop repeat n collect (read))))
  (loop for i from 1 to n
        sum (loop for j from 1 to (elt di (1- i))
                  for lst = (concatenate 'list
                                         (write-to-string i)
                                         (write-to-string j))
                  count (every #'char= lst (rest lst)))
          into sum
        finally (print sum)))
