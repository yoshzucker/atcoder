(let* ((n (read))
       (m (read))
       (ai (sort (loop repeat n collect (read)) #'<))
       (bi (sort (loop repeat m collect (read)) #'<))
       (ci (merge 'list (copy-seq ai) (copy-seq bi) #'<)))
  (loop for a in ai
        when (let ((pos (position a ci)))
               (find (elt ci (1+ pos)) ai))
          do (return (princ "Yes"))
        finally (princ "No")))