(let ((n (read))
      (s (coerce (read-line) 'list)))
  (loop for (c . r) on s with count = 1 and alst
        do (if (and r (char= c (first r)))
               (incf count)
               (setf count 1))
           (let ((p (assoc c alst)))
             (if p
                 (setf (cdr p) (max (cdr p) count))
                 (setf alst (acons c count alst))))
        finally (print (reduce #'+ alst :key #'cdr))))
  
