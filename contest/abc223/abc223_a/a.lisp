(let ((x (read)))
  (format t "~:[No~;Yes~]" (and (plusp x) (zerop (mod x 100)))))
