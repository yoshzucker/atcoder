(let* ((q (read))
       (qi (loop repeat q collect (list (read) (read)))))
  (loop for (i xk) in qi with a
        do (if (= i 1)
               (push xk a)
               (print (elt a (1- xk))))))
