(let ((s (coerce (read-line) 'list)))
  (loop for (i . r) on s
        do (cond ((char= i #\A)
                  (unless (or (null r)
                              (char= (elt r 0) #\A)
                              (char= (elt r 0) #\B)
                              (char= (elt r 0) #\C))
                    (return (princ "No"))))
                 ((char= i #\B)
                  (unless (or (null r)
                              (char= (elt r 0) #\B)
                              (char= (elt r 0) #\C))
                    (return (princ "No"))))
                 ((char= i #\C)
                  (unless (or (null r)
                              (char= (elt r 0) #\C))
                    (return (princ "No"))))
                 (t (return (princ "No"))))
           finally (princ "Yes")))
