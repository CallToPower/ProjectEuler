; Problem4.lisp
; Project Euler
; 
; Created by Denis Meyer on 4/3/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

;
; Problem
; A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 * 99.
; Find the largest palindrome made from the product of two 3-digit numbers.
; => 906609
;

(load "utils.lisp")

(defun result ()
  (let ((lst nil)
        (max 0))
    (loop for i from 100 to 999 do
         (loop for j from 100 to 999 do
              (push (* i j) lst)))
    (loop for i in lst do
         (when (and (palindrom-p i) (> i max))
           (setf max i)))
    max))

(defun main ()
  (time
   (princ (result))))
