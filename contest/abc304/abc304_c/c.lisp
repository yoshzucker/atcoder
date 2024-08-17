(defun dist (xy1 xy2)
  (sqrt (+ (expt (- (car xy1) (car xy2)) 2)
           (expt (- (cdr xy1) (cdr xy2)) 2))))

(let* ((n (read))
       (d (read))
       (xyn (loop repeat n collect (cons (read) (read)))))
  (loop with stack = '(0) while stack
        for p = (pop stack)
        for xyp = (elt xyn p)
        with pos = (make-array n :initial-element nil)
        do (loop for xy in xyn for i from 0
                 when (and (<= (dist xy xyp) d)
                           (not (elt pos i)))
                   do (push i stack)
                      (setf (elt pos i) t))
        finally (format t "~{~:[No~;Yes~]~%~}" (coerce pos 'list))))
