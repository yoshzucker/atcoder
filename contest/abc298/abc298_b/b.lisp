(defun 2d-shift (2d-array &key (h-step 1) (w-step 0))
  (destructuring-bind (h w) (array-dimensions 2d-array)
    (loop for i below h with array = (make-array (list h w))
          do (loop for j below w
                   do (setf (aref array i j)
                            (aref 2d-array
                                  (mod (+ i h-step) h)
                                  (mod (+ j w-step) w))))
          finally (return array))))

(defun 2d-rotate (2d-array)
  (destructuring-bind (h w) (array-dimensions 2d-array)
    (loop for i below h
          do (loop for j below w
                   do (rotatef (aref 2d-array i j)
                               (aref 2d-array (- h j 1) i)))
          finally (return 2d-array))))

(let* ((n (read))
       (ann (make-array (list n n)
                        :initial-contents
                        (loop repeat n collect (loop repeat n collect (read)))))
       (bnn (make-array (list n n)
                        :initial-contents
                        (loop repeat n collect (loop repeat n collect (read))))))
  (2d-rotate ann)
  )
