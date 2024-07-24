(defun type-object (obj)
  (cond ((listp obj) 'list)
        ((stringp obj) 'string)
        ((vectorp obj) 'vector)
        (t 'unkonwn)))

(defun substitute+ (new old sequence)
  (let* ((start (search old sequence))
         (end (+ start (length old))))
    (concatenate (type-object sequence)
                 (subseq sequence 0 start)
                 new
                 (subseq sequence end))))

(defun substitute+-all (new old sequence)
  (loop while (search old sequence)
        do (setf sequence (substitute+ new old sequence))
        finally (return sequence)))

(let ((n (read))
      (s (read-line)))
  (princ (substitute+-all "nya" "na" s)))
