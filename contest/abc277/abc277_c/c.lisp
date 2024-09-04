(let* ((n (read))
       (nds (loop repeat n collect (cons (read) (read)))))
  (let ((adj (make-hash-table))
        (vst (make-hash-table))
        stack)
    (loop for (a . b) in nds
          do (push a (gethash b adj))
             (push b (gethash a adj)))
    (setf (gethash 1 vst) t)
    (push 1 stack)
    (loop while stack for n = (pop stack)
          do (loop for a in (gethash n adj)
                   unless (gethash a vst)
                     do (setf (gethash a vst) t)
                        (push a stack)))
    (loop for k being the hash-key in vst
          maximize k into m
          finally (print m))))
