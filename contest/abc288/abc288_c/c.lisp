(let (parent-or-size)
  (defun uf-init (size)
    (setf parent-or-size (make-array size :initial-element -1)))

  (defun uf-root (x &key (test #'=))
    (if (minusp (elt parent-or-size x))
        x
        (setf (elt parent-or-size x)
              (uf-root (elt parent-or-size x) :test test))))

  (defun uf-size (x &key (test #'=))
    (- (elt parent-or-size (uf-root x :test test))))

  (defun uf-samep (x y &key (test #'=))
    (funcall test (uf-root x :test test) (uf-root y :test test)))

  (defun uf-unite (x y &key (test #'=))
    (let ((x (uf-root x :test test))
          (y (uf-root y :test test)))
      (unless (funcall test x y)
        (if (< (elt parent-or-size y) (elt parent-or-size x))
            (rotatef x y))
        (incf (elt parent-or-size x) (elt parent-or-size y))
        (setf (elt parent-or-size y) x))))

  (defun uf-parents ()
    parent-or-size)
  
  (defun uf-roots ()
    (loop for i below (length parent-or-size) do (uf-root i) finally (return parent-or-size)))

  (defun uf-force (list)
    (setf parent-or-size (coerce list 'vector))))


(let* ((n (read))
       (m (read))
       (abm (loop repeat m collect (cons (1- (read)) (1- (read))))))
  (uf-init n)
  (loop for (a . b) in abm
        unless (uf-samep a b)
          do (uf-unite a b)
        else
          count t into cnt
        finally (print cnt)))
