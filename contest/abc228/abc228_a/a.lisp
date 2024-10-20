(destructuring-bind (s u x) (loop repeat 3 collect (read))
  (loop with str = s with end = u
        for h = str then (mod (1+ h) 24) until (= h end)
        when (= x h)
          return (princ "Yes")
        finally (princ "No")))
