(let* ((n (read))
       (k (read))
       (an (loop repeat n collect (read))))
  (let ((k (min (length an) k)))
    (format t "~{~a ~}" (append (subseq an k) (loop repeat k collect 0)))))
