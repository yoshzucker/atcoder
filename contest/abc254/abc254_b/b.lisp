(let ((n (read)))
  (loop repeat n with acc = '(1)
        do (format t "~{~a ~}~%" acc)
           (setf acc (loop for (a b) on acc with lst = '(1)
                           unless (and a b)
                             do (push 1 lst)
                           else
                             do (push (+ a b) lst)
                           finally (return (reverse lst))))))
