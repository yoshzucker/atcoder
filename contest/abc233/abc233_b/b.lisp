(let ((l (1- (read)))
      (r (1- (read)))
      (s (read-line)))
  (princ (concatenate 'string
                      (subseq s 0 l)
                      (reverse (subseq s l (1+ r)))
                      (subseq s (1+ r)))))
