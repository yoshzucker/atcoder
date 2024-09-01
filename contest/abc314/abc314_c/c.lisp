(let* ((n (read))
       (m (read))
       (s (reverse (read-line)))
       (cn (reverse (loop repeat n collect (1- (read))))))
  (loop for i below n
        for c in cn
        with lastm = (make-array m :initial-element nil)
        do (when (elt lastm c)
             (rotatef (elt s i) (elt s (elt lastm c))))
           (setf (elt lastm c) i)
        finally (princ (reverse s))))
