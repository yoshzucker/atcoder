(let* ((n (read))
       (pn (coerce (cons 0 (loop repeat (1- n) collect (read)) ) 'vector)))
  (loop with target = (1- n)
        for parent = (1- (elt pn target))
        count (setf target parent)
          into cnt
        until (= target 0)
        finally (print cnt)))
