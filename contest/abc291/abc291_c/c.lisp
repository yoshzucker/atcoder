(defun dirpair (dir)
  (destructuring-bind (r l u d -) '(1 -1 1 -1 0)
    (cond ((char= dir #\R) (list r -)) ;x y
          ((char= dir #\L) (list l -))
          ((char= dir #\U) (list - u))
          ((char= dir #\D) (list - d)))))

(let ((n (read))
      (s (read-line)))
  (loop for c across s with x = 0 and y = 0
        with hash = (make-hash-table :test #'equal)
          initially (setf (gethash (cons x y) hash) t)
        do (destructuring-bind (dx dy) (dirpair c)
             (incf x dx)
             (incf y dy)
             (if (gethash (cons x y) hash)
                 (return (princ "Yes"))
                 (setf (gethash (cons x y) hash) t)))
        finally (princ "No")))
