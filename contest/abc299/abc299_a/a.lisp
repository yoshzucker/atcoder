(let ((n (read))
      (s (read-line)))
  (format t "~:[out~;in~]"
          (< (position #\| s) (position #\* s) (position #\| s :from-end t))))
