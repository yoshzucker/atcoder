(let* ((h (read))
       (w (read))
       (ghw (make-array (list h w)
                        :initial-contents
                        (loop repeat h collect (read-line)))))
  (loop with i = 0 and j = 0
        with visited = (make-array (list h w) :initial-element nil)
        for ni = i and nj = j
        until (aref visited i j)
        finally (print -1)
        do (setf (aref visited i j) t)
           (let ((c (aref ghw i j)))
             (cond ((char= c #\U) (decf ni))
                   ((char= c #\D) (incf ni))
                   ((char= c #\L) (decf nj))
                   ((char= c #\R) (incf nj))))
        when (or (minusp ni) (minusp nj) (<= h ni) (<= w nj))
          return (format t "~a ~a" (1+ i) (1+ j))
        else
          do (setf i ni)
             (setf j nj)))
