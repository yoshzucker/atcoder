(let* ((n (read))
       (q (read))
       (eq (loop repeat q collect (list (read) (read))))
       yellow red)
  (loop for (card player) in eq
        do (cond ((= card 1)
                  (if (find player yellow)
                      (push player red)
                      (push player yellow)))
                 ((= card 2)
                  (push player red))
                 (t
                  (format t "~:[No~;Yes~]~%" (find player red))))))
