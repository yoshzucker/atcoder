(let ((s (read-line))
      (a (read))
      (b (read)))
  (rotatef (elt s (1- a)) (elt s (1- b)))
  (princ s))
