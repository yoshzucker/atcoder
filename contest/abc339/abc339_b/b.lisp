(let ((h (read))
      (w (read))
      (n (read)))
  (loop repeat n
        with s = (make-array (list h w) :initial-element nil)
        with i = 0 and j = 0
        with cw = t and dir = 0         ; 0=up, 1=right, 2=down, 3=left
        do (setf (aref s i j) (not (aref s i j)))
           (setf dir (if (aref s i j) (mod (1+ dir) 4) (mod (1- dir) 4)))
           (cond ((= dir 0) (setf i (mod (1- i) h)))
                 ((= dir 1) (setf j (mod (1+ j) w)))
                 ((= dir 2) (setf i (mod (1+ i) h)))
                 ((= dir 3) (setf j (mod (1- j) w))))
        finally (loop for i below h
                      do (loop for j below w
                               do (format t "~:[.~;#~]" (aref s i j))
                               finally (format t "~%")))))
