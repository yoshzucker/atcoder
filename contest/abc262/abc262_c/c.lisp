(defun permutation (n r)
  (loop for i downfrom n repeat r
        for v = i then (* v i)
        finally (return v)))

(defun factorial (n)
  (loop for i downfrom n to 1
        for v = i then (* v i)
        finally (return v)))

(defun combination (n r)
  (/ (permutation n r) (factorial r)))

(let* ((n (read))
       (an (loop repeat n collect (1- (read)))))
  (+ (permutation (loop for i below n
                        count (= (elt an i) i))
                  2)
     (loop for i below n
           count (= (- (length an) (elt an i))
                    (- (length an) i 1)))))
