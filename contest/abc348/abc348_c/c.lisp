(let* ((n (read))
       (acn (loop repeat n collect (cons (read) (read)))))
  (loop for (a . c) in acn with hash = (make-hash-table)
        do (setf (gethash c hash) (min (gethash c hash (expt 10 9)) a))
        finally (loop for v being the hash-value in hash
                      maximize v into max
                      finally (print max))))
