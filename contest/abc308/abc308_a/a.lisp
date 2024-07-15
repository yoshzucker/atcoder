(let ((s (loop repeat 8 collect (read))))
  (format t "~:[No~;Yes~]" (and (apply #'<= s)
                                (every #'(lambda (x) (<= 100 x 675)) s)
                                (every #'(lambda (x) (zerop (mod x 25))) s))))
