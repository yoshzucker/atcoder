(defun crosspair (lst1 lst2)
  (loop for x in lst1
        append (loop for y in lst2
                     collect (cons x y))))

(let* ((h (read))
       (w (read))
       (n (min h w))
       (mx (make-array (list h w)
                       :initial-contents
                       (loop repeat h collect (read-line)))))
  (loop for o below (* h w) for oi = (floor o w) and oj = (mod o w)
        with sn = (make-array n :initial-element 0)
        do (loop for k from 0
                 while (loop for (di . dj) in (crosspair '(-1 1) '(-1 1)) 
                             for i = (+ oi (* di k))
                             for j = (+ oj (* dj k))
                             never (or (minusp i) (minusp j) (<= h i) (<= w j))
                             always (char= (aref mx i j) #\#))
                 finally (when (<= 2 k)
                           (incf (elt sn (- k 2)))))
        finally (format t "~{~a ~}" (coerce sn 'list))))
