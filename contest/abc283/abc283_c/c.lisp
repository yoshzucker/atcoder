(let ((s (read-line)))
  (loop for c in (coerce s 'list) with one and cnt = 0
        do (cond ((and (char= c #\0) one)
                  (incf cnt)
                  (setf one nil))
                 ((char= c #\0)
                  (setf one t))
                 (t
                  (setf one nil)))
        finally (print (- (length s) cnt))))
          
