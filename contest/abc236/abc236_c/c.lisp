(let* ((n (read))
       (m (read))
       (sn (loop repeat n collect (read)))
       (um (loop repeat m collect (read))))
  (loop for s in sn with u = (pop um)
        when (equal s u)
          do (setf u (pop um))
             (format t "Yes~%")
        else
          do (format t "No~%")))
