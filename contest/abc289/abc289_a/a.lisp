(loop for c across (read-line)
      when (char= c #\0)
        do (princ #\1)
      else
        do (princ #\0))
