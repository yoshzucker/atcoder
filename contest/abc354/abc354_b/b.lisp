(let* ((n (read))
       (sci (loop repeat n collect (let* ((s (read-line))
                                          (spc (position #\Space s)))
                                     (list
                                      (subseq s 0 spc)
                                      (parse-integer (subseq s (1+ spc)))))))
       (sum (reduce #'+ sci :key #'second))
       (mod (mod sum n)))
  (princ (first (nth mod (sort sci #'string< :key #'first)) )))
