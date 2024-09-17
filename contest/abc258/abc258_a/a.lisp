(let ((k (read)))
  (format t "~2a:~2,'0d" (+ 21 (floor k 60)) (mod k 60)))
