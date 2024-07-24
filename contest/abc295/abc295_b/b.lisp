(defun prina (2d-array)
  (destructuring-bind (x y) (array-dimensions 2d-array)
    (loop for i below x
          do (loop for j below y
                   do (format t "~a" (aref 2d-array i j)))
             (format t "~%"))))

(defmacro range (start end &key (by 1))
  `(loop for i ,(if (<= start end) 'from 'downfrom) ,start to ,end by ,by
         collect i))

(defun crosspair (lst1 lst2)
  (loop for x in lst1
        append (loop for y in lst2
                     collect (cons x y))))

(let* ((r (read))
       (c (read))
       (lst (loop repeat r collect (read-line)))
       (brc (make-array (list r c) :initial-contents lst))
       (res (make-array (list r c) :initial-contents lst)))
  (loop for o below (* r c) for si = (floor o c) and sj = (mod o c)
        for dist = (digit-char-p (aref brc si sj))
        when dist
          do (loop for (di . dj) in (crosspair (range -9 9) (range -9 9)) 
                   for i = (+ si di)
                   for j = (+ sj dj)
                   unless (or (minusp i) (minusp j) (<= r i) (<= c j))
                     when (<= (+ (abs (- i si)) (abs (- j sj))) dist)
                       do (setf (aref res i j) #\.))
        finally (prina res)))
