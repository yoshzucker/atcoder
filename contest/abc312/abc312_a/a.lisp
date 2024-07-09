(let ((s (read))
      (c '(ACE BDF CEG DFA EGB FAC GBD)))
  (format t "~:[No~;Yes~]" (find s c)))
