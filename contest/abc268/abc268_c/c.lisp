(let* ((n (read))
       (pn (loop repeat n collect (read))))
  (loop for p in pn for i from 0 
        with happy-rotate = (make-array n :initial-element 0)
        do (incf (elt happy-rotate (mod (- p i 1) n)))
           (incf (elt happy-rotate (mod (- p i 0) n)))
           (incf (elt happy-rotate (mod (- p i -1) n)))
        finally (print (reduce #'max happy-rotate))))
