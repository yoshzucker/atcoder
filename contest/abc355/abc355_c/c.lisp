(let* ((n (read))
       (u (read))
       (au (loop repeat u collect (read)))
       (ary (make-array (list n n) :initial-element nil)))
  (flet ((bingop (ary i j)
           (or (loop for x below n always (aref ary i x))
               (loop for x below n always (aref ary x j))
               (loop for x below n always (aref ary x x))
               (loop for x below n always (aref ary x (- n 1 x))))))
    (loop for a in au for turn from 1
          for i = (floor (1- a) n) and j = (mod (1- a) n)
          do (setf (aref ary i j) t)
          when (bingop ary i j)
            return (print turn)
          finally (print -1))))