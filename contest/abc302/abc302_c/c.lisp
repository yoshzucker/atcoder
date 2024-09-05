(defun next-permutation (sequence &optional (predicate #'<))
  (loop with j = (1- (length sequence)) with i = (1- j)
        unless (funcall predicate (elt sequence i) (elt sequence (1+ i)))
          do (when (minusp (decf i)) (return nil))
        else
          unless (funcall predicate (elt sequence i) (elt sequence j))
            do (decf j)
          else
            do (rotatef (elt sequence i) (elt sequence j))
               (return (replace sequence
                                (reverse (subseq sequence (1+ i)))
                                :start1 (1+ i)))))

(defun onediffp (s1 s2)
  (loop for c1 across s1 for c2 across s2
        count (char/= c1 c2) into cnt
        finally (return (= cnt 1) )))

(let* ((n (read))
       (m (read))
       (sn (loop repeat n collect (read-line))))
  (loop for strs = (sort sn #'string<) then (next-permutation strs #'string<)
        while strs
        when (loop for i below (1- n)
                   always (onediffp (elt strs i) (elt strs (1+ i))))
          do (return (princ "Yes") )
        finally (princ "No")))
