(let* ((n (read))
       (sn (loop repeat n collect (read-line))))
  (loop for (i . r) on sn
        when (and (< 1 (length r))
                  (string= i (car r))
                  (string= i "sweet"))
          return (princ "No")
        finally (princ "Yes")))
