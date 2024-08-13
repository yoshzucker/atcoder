(let* ((n (read))
       (m (read))
       (uvm (loop repeat m collect (cons (1- (read)) (1- (read)))))
       (adj (make-array n :initial-element nil)))
  (loop for (u . v) in uvm
        do (push v (elt adj u))
           (push u (elt adj v)))
  (loop for i below n
        with visited = (make-array n :initial-element nil)
        with stack
        unless (elt visited i)
          count t into cnt
          and do (setf (elt visited i) t)
                 (push i stack)
                 (loop while stack for node = (pop stack)
                       do (loop for adjacent in (elt adj node)
                                unless (elt visited adjacent)
                                  do (setf (elt visited adjacent) t)
                                     (push adjacent stack)))
        finally (print cnt)))
