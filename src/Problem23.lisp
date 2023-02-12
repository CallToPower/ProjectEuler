; Problem23.lisp
; Project Euler
; 
; Created by Denis Meyer on 3/4/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; A perfect number is a number for which the sum of its proper divisors is exactly equal to the number.
; For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28, which means that 28 is a perfect number.
; A number n is called deficient if the sum of its proper divisors is less than n and it is called abundant if this sum exceeds n.
; As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, the smallest number that can be written as the sum of two abundant numbers is 24.
; By mathematical analysis, it can be shown that all integers greater than 28123 can be written as the sum of two abundant numbers.
; However, this upper limit cannot be reduced any further by analysis even though it is known that the greatest number that cannot be expressed as the sum of two abundant numbers is less than this limit.
; Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
; => 4179871
;

(load "utils.lisp")

; "Every number greater than 20161 can be expressed as a sum of two abundant numbers."
; (http://mathworld.wolfram.com/AbundantNumber.html)
(defparameter *upper* 20162)

(defun get-result (&optional (size *upper*))
  (let ((arr-sum (make-array size :element-type 'bit))
	(abundants nil))
    (loop for i from 0 to size do
         (when (abundant-p i)
           (setq abundants (append abundants (list i)))
           (loop for j in abundants while (< (+ i j) size) do
                (setf (aref arr-sum (+ i j)) 1))))
    (loop for i from 0 below size when (zerop (aref arr-sum i))
       sum i)))

(defun main ()
  (time (print (get-result))))
