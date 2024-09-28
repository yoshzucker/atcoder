(let* ((n (read))
       (m (read))
       (uvwm (loop repeat m collect (list (1- (read)) (1- (read)) (read))))
       (adj (make-array n :initial-element nil))
       (xn (make-array n :initial-element 0)))
  (loop for (u v nil) in uvwm
        do (setf (elt adj u) v))
  adj
  ;; (loop for (u v w) in uvwm
  ;;       do (setf (elt xn v) (+ (elt xn u) w)))
  ;; xn
  )
