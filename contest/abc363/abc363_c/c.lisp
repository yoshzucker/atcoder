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

(defun palindromep (sequence &optional (predicate #'eq))
  (loop with n = (length sequence) for i to (floor n 2)
        always (funcall predicate (elt sequence i) (elt sequence (- n 1 i)))))

(let ((n (read))
      (k (read))
      (s (read-line)))
  (loop for str = (sort s #'char<) then (next-permutation str #'char<) while str
        count (loop for i to (- n k)
                    for sub = (subseq str i (+ i k))
                    never (palindromep sub))
          into it
        finally (print it)))
