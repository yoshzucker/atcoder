(defun dirpair (&optional (n 9))
  (subseq (pairlis '(0 1 0 -1 -1 -1 1 1 0) ; row
                   '(1 0 -1 0 -1 1 -1 1 0)) ; column
          0 n))

(let* ((h (read))
       (w (read))
       (ary (make-array (list h w)
                        :initial-contents
                        (loop repeat h collect (read-line)))))
  (loop for si below h do
    (loop for sj below w do
      (loop for (di . dj) in (dirpair) do
        (loop for i = si then (+ i di)
              for j = sj then (+ j dj)
              for c across "snuke"
              never (or (minusp i) (minusp j) (<= h i) (<= w j))
              always (char= (aref ary i j) c)
              append (list (1+ i) (1+ j)) into lst
              finally (format t "~{~a ~a~%~}" lst))))))
