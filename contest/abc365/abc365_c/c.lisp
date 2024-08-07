(let* ((n (read))
       (m (read))
       (an (coerce (sort (loop repeat n collect (read)) #'<) 'vector)))
  ;; (format t "~a~%" an)
  (loop named outer
        for i below n
        with x = 0 with next = (elt an 0)
        with amount = (* next n) with old = amount
        when (/= next (elt an i))
          do (setf next (elt an i))
             (incf amount (* (- next x) (- n i)))
        ;; do (format t "~a ~a ~a ~a~%" i x next amount)
        when (<= amount m)
          do (setf x next)
             (setf old amount)
        else
          ;; do (return (print x))
          do (loop with left = x and right = next and mid
                   with midvar
                   while (< left right)
                   ;; do (format t "~a ~a " left right)
                   do (setf mid (floor (+ left right) 2))
                      (setf midvar (+ old (* (- mid left) (- n i))))
                      ;; (format t "~a ~a~%" mid midvar)
                      (cond ((= midvar m)
                             (return-from outer (print mid)))
                            ((< midvar m)
                             (setf left (1+ mid)))
                            (t
                             (setf right (1- mid))))
                   finally (return-from outer (print mid)))
        ;; do (format t "~a ~a ~a ~a~%" i x next amount)
        finally (princ "infinite")))
