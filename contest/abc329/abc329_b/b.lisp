(let* ((n (read))
       (ai (loop repeat n collect (read))))
  (print (second (sort (remove-duplicates ai) #'>))))
