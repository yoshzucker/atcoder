(let ((s (read-line)))
  (loop for i to (length s)
        append (loop for j from (1+ i) to (length s)
                     collect (subseq s i j))
          into lst
        finally (print (length (remove-duplicates lst :test #'string=)))))

