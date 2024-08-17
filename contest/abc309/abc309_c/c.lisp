(let* ((n (read))
       (k (read))
       (abn (sort (loop repeat n collect (cons (read) (read))) #'> :key #'car)))
  (loop for (a . b) in abn with lst and m = 0
        do (push (cons a (incf m b)) lst)
        finally (loop for (a . b) in lst with last = 0
                      until (<= b k)
                      do (setf last a)
                      finally (print (1+ last)))))
