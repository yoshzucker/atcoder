(let* ((n (read))
       (k (read))
       (an (remove-duplicates (loop repeat n collect (read)))))
  (print (- (/ (* k (1+ k)) 2) (loop for a in an when (<= a k) sum a))))
