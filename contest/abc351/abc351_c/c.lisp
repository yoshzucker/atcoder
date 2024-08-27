(let* ((n (read))
       (an (loop repeat n collect (read))))
  (loop with lst = (list (pop an)) for a in an
        do (push a lst)
           (loop while (and (second lst)
                            (= (first lst) (second lst)))
                 do (pop lst)
                    (push (1+ (pop lst)) lst))
        finally (print (length lst))))
