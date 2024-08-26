(defun split-string (string &rest parser-functions)
  "split string by spaces. then, apply the elements to functions. if there are more elements than functions, the remaining elements are applied to the last function. if no functions are provided, the elements will be string"
  (loop with str = string for p = (position #\Space str)
        for fn = (or (pop parser-functions) fn)
        collect (funcall (or fn #'identity) (subseq str 0 p))
        while p
        do (setf str (subseq str (1+ p)))))


(let* ((su (split-string (read-line) #'identity))
       (s (first su))
       (u (second su)))
  (loop named outer
        for w from 0 below (1- (length s))
        do (loop for c from 0 below w
                 do (loop for i from 0 until (<= (length s) (* i w))
                          for index = (+ (* i w) c)
                          when (< index (length s))
                            collect (elt s index)
                              into lst
                          finally (when (string= u (coerce lst 'string))
                                    (return-from outer (princ "Yes")))))
        finally (princ "No")))
