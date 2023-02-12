; Problem16.lisp
; Project Euler
; 
; Created by Denis Meyer on 3/29/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; 2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.
; What is the sum of the digits of the number 2^1000?
; => 1366
;

(load "utils.lisp")

(defparameter *num* 2)
(defparameter *exp* 1000)

(defun get-solution ()
  (let ((pow-str (write-to-string (expt *num* *exp*)))
        (sum 0))
    (loop for i below (length pow-str) do
         (setf sum (+ sum (parse-integer (string (char pow-str i))))))
    sum))

(defun main2()
  (time
   (format t "the sum of the digits of the number ~a^~a = ~a" *num* *exp* (get-solution))))


;; other solution: ;;

(defun main ()
  (time
   (let ((sum-digits
          (loop for d across (write-to-string (expt *num* *exp*))
             sum (char-digit d))))
     (format t "The sum of the digits of the number ~a^~a = ~a" *num* *exp* sum-digits))))
