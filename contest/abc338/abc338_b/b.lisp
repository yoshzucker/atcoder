(let ((s (coerce (read-line) 'list)))
  (loop for c in (sort (remove-duplicates s) #'char<) with mc = nil and mcnt = 0
        do (let ((cnt (count c s)))
             (when (< mcnt cnt)
               (setf mcnt cnt)
               (setf mc c)))
        finally (princ mc)))
