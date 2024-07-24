(let* ((n (read))
       (m (read))
       (sn (loop repeat n collect (read-line))))
  (loop for i below n
        sum (loop for j from (1+ i) below n
                  count (every #'(lambda (x y) (or (char= x #\o) (char= y #\o)))
                               (elt sn i)
                               (elt sn j)))
          into it
        finally (print it)))

