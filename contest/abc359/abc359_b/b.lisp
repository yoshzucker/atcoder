(let* ((n (read))
       (ai (loop repeat (* 2 n) collect (read))))
  (loop for (i . r) on ai
        when (and (<= 2 (length r))
                  (= i (cadr r)))
          count it into it
        finally (print it)))
