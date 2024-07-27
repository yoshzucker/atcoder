(let* ((n (read))
       (sn (loop repeat n collect (read-line))))
  (format t "~:[No~;Yes~]"
          (and (every #'(lambda (x) (find (elt x 0) '(#\H #\D #\C #\S))) sn)
               (every #'(lambda (x) (find (elt x 1) '(#\A #\2 #\3 #\4 #\5 #\6
                                                      #\7 #\8 #\9 #\T #\T #\J
                                                      #\Q #\K)))
                      sn)
               (= (length sn) (length (remove-duplicates sn :test #'string=))))))
