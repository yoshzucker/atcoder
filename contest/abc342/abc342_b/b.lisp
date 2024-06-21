(let* ((n (read))
       (pi (loop repeat n collect (read)))
       (q (read))
       (abi (loop repeat q collect (list (read) (read)))))
  (loop for (a b) in abi
        do (if (< (position a pi) (position b pi))
               (print a)
               (print b))))
