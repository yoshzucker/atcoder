(let* ((n (read))
       (an (sort (loop repeat n collect (1- (read))) #'<))))
