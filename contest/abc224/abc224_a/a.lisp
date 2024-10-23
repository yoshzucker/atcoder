(let* ((s (read-line))
       (tail (subseq s (1- (length s)))))
  (princ (if (string= tail "r") "er" "ist")))
