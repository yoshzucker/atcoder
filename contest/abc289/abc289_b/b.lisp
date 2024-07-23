(let* ((n (read))
       (m (read))
       (am (loop repeat m collect (1- (read)))))
  (loop for i below n with a = (pop am) and lst and stack
        when (and a (= (1+ a) i))
          do (push (1+ i) stack)
             (setf a (pop am))
        else
          do (push stack lst)
             (setf stack (list (1+ i)))
        finally (push stack lst)
                (format t "~{~{~a ~}~}" (reverse lst))))
