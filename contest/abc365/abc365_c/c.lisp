(defun binary-search (l r test-fn)
  (loop for m = (floor (+ l r) 2)
        while (< l m r)
        do (if (funcall test-fn m)
               (setf l m)
               (setf r m))
        finally (return (if (funcall test-fn r) r m))))

(let* ((n (read))
       (m (read))
       (an (coerce (sort (loop repeat n collect (read)) #'<) 'vector))
       (infinite 1001001001)
       (result (binary-search 0
                              infinite
                              #'(lambda (x)
                                  (loop for a across an sum (min x a) into it
                                        finally (return (<= it m)))))))
  (princ (if (= result infinite) "infinite" result)))
  
