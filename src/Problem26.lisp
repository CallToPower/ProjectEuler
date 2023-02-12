; Problem26.lisp
; Project Euler
; 
; Created by Denis Meyer on 4/3/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; A unit fraction contains 1 in the numerator.
; The decimal representation of the unit fractions with denominators 2 to 10 are given:
; 1/2	= 	0.5
; 1/3	= 	0.(3)
; 1/4	= 	0.25
; 1/5	= 	0.2
; 1/6	= 	0.1(6)
; 1/7	= 	0.(142857)
; 1/8	= 	0.125
; 1/9	= 	0.(1)
; 1/10	= 	0.1
; Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
; It can be seen that 1/7 has a 6-digit recurring cycle.
; Find the value of d < 1000 for which 1/d contains the longest recurring cycle in its decimal fraction part.
; => 983
; 

(load "utils.lisp")

; for fractions 1/n the decimal representation only repeats for n that are relatively prime to 10
; the number of repeating digits is equal to the multiplicative order of 10 modulo n
; at the end the maximum number of repeating digits is n-1
(defun get-result ()
  (loop for i from 1000 downto 2
     with maxlen = 0
     with max-i = 0
     while (< maxlen i)
     when (and (= 1 (gcd i 10)) (< maxlen (multiplicative-order 10 i)))
     do (setf maxlen (multiplicative-order 10 i)
              max-i i)
     finally (return max-i)))

(defun main ()
  (time
   (progn
     (princ (get-result)))))
