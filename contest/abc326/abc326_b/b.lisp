(let ((n (read)))
  (loop for i from n
        for hun = (floor i 100)
        and ten = (mod (floor i 10) 10)
        and one = (mod i 10)
        until (= (* hun ten) one)
        finally (print i)))
