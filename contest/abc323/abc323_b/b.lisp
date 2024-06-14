(let* ((n (read))
       (si (loop repeat n collect (read-line))))
  (loop for i below n
        collect (list (1+ i) (count #\o (nth i si))) into lst
        finally (format t "~{~a ~}"
                        (mapcar #'first (sort lst #'> :key #'second)))))
