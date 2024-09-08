(let ((s (read-line))
      (u (read-line))
      x)
  (loop for i below (length s)
        for cs = (elt s i)
        for cu = (elt u i)
        when (char< cu cs)
          do (setf (elt s i) cu)
             (push (copy-seq s) x))
  (loop for i downfrom (1- (length s)) to 0
        for cs = (elt s i)
        for cu = (elt u i)
        when (char/= cu cs)
          do (setf (elt s i) cu)
             (push (copy-seq s) x))
  (format t "~a~%~{~a~%~}" (length x) (reverse x)))
