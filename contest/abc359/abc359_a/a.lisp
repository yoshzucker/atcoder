(let* ((n (read))
       (si (loop repeat n collect (read-line))))
  (print (count "Takahashi" si :test #'string=)))
