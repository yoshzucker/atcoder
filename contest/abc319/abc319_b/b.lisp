(let ((n (read)))
  (loop for i to n
        do (loop for j from 1 to 9
                 when (and (zerop (mod n j))
                           (zerop (mod i (/ n j))))
                   return (format t "~a" j)
                 finally (princ "-"))))
