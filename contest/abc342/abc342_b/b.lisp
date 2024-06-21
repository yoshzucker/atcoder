(let* ((n (read))
       (ps (loop repeat n collect (read)))
       (q (read))
       (abi (loop repeat q collect (list (read) (read)))))
  (loop for (a b) in abi
        do (if (< (position a ps) (position b ps))
               (print a)
               (print b))))

