(let ((tak-code '("###.-----"
                  "###.-----"
                  "###.-----"
                  "....-----"
                  "---------"
                  "-----...."
                  "-----.###"
                  "-----.###"
                  "-----.###")))
  (defun tak-code-p (strs)
    (loop for str in strs for tak-str in tak-code
          do (loop for c across str for tak-c across tak-str
                   do (format t "~a ~a~%" tak-c c)
                   do (unless (or (char= tak-c #\# c)
                                  (char= tak-c #\. c)
                                  (char= tak-c #\-))
                        (return nil))
                   finally (return t)))))

(let* ((n (read))
       (m (read))
       (sn (loop repeat n collect (read-line)))) 
  (loop for i to (- n 9) for strsm = (subseq sn i (+ i 9))
        do (loop for j to (- m 9)
                 for strs = (mapcar #'(lambda (x) (subseq x j (+ j 9))) strsm)
                 when (tak-code-p strs)
                   do (format t "~a ~a~%" i j))))
