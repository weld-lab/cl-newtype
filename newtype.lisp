(in-package #:cl-newtype)



(defmacro defnewtype (new-type base-type)
  `(progn
     (defclass ,new-type ()
       ((value :initarg :value
	       :reader value
	       :type ,base-type)))

     (declaim (inline ,new-type))
     (defun ,new-type (val)
       (make-instance ',new-type
		      :value (coerce val ',base-type)))))


