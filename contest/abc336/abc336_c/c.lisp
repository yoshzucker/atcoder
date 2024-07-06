(defun radix (dec radix)
  (do ((x dec (floor x radix))
       (lst nil))
      ((zerop x) (or lst '(0)))
    (push (mod x radix) lst)))

(let ((n (read)))
  (let ((quintal (radix (1- n) 5)))
    (princ (map 'string #'(lambda (x) (digit-char (* x 2))) quintal))))
