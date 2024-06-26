(let ((w (read))
      (b (read))
      (s "wbwbwwbwbwbw"))
  (loop while (< (length s) (+ w b))
        do (setf w (- w (count #\w s)))
           (setf b (- b (count #\b s))))
  (loop named outer for st to (length s)
        do (loop for en from st to (length s)
                 do (when (and (= w (count #\w (subseq s st en)))
                               (= b (count #\b (subseq s st en))))
                      (return-from outer (princ "Yes"))))
        finally (princ "No")))
