(let* ((n (read))
       (q (read))
       (uabq (loop repeat q collect (loop repeat 3 collect (read)))))
  (loop for (u a b) in uabq with hash = (make-hash-table :test #'equal)
        do (cond ((= u 1)
                  (setf (gethash (cons a b) hash) t))
                 ((= u 2)
                  (setf (gethash (cons a b) hash) nil))
                 (t
                  (format t "~:[No~;Yes~]~%" (and (gethash (cons a b) hash)
                                                  (gethash (cons b a) hash)))))))
