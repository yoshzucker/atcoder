(defun cross (complex1 complex2)
  (- (* (realpart complex1) (imagpart complex2))
     (* (imagpart complex1) (realpart complex2))))

(defun ccwp (complex1 complex2)
  (plusp (cross complex1 complex2)))

(let* ((abcd (loop repeat 4 collect (complex (read) (read)))))
  (format t "~:[No~;Yes~]" (loop for i below 4
                                 for a = (nth i abcd)
                                 and b = (nth (mod (+ i 1) 4) abcd)
                                 and c = (nth (mod (+ i 2) 4) abcd)
                                 for side1 = (- b a)
                                 and side2 = (- c a)
                                 always (ccwp side1 side2))))
