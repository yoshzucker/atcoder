(defmacro incc (place ceil &optional (delta 1))
  `(setf ,place (mod (+ ,place ,delta) ,ceil)))

(let* ((m (read))
       (dm (loop repeat m collect (read))))
  (loop for i from 1 below (ceiling (reduce #'+ dm) 2) with month = 0 and day = 0
        do (when (zerop (incc day (elt dm month)))
             (incc month (length dm)))
        finally (format t "~a ~a" (1+ month) (1+ day))))
