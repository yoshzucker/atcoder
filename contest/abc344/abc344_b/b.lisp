(loop with ai for a = (read) do (push a ai) until (zerop a)
      finally (format t "~{~a~%~}" ai))
