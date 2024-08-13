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

(defun transpose (lst)
  (apply #'map 'list #'list lst))

(let* ((h (read))
       (w (read))
       (sw (mapcar #'(lambda (x) (coerce x 'string))
                   (transpose (loop repeat h collect (read-line)))))
       (uw (mapcar #'(lambda (x) (coerce x 'string))
                   (transpose (loop repeat h collect (read-line))))))
  (format t "~:[No~;Yes~]" (equalp (sort sw #'string<) (sort uw #'string<))))

