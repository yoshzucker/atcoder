(let ((n (read)))
  (loop for i = n then (ash i -1) while (plusp i)
        until (logbitp 0 i)
        count i into it
        finally (print it)))
