(let* ((n (read))
       (m (read))
       (abm (loop repeat m collect (list (1- (read)) (1- (read)))))
       (loser (make-array n :initial-element nil)))
  (loop for i below n
        do (loop with stack = (list i) while stack
                 do (let ((x (pop stack)))
                      (loop for (a b) in abm
                            do (when (and (= a x) (not (elt loser b)))
                                 (push b stack)
                                 (setf (elt loser b) t)))))
        finally (print (if (= (count nil loser) 1)
                           (1+ (position nil loser))
                           -1))))
