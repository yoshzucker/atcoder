(let* ((n (read))
       (k (read))
       (an (sort (remove-duplicates (loop repeat n collect (read))) #'<)))
  (loop for i from 0 below n for a in an
        while (= i a)
        finally (print (min i k))))
