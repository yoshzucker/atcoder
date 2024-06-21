(let* ((n (read))
       (ai (loop repeat n collect (read)))
       (sti (loop repeat (1- n) collect (list (read) (read)))))
  (loop for a in ai and (s tt) in sti with tn = 0
        do (incf a tn)
           (setf tn (* (floor a s) tt))
        finally (print (apply #'+ tn (last ai)))))
