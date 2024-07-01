(let ((n (read))
      (s (coerce (read-line) 'list)))
  (loop for (c . r) on s with count = 0 and alst
        do (when (char= c (first r))
             (incf count)
             (let ((p (assoc c alst)))
               (setf (cdr p) (max (cdr p) count))))
        finally ))
