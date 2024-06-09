(let* ((n (read))
       (hi (loop repeat n collect (read))))
  (loop for i below n
        when (< (elt hi 0) (elt hi i))
          return (print (1+ i))
        finally (print -1)))
