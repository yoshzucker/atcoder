(let ((ss (sort (read-line) #'char<))
      (tt (sort (read-line) #'char<))
      (d1 (list "AB" "BC" "CD" "DE" "AE")))
  (format t "~:[No~;Yes~]" (let ((s1 (find ss d1 :test #'string=))
                                 (t1 (find tt d1 :test #'string=)))
                             (or (and s1 t1)
                                 (and (not s1) (not t1))))))
 
