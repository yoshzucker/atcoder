(let ((s (read-line)))
  (setf (elt s (1- (length s))) #\4)
  (format t "~a" s))
