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
       (fsn (loop repeat n collect (cons (1- (read)) (read)))))
  (loop for (f . s) in fsn
        with golds = (make-array n :initial-element 0)
        and silvers = (make-array n :initial-element 0)
        do (cond ((< (elt golds f) s)
                  (setf (elt silvers f) (elt golds f))
                  (setf (elt golds f) s))
                 ((< (elt silvers f) s)
                  (setf (elt silvers f) s)))
        finally (print (apply #'max
                              (let ((golds (sort (copy-seq golds ) #'>)))
                                (+ (elt golds 0) (elt golds 1)))
                              (map 'list #'(lambda (x y) (+ x (/ y 2))) golds silvers)))))
