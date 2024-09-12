(defclass queue ()
  ((list :initform nil)
   (tail :initform nil)))

(defmethod print-object ((queue queue) stream)
  (print-unreadable-object (queue stream :type t)
    (with-slots (list tail) queue
      (cond ((nthcdr 4 list)
             (format stream "(~{~S ~}... ~S)"
                     (subseq list 0 3) (first tail)))
            (t
             (format stream "~:S" list))))))

(defmethod dequeue ((queue queue))
  (with-slots (list) queue
    (pop list)))

(defmethod enqueue (new-item (queue queue))
  (with-slots (list tail) queue
    (let ((new-tail (list new-item)))
      (if (null list)
          (setf list new-tail)
          (setf (cdr tail) new-tail))
      (setf tail new-tail)))
  queue)


(let* ((n (read))
       (an (coerce (sort (loop repeat n collect (1- (read))) #'<) 'vector))
       ()))
