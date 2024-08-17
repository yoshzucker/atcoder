(let* ((h (read))
       (w (read))
       (shw (make-array (list h w)
                        :initial-contents
                        (loop repeat h collect (read-line)))))
  (loop named outer
        for o below (* h w) for oi = (floor o w) and oj = (mod o w)
        do (loop for (di . dj) in '((0 . 0) (0 . 1) (1 . 0) (1 . 1)) 
                 for i = (+ oi di)
                 for j = (+ oj dj)
                 with c
                 never (or (minusp i) (minusp j) (<= h i) (<= w j))
                 when (char= (aref shw i j) #\.)
                   do (setf c (cons (1+ i) (1+ j)))
                 count (char= (aref shw i j) #\#) into cnt
                 finally (when (= cnt 3)
                           (return-from outer
                             (format t "~a ~a~%" (car c) (cdr c)))))))
