(defun copy-array (2d-array)
  (destructuring-bind (h w) (array-dimensions 2d-array)
    (make-array (list h w)
                :initial-contents
                (loop for i below h
                      collect (loop for j below w
                                    collect (aref 2d-array i j))))))

(defun remnil (2d-array rh rw)
  (destructuring-bind (h w) (array-dimensions 2d-array)
    (make-array (list rh rw)
                :initial-contents
                (remove nil (loop for i below h
                                  collect (loop for j below w
                                                when (aref 2d-array i j)
                                                  collect it))))))

(let* ((ah (read))
       (aw (read))
       (ahw (make-array (list ah aw)
                        :initial-contents
                        (loop repeat ah
                              collect (loop repeat aw collect (read)))))
       (bh (read))
       (bw (read))
       (bhw (make-array (list bh bw)
                        :initial-contents
                        (loop repeat bh
                              collect (loop repeat bw collect (read))))))
  (loop named outer
        for hw = (copy-array ahw)
        with digith = ah for dh below (ash 1 digith)
        when (= (logcount dh) bh) 
          do (loop for i below digith
                   unless (logbitp i dh)
                     do (loop for j below aw
                              do (setf (aref hw i j) nil))
                   finally (loop for hw2 = (copy-array hw)
                                 with digitw = aw for dw below (ash 1 digitw)
                                 when (= (logcount dw) bw) 
                                   do (loop for i below digitw
                                            unless (logbitp i dw)
                                              do (loop for j below ah
                                                       do (setf (aref hw2 j i) nil))
                                            finally (when (equalp (remnil hw2 bh bw) bhw)
                                                      (return-from outer (princ "Yes"))))))
        finally (princ "No")))

