(defun read-str ()
  (loop with str = (read-line) for p = (position #\Space str)
        collect (subseq str 0 p)
        while p
        do (setf str (subseq str (1+ p)))))


(let* ((n (read))
       (san (loop repeat n
                  collect 
