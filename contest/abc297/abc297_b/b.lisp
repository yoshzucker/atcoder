(let ((s (read-line)))
  (format t "~:[No~;Yes~]" (and (oddp (- (position #\B s)
                                         (position #\B s :from-end t)))
                                (< (position #\R s)
                                   (position #\K s)
                                   (position #\R s :from-end t)))))