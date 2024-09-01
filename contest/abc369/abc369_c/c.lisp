(defun pat (x)
  (loop for i downfrom x to 1 sum i))

(let* ((n (read))
       (an (loop repeat n collect (read)))
       (df (mapcar #'- (rest an) an)))
  (print (+ n
            (loop for (d s) on df with seq = 1 and cnt = 0
                  when (eql d s)
                    do (incf seq)
                  else
                    do (incf cnt (pat seq))
                       (setf seq 1)
                  finally (return cnt)))))
