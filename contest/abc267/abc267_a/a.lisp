(let ((s (read)))
  (print (cdr (assoc s '((Friday . 1)
                         (Thursday . 2)
                         (Wednesday . 3)
                         (Tuesday . 4)
                         (Monday . 5))))))