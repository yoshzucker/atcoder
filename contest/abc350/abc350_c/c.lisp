(let* ((n (read))
       (an (coerce (loop repeat n collect (read)) 'vector))
       (pos (make-array n :initial-element nil)))
  (loop for i below n for a across an
        do (setf (elt pos (1- a)) i))
  (loop for i below n with k = 0 and lst
        do ;; (format t "~a ~a ~a " an (elt an i) (elt pos i))
           (unless (= (elt an i) (1+ i))
             (incf k)
             (push (list (1+ i) (1+ (elt pos i))) lst)
             (rotatef (elt an i) (elt an (elt pos i))))
           ;; (format t "~a ~a ~a~%" an k lst)
        finally (format t "~a~%~{~{~a ~a~}~%~}" k (reverse lst))))
