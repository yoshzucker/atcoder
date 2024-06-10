(let* ((n (read))
       (ai (loop repeat n collect (read))))
  (loop for a on ai
        when (second a)
          collect (* (first a) (second a)) into bi
        finally (format t "~{~a ~}" bi)))
