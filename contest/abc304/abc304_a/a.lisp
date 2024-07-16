(defun read-list (&rest functions)
  (loop with str = (read-line) for p = (position #\Space str)
        for fn = (or (pop functions) fn)
        collect (funcall (or fn #'identity) (subseq str 0 p))
        while p
        do (setf str (subseq str (1+ p)))))

(let* ((n (read))
       (san (loop repeat n collect (read-list nil #'parse-integer))))
  (loop for i below n
        with s = (position (reduce #'min san :key #'second) san :key #'second)
        do (format t "~a~%" (first (elt san (mod (+ s i) n))))))
