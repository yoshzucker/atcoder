(let ((n (read)))
  (loop for i from 1 to n with v = nil
        do (setf v (concatenate 'string v (if (zerop (mod i 3)) "x" "o")) )
        finally (format t "~a" v)))
