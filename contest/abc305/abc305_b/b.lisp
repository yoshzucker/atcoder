(let* ((p (read))
       (q (read))
       (len (nreverse
             (mapcar #'(lambda (lst) (reduce #'+ lst))
                     (maplist #'identity (nreverse '(3 1 4 1 5 9))))))
       (pair (pairlis '(a b c d e f g) (cons 0 len))))
  (print (abs (- (cdr (assoc p pair)) (cdr (assoc q pair))))))
