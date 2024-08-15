(let ((n (read))
      (s (read-line)))
  (loop for c across s with cnt = 0
        when (char= c #\o)
          do (incf cnt)
        else
          do (setf cnt 0)
        maximize cnt into m
        finally (print (if (and (find #\- s) (plusp m)) m -1))))
