(defun prina (2d-array)
  (destructuring-bind (x y) (array-dimensions 2d-array)
    (loop for i below x
          do (loop for j below y
                   do (format t "~a" (aref 2d-array i j)))
             (format t "~%"))))

(let* ((n (read))
       (sn (loop repeat n collect (read-line)))
       (m (loop for s in sn maximize (length s)))
       (un (make-array (list m n) :initial-element nil)))
  (loop for j from 0 below m
        do (loop for i from (1- n) downto 0
                 for s = (elt sn i)
                 do (setf (aref un j (- n i 1))
                          (if (<= (length s) j)
                              #\*
                              (elt s j)))))
  (loop for j from 0 below m
        do (loop for i from (1- n) downto 0
                 until (char/= (aref un j i) #\*)
                 when (char= (aref un j i) #\*)
                   do (setf (aref un j i) #\Space)))
  (prina un))
  
