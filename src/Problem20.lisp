; Problem20.lisp
; Project Euler
; 
; Created by Denis Meyer on 3/30/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; n! means n × (n − 1) × ... × 1
; For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
; and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
; Find the sum of the digits in the number 100!
; => 648
;

(load "utils.lisp")

(defparameter *num* 100)


(defun main2 ()
  (time
   (let ((pow-str (write-to-string (fac *num*)))
         (sum 0))
     (loop for i below (length pow-str) do
          (setf sum (+ sum (parse-integer (string (char pow-str i))))))
     (format t "Sum of the digits in the number ~a! = ~a" *num* sum))))


;; other solution: ;;


(defun main ()
  (time
     (let ((sum
            (loop for d across (write-to-string (fac *num*))
               sum (char-digit d))))
       (format t "Sum of the digits in the number ~a! = ~a" *num* sum))))
