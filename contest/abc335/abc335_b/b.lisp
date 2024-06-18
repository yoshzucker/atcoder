(let ((n (read)))
  (loop for i to n
        do (loop for j to (- n i)
                 do (loop for k to (- n i j)
                          do (format t "~a ~a ~a~%" i j k)))))
