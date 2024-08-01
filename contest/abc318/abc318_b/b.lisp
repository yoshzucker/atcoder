(let* ((n (read))
       (abcdn (loop repeat n collect (list (read) (read) (read) (read))))
       (room (make-array '(101 101) :initial-element nil)))
  (loop for (a b c d) in abcdn
        do (loop for y from c below d
                 do (loop for x from a below b
                          do (setf (aref room y x) t))))
  (loop for i below 101
        sum (loop for j below 101
                  count (aref room i j))
          into it
        finally (print it)))
