(defun split-string (string &rest parser-fns)
  "split string by spaces. then, apply the elements to functions. if there are more elements than functions, the remaining elements are applied to the last function. if no functions are provided, the elements will be string"
  (loop with str = string for p = (position #\Space str)
        for fn = (or (pop parser-fns) fn)
        collect (funcall (or fn #'identity) (subseq str 0 p))
        while p
        do (setf str (subseq str (1+ p)))))


(let* ((n (read))
       (q (read))
       (qq (loop repeat q collect (split-string (read-line) #'parse-integer)))
       (box-has (make-hash-table))
       (is-in (make-hash-table)))
  (loop for (q i j) in qq
        do (cond ((= q 1)
                  (push i (gethash j box-has))
                  (pushnew j (gethash i is-in)))
                 ((= q 2)
                  (format t "~{~a ~}~%" (sort (copy-seq (gethash i box-has)) #'<)))
                 ((= q 3)
                  (format t "~{~a ~}~%" (sort (copy-seq (gethash i is-in)) #'<))))))
