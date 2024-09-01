(let* ((n (read))
       (asn (loop repeat n collect (cons (read) (read)))))
  (loop for (a . s) in asn with lpos and rpos and fatigue = 0
        when (eql s 'L)
          do (when lpos
               (incf fatigue (abs (- a lpos))))
             (setf lpos a)
        when (eql s 'L)
          do (when rpos
               (incf fatigue (abs (- a rpos))))
             (setf rpos a)
        finally (print fatigue)))
