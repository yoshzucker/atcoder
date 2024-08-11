(defun split-string (string &rest parser-functions)
  "split string by spaces. then, apply the elements to functions. if there are more elements than functions, the remaining elements are applied to the last function. if no functions are provided, the elements will be string"
  (loop with str = string for p = (position #\Space str)
        for fn = (or (pop parser-functions) fn)
        collect (funcall (or fn #'identity) (subseq str 0 p))
        while p
        do (setf str (subseq str (1+ p)))))

(let* ((q (read))
       (qxq (loop repeat q collect (split-string (read-line) #'parse-integer))))
  (loop for (q x) in qxq with bag = (make-hash-table)
        do (cond ((= q 1)
                  (setf (gethash x bag)
                        (if (gethash x bag)
                            (1+ (gethash x bag))
                            1)))
                 ((= q 2)
                  (if (= (gethash x bag) 1)
                      (remhash x bag)
                      (setf (gethash x bag) (1- (gethash x bag)))))
                 (t
                  (print (hash-table-count bag))))))
