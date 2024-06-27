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
       (s (apply #'concatenate 'string (loop repeat h collect (read-line))))
       (visited (make-array (* h w) :initial-element nil)))
  (labels ((around (n)
             (let ((l (floor n w))
                   (m (mod n w)))
               (loop for i from (max 0 (1- l)) to (min (1+ l) (1- h))
                     append (loop for j from (max 0 (1- m)) to (min (1+ m) (1- w))
                                  for n = (+ (* i w) j)
                                  when (and (char= (elt s n) #\#)
                                            (not (elt visited n)))
                                    collect n))))
           (dfs (n)
             (setf (elt visited n) t)
             (mapcar #'dfs (around n))))
    (loop for n below (* h w)
          when (and (char= (elt s n) #\#)
                    (not (elt visited n)))
            do (dfs n) and count it into it
          finally (print it))))
