(let* ((n (read))
       (an (loop repeat n collect (read)))
       (m (read))
       (bm (loop repeat m collect (read)))
       (l (read))
       (cl (loop repeat l collect (read)))
       (q (read))
       (xq (loop repeat q collect (read)))
       (hash (make-hash-table)))
  (loop for a in an
        do (loop for b in bm
                 do (loop for c in cl
                          do (setf (gethash (+ a b c) hash) t))))
  (loop for x in xq
        do (format t "~:[No~;Yes~]~%" (gethash x hash))))
