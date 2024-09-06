(defun make-union-find (size &key (test #'=))
  "return data structure for union by size."
   (cons (make-array size :initial-element -1) test))

(defgeneric (setf parent-union) (new x union-table))

(defmethod parent-union (x union-table)
  (elt (car union-table) x))

(defmethod (setf parent-union) (new x union-table)
  (setf (elt (car union-table) x) new))

(defun root-union (x union-table)
  (if (minusp (parent-union x union-table))
      x
      (setf (parent-union x union-table)
            (root-union (parent-union x union-table) union-table))))

(defun size-union (x union-table)
  (- (parent-union (root-union x union-table) union-table)))

(defun samep-union (x y union-table)
  (destructuring-bind (parent-or-size . test) union-table
    (funcall test (root-union x union-table) (root-union y union-table))))

(defun unite-union (x y union-table)
  (destructuring-bind (parent-or-size . test) union-table
    (let ((x (root-union x union-table))
          (y (root-union y union-table)))
      (unless (funcall test x y)
        (if (< (parent-union y union-table) (parent-union x union-table))
            (rotatef x y))
        (incf (parent-union x union-table) (parent-union y union-table))
        (setf (parent-union y union-table) x)))))

(let* ((n (read))
       (m (read))
       (abm (loop repeat m collect (cons (1- (read)) (1- (read))))))
  (loop for (a . b) in abm with union = (make-union-find n)
        unless (samep-union a b union)
          do (unite-union a b union)
        else
          count t into cnt
        finally (print cnt)))
