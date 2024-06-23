(let ((sx (read))
      (sy (read))
      (tx (read))
      (ty (read)))
  (let* ((dy (abs (- ty sy)))
         (tx (cond ((and (evenp ty) (oddp tx)) (1- tx))
                   ((and (evenp ty) (evenp tx)) tx)
                   ((and (oddp ty) (oddp tx)) tx)
                    (t (1- tx)))))
         (sx (cond ((and (evenp sy) (oddp sx)) (1- sx))
                   ((and (evenp sy) (evenp sx)) sx)
                   ((and (oddp sy) (oddp sx)) sx)
                    (t (1- sx)))))
         (dx (abs (- tx sx)))
         (remx (- dx dy)))
    (format t "~a" (if (plusp remx) (+ dy (floor remx 2)) dy))))
