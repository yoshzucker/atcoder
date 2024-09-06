(let ((n (read))
      (a (read))
      (b (read))
      (s (read-line)))
  (loop for i below n with suma = 0 for sumb = 0
        do (loop for j below (floor n 2)
                 when (char/= (elt s j) (elt s (- n j 1)))
                   do (incf sumb b))
        minimize (+ suma sumb) into spent
        do (setf s (concatenate 'string (subseq s 1 n) (subseq s 0 1)))
           (incf suma a)
        finally (print spent)))
