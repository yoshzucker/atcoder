(let* ((n (read))
       (m (read))
       (am (loop repeat m collect (read)))
       (snm (loop repeat n
                  collect (map 'list #'(lambda (x) (char= x #\o)) (read-line))))
       (pnm (loop for s in snm
                  collect (mapcar #'(lambda (x a) (if x a 0)) s am)))
       (pn (mapcar #'(lambda (lst) (reduce #'+ lst)) pnm))
       (pn (mapcar #'+ pn (loop for i from 1 to n collect i)))
       (maxp (reduce #'max pn))
       (remnm (loop for s in snm
                    collect (remove nil (mapcar #'(lambda (x a) (unless x a))
                                                s am))))
       (remnm (mapcar #'(lambda (lst) (sort lst #'>)) remnm)))
  (loop for p in pn for remm in remnm
        do (loop while (< p maxp) for rem in remm with k = 0
                 do (incf p rem)
                    (incf k)
                 finally (print k))))

