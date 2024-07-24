(let* ((u (read))
       (ct (loop repeat u collect (loop repeat (read) collect (read)))))
  (loop for an in ct
        do (format t "~a~%" (count-if #'oddp an))))
