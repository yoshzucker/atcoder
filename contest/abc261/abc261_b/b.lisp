(defun collectp (x y)
  (cond ((char= x #\W) (char= y #\L))
        ((char= x #\L) (char= y #\W))
        ((char= x #\D) (char= y #\D))
        (t t)))

(let* ((n (read))
       (mx (make-array (list n n)
                       :initial-contents
                       (loop repeat n collect (read-line)))))
  (format t "~:[incorrect~;correct~]"
          (loop for i below n
                always (loop for j below n
                             always (collectp (aref mx i j) (aref mx j i))))))
