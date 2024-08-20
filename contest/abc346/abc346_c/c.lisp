(let* ((n (read))
       (k (read))
       (an (sort (remove-duplicates (loop repeat n collect (read))) #'<)))
  (loop for i from 1 to k with a = (pop an)
        unless (= i a)
          sum i into s
        when (and an (= i a))
          do (setf a (pop an))
        finally (print s)))
