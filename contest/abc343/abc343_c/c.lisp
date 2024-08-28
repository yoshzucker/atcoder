(defun palindromep (sequence &optional (predicate #'eq))
  (loop with sq = (coerce sequence 'vector)
        for i to (floor (length sq) 2)
        always (funcall predicate (elt sq i) (elt sq (- (length sq) 1 i)))))

(let ((n (read)))
  (loop for i downfrom (floor (expt n 1/3)) to 1
        do (let ((str (write-to-string (expt i 3))))
             (when (palindromep str)
               (return (princ str))))))
