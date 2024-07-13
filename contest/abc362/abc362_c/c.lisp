(let* ((n (read))
       (lrn (loop repeat n collect (list (read) (read)))))
  (loop for (l r) in lrn
        when (plusp l)
          collect l into lst
        when (minusp r)
          collect r into lst
        )
        sum l into sl
        sum r into sr
        finally ()))
