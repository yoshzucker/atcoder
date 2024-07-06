(let* ((n (read))
       (an (loop repeat n collect (read))))
  (loop for a in an with sum = 0
        minimize (incf sum a) into it
        finally (print (- sum (min it 0)))))
