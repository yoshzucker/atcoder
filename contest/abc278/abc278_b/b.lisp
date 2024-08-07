(defun logdigit (index integer)
  (let* ((str (write-to-string integer))
         (len (length str)))
    (and (< index len)
         (digit-char-p (elt str (- len index 1))))))

(defun hhmmp (h1 h0 m1 m0)
  (and (<= 0 (+ (* h1 10) h0) 23)
       (<= 0 (+ (* m1 10) m0) 59)))

(let* ((h (read))
       (m (read)))
  (loop repeat (* 24 60)
        for cm = m then (mod (1+ cm) 60)
        for ch = h then (if (zerop cm) (mod (1+ ch) 24) ch)
        for h1 = (or (logdigit 1 ch) 0) and h0 = (logdigit 0 ch)
        for m1 = (or (logdigit 1 cm) 0) and m0 = (logdigit 0 cm)
        when (hhmmp h1 m1 h0 m0) 
          return (format t "~a~a ~a~a" h1 h0 m1 m0)))
  
