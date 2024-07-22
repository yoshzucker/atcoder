(defun read-list (&rest functions)
  "read line and split it by spaces. then, apply the elements to functions. if there are more elements than functions, the remaining elements are applied to the last function. if no functions are provided, the elements will be string"
  (loop with str = (read-line) for p = (position #\Space str)
        for fn = (or (pop functions) fn)
        collect (funcall (or fn #'identity) (subseq str 0 p))
        while p
        do (setf str (subseq str (1+ p)))))

(let ((n (read))
      (wn (read-list)))
  (format t "~:[No~;Yes~]" (intersection '("and" "not" "that" "the" "you")
                                         wn
                                         :test #'string=)))
