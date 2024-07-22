(let* ((h (read))
       (w (read))
       (ahw (loop repeat h collect (loop repeat w collect (read)))))
  (loop for aw in ahw with acode = (char-code #\A)
        do (loop for a in aw
                 when (zerop a)
                   do (format t ".")
                 else
                   do (format t "~a" (code-char (1- (+ acode a)))))
           (format t "~%")))
