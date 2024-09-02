(defun duplicate (2d-array)
  (destructuring-bind (x y) (array-dimensions 2d-array)
    (let ((ary (make-array (list (* x 3) (* y 3)) :initial-element nil)))
      (loop for si below 3
            do (loop for sj below 3
                     do (loop for i below x
                              do (loop for j below y
                                       do (setf (aref ary (+ i (* si x)) (+ j (* sj y))) (aref 2d-array i j)))))
            finally (return ary)))))

(defun dot (2d-array)
  (destructuring-bind (x y) (array-dimensions 2d-array)
    (loop for i below x
          do (loop for j below y
                   when (= (floor i (/ x 3)) (floor j (/ y 3)) 1)
                     do (setf (aref 2d-array i j) #\.))
          finally (return 2d-array))))

(defun prina (2d-array)
  (destructuring-bind (x y) (array-dimensions 2d-array)
    (loop for i below x
          do (loop for j below y
                   do (format t "~a" (aref 2d-array i j)))
             (format t "~%"))))

(let ((n (read)))
  (loop repeat n with mx = (make-array (list 1 1) :initial-element #\#)
        do (setf mx (dot (duplicate mx)))
        finally (prina mx)))
