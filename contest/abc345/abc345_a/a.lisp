(let ((s (read-line)))
  (format t "~a" (if (and (char= (elt s 0) #\<)
                          (= (count #\< s) 1)
                          (char= (elt s (1- (length s))) #\>)
                          (= (count #\> s) 1))
                     "Yes" "No")))
