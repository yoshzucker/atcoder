(let* ((s (read-line))
       (some (mapcar #'(lambda (lst)
                         (some #'(lambda (x) (char= x #\1))
                               (mapcar #'(lambda (x) (elt s (1- x))) lst)))
                     '((7) (4) (2 8) (1 5) (3 9) (6) (10)))))
  (loop for (a b) on (push nil some)
        count (and (not a) b) into cnt
        finally (format t "~:[No~;Yes~]" (and (<= 2 cnt)
                                              (char= (elt s 0) #\0)))))

