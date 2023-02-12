; Problem3.lisp
; Project Euler
; 
; Created by Denis Meyer on 4/3/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

;
; Problem
; The prime factors of 13195 are 5, 7, 13 and 29.
; What is the largest prime factor of the number 600851475143 ?
; => 6857
;

(load "utils.lisp")

(defparameter *nr* 600851475143)

(defun main ()
  (time
   (princ (reduce #'max (prime-factorization *nr*)))))
