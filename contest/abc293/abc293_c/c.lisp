(let* ((h (read))
       (w (read))
       (mx (make-array (list h w)
                       :initial-contents
                       (loop repeat h
                             collect (loop repeat w collect (read)))))
       (cnt 0))
  (labels ((recursion (lst i j)
             (cond ((or (= h i) (= w j)))
                   ((and (= (1- h) i) (= (1- w) j))
                    (let ((lst (cons (aref mx i j) lst)))
                      (when (= (length lst) (length (remove-duplicates lst)))
                        (incf cnt))))
                   (t
                    (recursion (cons (aref mx i j) lst) i (1+ j))
                    (recursion (cons (aref mx i j) lst) (1+ i) j)))))
    (recursion nil 0 0)
    (print cnt)))
