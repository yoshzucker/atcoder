(let ((as (make-array '(9 9)
                      :initial-contents
                      (loop repeat 9 collect (loop repeat 9 collect (read)))))
      (ans t))
  (loop for i below 9
        do (loop for j below 9
                 collect (aref as i j) into it
                 finally (setf ans (and ans (= (length (remove-duplicates it)) 9)))))
  (loop for i below 9
        do (loop for j below 9
                 collect (aref as j i) into it
                 finally (setf ans (and ans (= (length (remove-duplicates it)) 9)))))
  (loop for l below 9 by 3
        do (loop for m below 9 by 3
                 do (loop for i below 3
                          append (loop for j below 3
                                       collect (aref as (+ i l) (+ j m)))
                            into it
                          finally (setf ans (and ans (= (length (remove-duplicates it)) 9))))))
  (format t "~:[No~;Yes~]" ans))
