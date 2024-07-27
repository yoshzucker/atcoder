(let* ((n (read))
       (m (read))
       (abm (loop repeat m collect (cons (1- (read)) (1- (read))))))
  (loop for (a . b) in abm with adj = (make-array n :initial-element nil)
        do (push a (elt adj b))
           (push b (elt adj a))
        finally (loop for i below n
                      do (format t "~a ~{~a ~}~%"
                                 (length (elt adj i))
                                 (mapcar #'1+ (sort (elt adj i) #'<))))))
