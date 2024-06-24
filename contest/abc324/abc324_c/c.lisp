(let* ((n (read))
       (td (read-line))
       (sn (loop repeat n collect (read-line))))
  (loop for i from 1 to n for s in sn
        for mis = (mismatch td s) and d = (- (length s) (length td))
        when (or
              (null mis)
              (and (<= 0 d 1) (string= (subseq td mis) (subseq s (1+ mis))))
              (and (<= -1 d 0) (string= (subseq td (1+ mis)) (subseq s mis)))
              (and (<= -1 d 1) (string= (subseq td (1+ mis)) (subseq s (1+ mis)))))
          collect i into it
        finally (format t "~a~%~{~a ~}" (length it) it)))
