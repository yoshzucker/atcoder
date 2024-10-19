(destructuring-bind (s0 s1 gb s2 s3) (loop repeat 5 collect (read-char))
  (format t "~:[Yes~;No~]" (or (and (char= s0 #\.) (char= s3 #\.))
                               (and (char= s1 #\.) (char= s2 #\.)))))
