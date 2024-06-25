(let* ((h (read))
       (w (read))
       (swh (make-array (list h w)
                        :initial-contents
                        (loop repeat h collect (read-line)))))
  (loop for i below h with stack and visited do
    (loop for j below w do
      (when (and (char= (aref swh i j) #\#)
                 (not (find (list i j) visited :test #'equal))) 
        (push (list i j) stack)
        (push (list i j) visited)
        (loop while stack for p = (pop stack)
              for f = (first p) and s = (second p) do
                (loop for l from (max 0 (1- f)) to (min (1+ f) (1- h)) do
                  (loop for m from (max 0 (1- s)) to (min (1+ s) (1- w)) do
                    (when (and (char= (aref swh l m) #\#)
                               (not (find (list l m) visited :test #'equal)))
                      (push (list l m) visited)
                      (push (list l m) stack)))))))
        finally (return visited)))

