(let* ((n (read))
       (pn (loop repeat n collect (read)))
       (first (first pn))
       (rest (rest pn)))
  (print (if (or (null rest) (< (reduce #'max rest) first))
             0
             (1+ (- (reduce #'max rest) first)))))
