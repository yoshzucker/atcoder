(let ((s (read-line))
      (r (read-line)))
  (loop for c across s with res and st = 0
        do (let ((pos (1+ (position c r :start st))))
             (push pos res)
             (setf st pos))
        finally (format t "~{~a ~}" (reverse res))))
