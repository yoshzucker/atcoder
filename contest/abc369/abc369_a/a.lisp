(let ((a (read))
      (b (read)))
  (cond ((= a b)
         (print 1))
        ((evenp (- b a))
         (print 3))
        (t
         (print 2))))
