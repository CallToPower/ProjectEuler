; Problem7.lisp
; Project Euler
; 
; Created by Denis Meyer on 4/3/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

;
; Problem
; By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
; What is the 10001st prime number?
; => 104743
;

(load "utils.lisp")

(defparameter *upper* 110000)
(defparameter *nth-prime* 10001)
(defparameter *sieve-of-erathostenes* nil)

(defun get-result (sieve upper nth-prime)
  (let ((nr 0)
        (curr-i 0))
    (loop for i from 0 to upper do
         (when (= (aref sieve i) 1)
           (incf curr-i)
           (when (= curr-i nth-prime)
             (setf nr i)
             (return i))))
    nr))

(defun main ()
  (time
   (let* ((*sieve-of-erathostenes* (sieve-of-erathostenes *upper*))
          (result (get-result *sieve-of-erathostenes* *upper* *nth-prime*)))
     (format t "~a. prime number = ~a" *nth-prime* result))))
