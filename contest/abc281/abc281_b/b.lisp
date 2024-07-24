(let ((s (read-line)))
  (format t "~:[No~;Yes~]"
          (and (char<= #\A (elt s 0) #\Z)
               (char<= #\A (elt s (1- (length s))) #\Z)
               (= (length s) 8)
               (char<= #\1 (elt s 1))
               (loop for i from 1 below (1- (length s))
                     always (char<= #\0 (elt s i) #\9)))))
