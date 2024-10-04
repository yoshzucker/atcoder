(let* ((n (read))
       (an (loop repeat n collect (read)))
       (bn (sort (remove-if #'minusp (remove-duplicates an)) #'<)))
  (loop for i from 0 for b in bn
        until (/= i b)
        finally (print i)))
