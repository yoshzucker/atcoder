(defun 2d-array-shift (2d-array &key (h-step 1) (w-step 0))
  (destructuring-bind (h w) (array-dimensions 2d-array)
    (loop for i below h with array = (make-array (list h w))
          do (loop for j below w
                   do (setf (aref array i j)
                            (aref 2d-array
                                  (mod (+ i h-step) h)
                                  (mod (+ j w-step) w))))
          finally (return array))))

(let* ((h (read))
       (w (read))
       (ahw (make-array (list h w)
                        :initial-contents
                        (loop repeat h collect (read-line))))
       (bhw (make-array (list h w)
                        :initial-contents
                        (loop repeat h collect (read-line)))))
  (loop named outer repeat h
        do (setf ahw (2d-array-shift ahw :h-step 1 :w-step 0))
           (loop repeat w
                 do (setf ahw (2d-array-shift ahw :h-step 0 :w-step 1))
                 when (equalp ahw bhw)
                   do (return-from outer (princ "Yes")))
        finally (princ "No")))
