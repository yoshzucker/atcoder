#-swank
(unless (member :child-sbcl *features*)
  (quit
   :recklessly-p t
   :unix-status
   (process-exit-code
    (run-program *runtime-pathname*
                 `("--control-stack-size" "256MB"
                   "--noinform" "--disable-ldb" "--lose-on-corruption" "--end-runtime-options"
                   "--eval" "(push :child-sbcl *features*)"
                   "--script" ,(namestring *load-pathname*))
                 :output t :error t :input t))))

(let* ((h (read))
       (w (read))
       (swh (make-array (list h w)
                        :initial-contents
                        (loop repeat h collect (read-line))))
       (visited (make-array (list h w) :initial-element nil)))
  (labels ((around (x y)
             (loop for i from (max 0 (1- x)) to (min (1+ x) (1- h))
                   append (loop for j from (max 0 (1- y)) to (min (1+ y) (1- w))
                                when (char= (aref swh i j) #\#)
                                  collect (list i j))))
           (dfs (x y)
             (setf (aref visited x y) t)
             (loop for (i j) in (around x y)
                   do (unless (aref visited i j) (dfs i j)))))
    (loop for i below h
          sum (loop for j below w
                    when (and (char= (aref swh i j) #\#)
                              (not (aref visited i j)))
                      do (dfs i j) and count it)
            into it
          finally (print it))))

