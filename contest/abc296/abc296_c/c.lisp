(let* ((n (read))
       (x (read))
       (an (loop repeat n collect (read))))
  (loop for aj in an
        with hash = (make-hash-table)
          initially (loop for a in an do (setf (gethash (- a x) hash) t))
        when (gethash aj hash)
          return (princ "Yes")
        finally (princ "No")))
