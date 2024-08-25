(let ((s (read-line))
      (u (read-line)))
  (flet ((pos (c)
           (let ((p (position c s :test #'char-equal)))
             (or p -1))))
    (format t "~:[No~;Yes~]"
            (or (< (pos (elt u 0))
                   (pos (elt u 1))
                   (pos (elt u 2)))
                (and (< (pos (elt u 0))
                        (pos (elt u 1)))
                     (char= (elt u 2) #\X))))))

