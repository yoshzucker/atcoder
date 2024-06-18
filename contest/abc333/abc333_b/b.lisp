(let ((ss (read-line))
      (tt (read-line))
      (d1 (list "AB" "BC" "CD" "DE" "EA" "BA" "CB" "DC" "ED" "AE")))
  (format t "~:[No~;Yes~]" (let ((s1 (find ss d1 :test #'string=))
                                 (t1 (find tt d1 :test #'string=)))
                             (or (and s1 t1)
                                 (and (not s1) (not t1))))))
 
