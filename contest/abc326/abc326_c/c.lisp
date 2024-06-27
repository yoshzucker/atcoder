(let* ((n (read))
       (m (read))
       (an (sort (loop repeat n collect (read)) #'<))
       (en (copy-seq an)))
  (loop with s = (pop an) with e = (pop en) while e with c = 0
        maximize (cond ((< (- e s) m)
                        (setf e (pop en))
                        (incf c))
                       (t
                        (setf s (pop an))
                        (decf c)))
          into it
        finally (print it)))

  
