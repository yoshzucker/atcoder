(let ((y (read)))
  (cond ((/= (mod y 4) 0)
         (print 365))
        ((and (zerop (mod y 4) ) (not (zerop (mod y 100))))
         (print 366))
        ((and (zerop (mod y 100)) (not (zerop (mod y 400))))
         (print 365))
        ((zerop (mod y 400))
         (print 366))))

