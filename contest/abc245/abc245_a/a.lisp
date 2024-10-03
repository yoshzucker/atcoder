(destructuring-bind (a b c d) (loop repeat 4 collect (read))
  (cond ((< a c) (princ "Takahashi"))
        ((= a c) (princ (if (<= b d) "Takahashi" "Aoki")))
        (t (princ "Aoki"))))
