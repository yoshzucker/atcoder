(let* ((n (read))
       (an (loop repeat n collect (read))))
  (loop for (a . r) on an
        when r
          when (< a (car r))
            do (loop for i from a below (car r)
                     do (format t "~a " i))
          else
            do (loop for i from a above (car r)
                     do (format t "~a " i))
        finally (format t "~a" a)))
