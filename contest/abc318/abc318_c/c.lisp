(let* ((n (read))
       (d (read))
       (p (read))
       (fn (sort (loop repeat n collect (read)) #'>)))
  (loop for f in fn with rem = d and amountt = 0 and amountd = 0
        do (decf rem)
           (incf amountd f)
           (when (zerop rem)
             (incf amountt (min amountd p))
             (setf amountd 0)
             (setf rem d))
        finally (when (plusp amountd)
                  (incf amountt (min amountd p)))
                (print amountt)))
