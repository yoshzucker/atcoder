(let* ((n (read))
       (u (read))
       (cn (coerce (loop repeat n collect (read)) 'vector))
       (rn (coerce (loop repeat n collect (read)) 'vector))
       (winc (if (find u cn) u (elt cn 0))))
  (loop for i below n with maxv = 0 and maxi
        when (= winc (elt cn i))
          do (when (< maxv (elt rn i))
               (setf maxv (elt rn i))
               (setf maxi i))
        finally (print (1+ maxi))))
