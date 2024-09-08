(let* ((n (read))
       (ann (loop for i from 1 to n collect (loop repeat i collect (1- (read))))))
  (loop with i = 0 for j from 0 below n
        for small = (min i j)
        for large = (max i j)
        do (setf i (elt (elt ann large) small))
        finally (print (1+ i))))
