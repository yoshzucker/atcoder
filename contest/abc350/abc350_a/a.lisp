(let* ((s (read-line))
       (n (parse-integer (subseq s 3))))
  (format t "~a" (if (or (<= 1 n 315) (<= 317 n 349)) "Yes" "No")))
