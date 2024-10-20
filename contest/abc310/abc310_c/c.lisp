(let* ((n (read))
       (sn (loop repeat n collect (read-line))))
  (loop for s in sn with hash = (make-hash-table :test #'equal)
        do (let* ((r (reverse s))
                  (ss (if (string< s r) s r)))
             (incf (gethash ss hash 0)))
        finally (print (hash-table-count hash))))
