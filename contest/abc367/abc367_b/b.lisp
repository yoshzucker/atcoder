(let ((x (read-line)))
  (loop for c across (reverse x) with nonzero and dot with str
        do (cond ((char= c #\0)
                  (if nonzero
                      (push c str)))
                 ((char= c #\.)
                  (if nonzero
                      (push c str)))
                 (t
                  (push c str)))
           (when (char/= c #\0) (setf nonzero t))
        finally (format t "~{~a~}" str)))
