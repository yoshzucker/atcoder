(let* ((h (read))
       (w (read))
       (chw (make-array (list h w)
                        :initial-contents
                        (loop repeat h collect (read-line)))))
  (loop for j below w
        do (loop for i below h
                 count (char= (aref chw i j) #\#) into it
                 finally (format t "~a " it))))
