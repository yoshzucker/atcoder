(let ((n (read)))
  (loop while (zerop (mod n 2))
        do (setf n (/ n 2)))
  (loop while (zerop (mod n 3))
        do (setf n (/ n 3))
        finally (format t "~:[No~;Yes~]" (= n 1))))
