(let ((a (read))
      (b (read))
      (c (read))
      (d (read))
      (e (read))
      (f (read))
      (x (read)))
  (flet ((dist (a b c x)
           (let ((cycle (floor x (+ a c)))
                 (last (min (mod x (+ a c)) a)))
             (* (+ (* cycle a) last) b))))
    (let ((takahashi (dist a b c x))
          (aoki (dist d e f x)))
      (cond ((= takahashi aoki) (princ "Draw"))
            ((< takahashi aoki) (princ "Aoki"))
            (t (princ "Takahashi"))))))
