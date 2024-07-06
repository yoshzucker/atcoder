(let ((n (read)))
  (loop for i from 4 downto 1
        with str = (write-to-string (1- n) :base 5)
        do (setf str (substitute (digit-char (* i 2)) (digit-char i) str))
        finally (princ str)))
