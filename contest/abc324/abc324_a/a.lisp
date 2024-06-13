(let* ((n (read))
       (ai (loop repeat n collect (read))))
  (format t "~:[No~;Yes~]" (apply #'= ai)))
