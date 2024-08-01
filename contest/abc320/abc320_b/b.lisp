(defun palindromep (sequence &optional (predicate #'eq))
  (loop with sq = (coerce sequence 'vector)
        for i to (floor (length sq) 2)
        always (funcall predicate (elt sq i) (elt sq (- (length sq) 1 i)))))

(let ((s (read-line)))
  (loop for b to (length s)
        maximize (loop for e from (1+ b) to (length s)
                       for str = (subseq s b e)
                       when (palindromep str)
                         maximize (length str))
          into it
        finally (print it)))
