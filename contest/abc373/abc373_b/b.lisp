(let ((s (read-line)))
  (loop for c from (char-code #\A) to (char-code #\Z) with acc
        for char = (code-char c)
        do (push (position char s) acc)
        finally (loop for (x y) on (reverse acc)
                      when y
                        sum (abs (- x y)) into s
                      finally (print s))))
