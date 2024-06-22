(let* ((n (read))
       (q (read))
       (ti (loop repeat q collect (read)))
       (ni (make-array n :initial-element t)))
  (loop for tt in ti
        do (setf (elt ni (1- tt)) (not (elt ni (1- tt))))
        finally (print (count t ni))))
