(let* ((n (read))
       (sn (loop repeat n collect (read-line)))
       (exist))
  (loop for i below n
        do (loop for j below n
                 for str = (concatenate 'vector (elt sn i) (elt sn j))
                 unless (= i j)
                   do (loop for l to (floor (length str) 2)
                            for f = (elt str l)
                            for r = (elt str (- (length str) l 1))
                            when (char/= f r)
                              return nil
                            finally (setf exist t))))
  (format t "~:[No~;Yes~]" exist))
