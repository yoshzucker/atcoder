(let ((s (read-line))
      (u (read-line)))
  (format t "~:[No~;Yes~]"
          (loop for cu across u for i from 0 with p = 0
                always (and (upper-case-p cu)
                            (or (let ((pos (position cu (subseq s p) :test #'char-equal)))
                                  (when pos
                                    (incf p (1+ pos))))
                                (when (= i 2)
                                  (char= cu #\X)))))))

