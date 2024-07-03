(let ((n (read))
      (m (read))
      (s (read-line)))
  (loop for d across s with muji = 0 and logo = 0
        do (cond ((char= d #\0)
                  (setf muji 0)
                  (setf logo 0))
                 ((char= d #\2)
                  (incf logo))
                 (t
                  (if (< muji m) (incf muji) (incf logo))))
        maximize logo into it
        finally (print it)))
