(let* ((n (read))
       (an (loop repeat n collect (read))))
  (loop for a in an with lst
        do (push 0 lst)
           (setf lst (mapcar #'(lambda (x) (+ x a)) lst))
        finally (print (count-if #'(lambda (x) (<= 4 x)) lst))))
