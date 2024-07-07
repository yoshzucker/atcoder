(let* ((n (read))
       (cacn (loop repeat n
                   collect (let ((c (read)))
                             (cons c (loop repeat c collect (read))))))
       (x (read)))
  (loop for i below n for cac in cacn
        when (find x (cdr cac))
          collect (cons i (car cac)) into it
        finally (print it))
  )
