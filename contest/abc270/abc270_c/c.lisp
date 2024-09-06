#-swank
(unless (member :child-sbcl *features*)
  (quit :recklessly-p t
        :unix-status
        (process-exit-code (run-program *runtime-pathname*
                                        `("--control-stack-size"
                                          "256MB"
                                          "--noinform"
                                          "--disable-ldb"
                                          "--lose-on-corruption"
                                          "--end-runtime-options"
                                          "--eval"
                                          "(push :child-sbcl *features*)"
                                          "--script"
                                          ,(namestring *load-pathname*))
                                        :output t
                                        :error t
                                        :input t))))


(let* ((n (read))
       (x (read))
       (y (read))
       (nds (loop repeat (1- n) collect (cons (1- (read)) (1- (read))))))
  (let ((adj (make-hash-table))
        (vst (make-hash-table)))
    (loop for (a . b) in nds
          do (push a (gethash b adj))
             (push b (gethash a adj)))
    (labels ((recursion (lst)
               (cond ((= (first lst) (1- y))
                      (loop for i in (reverse lst) do (format t "~a " (1+ i))))
                     (t
                      (setf (gethash (first lst) vst) t)
                      (loop for a in (gethash (first lst) adj)
                            unless (gethash a vst)
                              do (setf (gethash a vst) t)
                                 (recursion (cons a lst)))))))
      (recursion (list (1- x))))))
