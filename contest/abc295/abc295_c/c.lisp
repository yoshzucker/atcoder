(let* ((n (read))
       (an (loop repeat n collect (read))))
  (loop for a in an with hash = (make-hash-table)
        when (gethash a hash)
          do (remhash a hash)
          and count t into cnt
        else
          do (setf (gethash a hash) t)
        finally (print cnt)))
