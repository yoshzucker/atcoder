(let ((n (read))
      (s (read-line)))
  (loop for chr across s with a and b and c for i from 1
        do (when (char= chr #\A) (setf a t))
           (when (char= chr #\B) (setf b t))
           (when (char= chr #\C) (setf c t))
        until (and a b c)
        finally (print i)))
