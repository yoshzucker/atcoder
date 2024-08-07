(let* ((n (read))
       (k (read))
       (ak (loop repeat k collect (read))))
  (let ((ln (length ak))
        (diff (mapcar #'- ak (rest ak))))
    (when (and (< 1 ln) (oddp ln))
      (setf ak (remove (nth (position (apply #'min diff) diff) ak) ak))))
  (loop for s = (pop ak) while ak for e = (pop ak)
        sum (- e s) into it
        finally (print it)))
