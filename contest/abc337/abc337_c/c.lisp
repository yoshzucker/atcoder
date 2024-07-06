(let* ((n (read))
       (prevn (loop repeat n collect (read)))
       (nextn (make-array (1+ n) :initial-element nil)))
  (loop for next from 1 to n for prev in prevn
        do (setf (elt nextn (max 0 prev)) next))
  (loop repeat n for next = (elt nextn 0) then (elt nextn next)
        do (format t "~a " next)))
