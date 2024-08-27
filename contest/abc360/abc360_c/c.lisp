(let* ((n (read))
       (an (loop repeat n collect (read)))
       (wn (loop repeat n collect (read))))
  (loop for a in an for w in wn with hash = (make-hash-table)
        do (push w (gethash a hash))
        finally (loop for ws being the hash-value in hash
                      when (< 1 (length ws))
                        sum (reduce #'+ (rest (sort ws #'>)))
                          into s
                      finally (print s))))
