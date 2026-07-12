(in-package #:cl-newtype)

(defnewtype electric-field float)
(defnewtype conductivity float)
(defnewtype current-density float)


;;; remember the Ohm law : J = sigma E
;;; there's two way to declare it
(defmethod ohm ((E electric-field) (sigma conductivity))
  (current-density
   (* (value E) (value sigma))))


(defun ohm2 (E sigma)
  (declare (type electric-field E)
	   (type conductivity sigma))
  (current-density
   (* (value E) (value sigma))))

;;; will not recognise the method
(ohm 1.0 (conductivity 3.0))

;;; should throw an error
(ohm2 1.0 (conductivity 3.0))
