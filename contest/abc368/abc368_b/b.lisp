(let* ((n (read))
       (an (loop repeat n collect (read))))
  (loop until (<= (count-if #'plusp an) 1)
        do (setf an (sort an #'>))
           (decf (elt an 0))
           (decf (elt an 1))
        count t into cnt
        finally (print cnt)))
