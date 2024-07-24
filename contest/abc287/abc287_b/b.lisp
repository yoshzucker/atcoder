(let* ((n (read))
       (m (read))
       (sn (loop repeat n collect (read-line)))
       (sn (mapcar #'(lambda (x) (subseq x (- (length x) 3) (length x))) sn))
       (tm (loop repeat m collect (read-line))))
  (loop for u in (remove-duplicates tm :test #'string=)
        sum (count t (mapcar #'(lambda (x) (string= u x)) sn))
          into it
        finally (print it)))
