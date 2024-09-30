(let* ((n (read))
       (sun (loop repeat n collect (cons (read) (read)))))
  (loop for (s . u) in sun with hash = (make-hash-table :test #'equal)
        unless (equal s u)
          do (incf (gethash s hash 0))
             (incf (gethash u hash 0))
        else
          do (incf (gethash s hash 0))
        finally (loop for (s . u) in sun
                      when (and (< 1 (gethash s hash)) (< 1 (gethash u hash)))
                        return (princ "No")
                      finally (princ "Yes"))))
