(let* ((n (read))
       (an (loop repeat n collect (1- (read))))
       (pos (make-array n :initial-element nil)))
  (loop for a in an for i below n
        do (setf (elt pos a) i))
  (loop for i below n with k = 0 and lst
        unless (= (elt pos i) i)
          do (incf k)
             (push (list (1+ i) (1+ (elt pos i))) lst)
             (rotatef (elt pos i) (elt pos (elt pos i)))
        finally (format t "~a~%~{~{~a ~a~%~}~}" k (reverse lst)))
  (format t "~a" pos))
