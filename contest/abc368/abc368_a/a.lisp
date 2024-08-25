(let* ((n (read))
       (k (read))
       (an (loop repeat n collect (read))))
  (format t "~{~a ~}" (concatenate 'list
                                   (subseq an (- n k))
                                   (subseq an 0 (- n k)))))
