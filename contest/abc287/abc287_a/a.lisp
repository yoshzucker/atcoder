(let* ((n (read))
       (sn (loop repeat n collect (read))))
  (format t "~:[No~;Yes~]" (< (count 'against sn) (count 'for sn))))
