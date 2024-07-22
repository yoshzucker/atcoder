(let ((sn (loop repeat 8 collect (read-line))))
  (loop for s in sn for i downfrom 8
        do (loop for j below 8 for c across "abcdefgh"
                 when (char= (elt s j) #\*)
                   return (format t "~a~a" c i))))
