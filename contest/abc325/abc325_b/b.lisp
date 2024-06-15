(let* ((n (read))
       (wxi (loop repeat n collect (list (read) (read)))))
  (loop for c below 24
        maximize (loop for (w x) in wxi
                       when (<= 9 (mod (+ c x) 24) 17)
                         sum w)
          into m
        finally (print m)))
