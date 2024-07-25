(let* ((n (read))
       (m (read))
       (s (read-line))
       (u (read-line))
       (headp (string= s (subseq u 0 n)))
       (tailp (string= s (subseq u (- m n)))))
  (cond ((and headp tailp)
         (print 0))
        (headp
         (print 1))
        (tailp
         (print 2))
        (t
         (print 3))))
