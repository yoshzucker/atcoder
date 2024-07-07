(let* ((n (read))
       (k (read))
       (x (read))
       (an (loop repeat n collect (read)))
       (bn (make-array (1+ n) :initial-element nil)))
  (loop for i from 0 below n
        when (< i k)
          do (setf (elt bn i) (elt an i))
        else
          do (setf (elt bn (1+ i)) (elt an i)))
  (setf (elt bn k) x)
  (format t "~{~a ~}" (coerce bn 'list)))
