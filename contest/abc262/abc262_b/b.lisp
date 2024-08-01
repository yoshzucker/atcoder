(let* ((n (read))
       (m (read))
       (uvm (loop repeat m collect (cons (1- (read)) (1- (read)))))
       (adj (make-array n :initial-element nil)))
  (loop for (u . v) in uvm
        do (push v (elt adj u))
           (push u (elt adj v)))
  (loop for i below n
        sum (loop for j from (1+ i) below n
                  sum (loop for k from (1+ j) below n
                            count (and (find i (elt adj k))
                                       (find i (elt adj j))
                                       (find j (elt adj i))
                                       (find j (elt adj k))
                                       (find k (elt adj i))
                                       (find k (elt adj j)))))
          into it
        finally (print it)))
