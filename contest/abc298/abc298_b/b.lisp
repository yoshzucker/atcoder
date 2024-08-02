(let* ((n (read))
       (a (make-array (list n n)
                      :initial-contents
                      (loop repeat n collect (loop repeat n collect (read)))))
       (b (make-array (list n n)
                      :initial-contents
                      (loop repeat n collect (loop repeat n collect (read))))))
  (flet ((rotatef-a ()
           (loop for i below n
                 do (loop for j below n
                          do (rotatef (aref a (1- i) (1- j))
                                      (aref a (- n j -2) (1- i))))))
         (test (a)
           (loop for i below n
                 do (loop for j below n
                          always (if (= (aref a i j) 1)
                                     (= (aref a i j) (aref b i j))
                                     t)))))
    (loop repeat 4
          do (rotatef-a)
          when (test a)
            return (princ "Yes")
          finally (princ "No"))))
