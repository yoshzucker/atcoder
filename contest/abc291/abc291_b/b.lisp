(let* ((n (read))
       (xn (sort (loop repeat (* n 5) collect (read)) #'<)))
  (setf xn (subseq xn n (* 4 n)))
  (format t "~a" (coerce (/ (reduce #'+ xn) (* n 3)) 'single-float)))
