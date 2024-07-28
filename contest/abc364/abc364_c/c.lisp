(let* ((n (read))
       (x (read))
       (y (read))
       (an (sort (loop repeat n collect (read)) #'>))
       (bn (sort (loop repeat n collect (read)) #'>)))
  (print (min (loop for a in an with acc = 0 for i from 1
                    do (incf acc a)
                    when (< x acc)
                      return i
                    finally (return i))
              (loop for b in bn with acc = 0 for i from 1
                    do (incf acc b)
                    when (< y acc)
                      return i
                    finally (return i)))))
