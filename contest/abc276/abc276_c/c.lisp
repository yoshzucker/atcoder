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

(let* ((n (read))
       (pn (loop repeat n collect (read))))
  (format t "~{~a ~}" (next-permutation pn #'>)))
