(let* ((xyn (loop repeat 3 collect (cons (read) (read))))
       (xn (mapcar #'car xyn))
       (yn (mapcar #'cdr xyn)))
  (loop for x in xn
        for y in yn
        when (= (count x xn) 1)
          collect x into ax
        when (= (count y yn) 1)
          collect y into ay
        finally (format t "~a ~a" (car ax) (car ay))))
