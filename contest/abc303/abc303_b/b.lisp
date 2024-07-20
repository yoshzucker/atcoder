(let* ((n (read))
       (m (read))
       (amn (loop repeat m collect (loop repeat n collect (1- (read))))))
  (loop for an in amn
        with friends = (make-array (list n n) :initial-element nil)
        do (loop for (l . r) on an
                 when r
                   do (setf (aref friends (min l (car r)) (max l (car r))) t))
        finally (loop for i below n
                      sum (loop for j from (1+ i) below n
                               count (not (aref friends i j)))
                        into num
                      finally (print num))))
