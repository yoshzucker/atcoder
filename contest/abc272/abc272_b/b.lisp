(defun split-string (string &rest parser-functions)
  "split string by spaces. then, apply the elements to functions. if there are more elements than functions, the remaining elements are applied to the last function. if no functions are provided, the elements will be string"
  (loop with str = string for p = (position #\Space str)
        for fn = (or (pop parser-functions) fn)
        collect (funcall (or fn #'identity) (subseq str 0 p))
        while p
        do (setf str (subseq str (1+ p)))))

(let* ((n (read))
       (m (read))
       (kxm (loop repeat m collect (split-string (read-line) #'parse-integer))))
  (loop for i below m with ary = (make-array (list n n) :initial-element nil)
        for kx in kxm for k = (pop kx) for x = (mapcar #'1- kx)
        do (loop for l below k
                 do (loop for m from (1+ l) below k
                          do (setf (aref ary (elt x l) (elt x m)) t)))
        finally (format t "~:[No~;Yes~]"
                        (loop for i below n
                              always (loop for j from (1+ i) below n
                                           always (aref ary i j))))))
