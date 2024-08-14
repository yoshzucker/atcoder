(let (parent rank)
  (defun uf-init (size)
    (setf rank (make-array size :initial-element 0))
    (setf parent (make-array size
                             :initial-contents
                             (loop for i below size collect i))))

  (defun uf-root (x &key (test #'=))
    (labels ((root (x acc)
               (let ((p (elt parent x)))
                 (cond ((funcall test p x)
                        (mapcar #'(lambda (a) (setf (elt parent a) x)) acc)
                        x)
                       (t
                        (root p (cons x acc)))))))
      (root x nil)))

  ;; (defun uf-root (x &key (test #'=))
  ;;   (let ((p (elt parent x)))
  ;;     (if (= p x)
  ;;         x
  ;;         (setf (elt parent x) (uf-root p)))))

  (defun uf-samep (x y &key (test #'=))
    (funcall test (uf-root x :test test) (uf-root y :test test)))

  (defun uf-unite (x y &key (test #'=))
    (let ((x (uf-root x :test test))
          (y (uf-root y :test test)))
      (unless (funcall test x y)
        (let ((rx (elt rank x))
              (ry (elt rank y)))
          (cond ((< rx ry)
                 (setf (elt parent x) y))
                (t
                 (if (= rx ry)
                     (incf (elt rank x)))
                 (setf (elt parent y) x)))))))

  (defun uf-ranks ()
    rank)

  (defun uf-roots ()
    (loop for i below (length parent) do (uf-root i) finally (return parent)))

  (defun uf-force (list)
    (setf parent (coerce list 'vector))))

(let* ((n (read))
       (m (read))
       (uvm (loop repeat m collect (cons (1- (read)) (1- (read))))))
  (loop for (u . v) in uvm
          initially (uf-init n)
        do (uf-unite u v))
  (print (length (remove-duplicates (uf-roots)))))

