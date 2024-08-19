(let* ((a (read))
       (b (read))
       (c (read)))
  (loop for i = b then (mod (1+ i) 24)
        until (= i c)
        when (= i a)
          return (princ "No")
        finally (princ "Yes")))

