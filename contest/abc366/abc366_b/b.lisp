(defun prina (2d-array)
  (destructuring-bind (x y) (array-dimensions 2d-array)
    (loop for i below x
          do (loop for j below y
                   do (format t "~a" (aref 2d-array i j)))
             (format t "~%"))))

(defun transpose (2d-array)
  (destructuring-bind (h w) (array-dimensions 2d-array)
    (loop for i below h with array = (make-array (list w h))
          do (loop for j below w
                   do (setf (aref array j i) (aref 2d-array i j)))
          finally (return array))))

(defun sequences->2d-array (sequences &key (initial-element nil))
  (let* ((h (length sequences))
         (w (apply #'max (mapcar #'length sequences)))
         (array (make-array (sequences h w) :initial-element initial-element)))
    (loop for seq in sequences for i from 0
          do (loop for j from 0 below (length seq)
                   do (setf (aref array i j) (elt seq j)))
          finally (return array))))

(defun 2d-array->list (2d-array)
  (destructuring-bind (h w) (array-dimensions 2d-array)
    (loop for i below h
          collect (loop for j below w
                        collect (aref 2d-array i j)))))

(let* ((n (read))
       (sn (loop repeat n collect (read-line)))
       (un (transpose (sequences->2d-array sn :initial-element #\*))))
  (setf un (mapcar #'reverse (2d-array->list un)))
  (loop for u in un
        do (loop for j downfrom (1- (length u)) to 0
                 while (char= (elt u j) #\*)
                 do (setf (elt u j) #\Space)))
  (prina (sequences->2d-array un)))
  
