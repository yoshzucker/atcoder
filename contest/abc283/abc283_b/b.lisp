(defun split-string (string &rest parser-functions)
  "split string by spaces. then, apply the elements to functions. if there are more elements than functions, the remaining elements are applied to the last function. if no functions are provided, the elements will be string"
  (loop with str = string for p = (position #\Space str)
        for fn = (or (pop parser-functions) fn)
        collect (funcall (or fn #'identity) (subseq str 0 p))
        while p
        do (setf str (subseq str (1+ p)))))

(let* ((n (read))
       (an (coerce (loop repeat n collect (read)) 'vector))
       (q (read))
       (qq (loop repeat q collect (split-string (read-line) #'parse-integer))))
  (loop for (i k x) in qq
        when (= i 1)
          do (setf (elt an (1- k)) x)
        else
          do (format t "~a~%" (elt an (1- k)))))
