(let (parent-or-size)
  (defun make-union-find (size &key (test #'=))
    (cons (make-array size :initial-element -1) test))

  (defun root-union (x union-table)
    (destructuring-bind (parent-or-size . test) union-table
      (if (minusp (elt parent-or-size x))
          x
          (setf (elt parent-or-size x)
                (root-union (elt parent-or-size x) union-table)))))

  (defun size-union (x union-table)
    (destructuring-bind (parent-or-size . test) union-table
      (- (elt parent-or-size (root-union x union-table)))))

  (defun samep-union (x y union-table)
    (destructuring-bind (parent-or-size . test) union-table
      (funcall test (root-union x union-table) (root-union y union-table))))

  (defun unite-union (x y union-table)
    (destructuring-bind (parent-or-size . test) union-table
      (let ((x (root-union x union-table))
            (y (root-union y union-table)))
        (unless (funcall test x y)
          (if (< (elt parent-or-size y) (elt parent-or-size x))
              (rotatef x y))
          (incf (elt parent-or-size x) (elt parent-or-size y))
          (setf (elt parent-or-size y) x)))))

  (defun uf-parents ()
    parent-or-size)
  
  (defun uf-roots ()
    (loop for i below (length parent-or-size) do (root-union i) finally (return parent-or-size)))

  (defun uf-force (list)
    (setf parent-or-size (coerce list 'vector))))


(let* ((n (read))
       (m (read))
       (abm (loop repeat m collect (cons (1- (read)) (1- (read))))))
  (loop for (a . b) in abm with union = (make-union-find n)
        unless (samep-union a b union)
          do (unite-union a b union)
        else
          count t into cnt
        finally (print cnt)))
