(defun combination (n r)
  (loop for i downfrom n for j downfrom r repeat r
        for vn = i then (* vn i)
        for vr = j then (* vr j)
        finally (return (/ vn vr))))

(let* ((n (read))
       (an (coerce (loop repeat n collect (read)) 'vector))
       (count-equal (loop for a across an for i from 1
                          count (= a i)))
       (count-cross (loop for a across an for i from 1
                          count (and (/= a i)
                                     (= (elt an (1- a)) i)))))
  (print (+ (combination count-equal 2) (/ count-cross 2))))
