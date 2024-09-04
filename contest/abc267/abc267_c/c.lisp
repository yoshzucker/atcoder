(let* ((n (read))
       (m (read))
       (an (coerce (loop repeat n collect (read)) 'vector)))
  (loop for i from (1- m) below n
        with stairs = (loop for i from 0 below m sum (* (1+ i) (elt an i)))
        with bottom = (reduce #'+ (subseq an 0 m))
        when (<= m i)
          do (setf stairs (+ (- stairs bottom) (* m (elt an i))))
             (setf bottom (+ (- bottom (elt an (- i m))) (elt an i)))
        maximize stairs into mx
        finally (print mx)))
