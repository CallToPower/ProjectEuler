; Problem17.lisp
; Project Euler
; 
; Created by Denis Meyer on 3/29/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; If the numbers 1 to 5 are written out in words: one, two, three, four, five, then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.
; If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words, how many letters would be used?
; NOTE: Do not count spaces or hyphens.
; For example, 342 (three hundred and forty-two) contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
; The use of "and" when writing out numbers is in compliance with British usage.
; => 21124
;

(load "utils.lisp")

(defparameter *from* 1)
(defparameter *to* 1000)

(defun nr-of-letters (nr)
  (if (numberp nr)
      (let* ((str (format nil "~r" nr))
             (str-lst (split-by str #\Space))
             (cnt 0))
        (loop for i in str-lst do
             (when i
               (if (find #\- i :test #'equal)
                   (setf cnt (+ cnt (- (length i) 1)))
                   (setf cnt (+ cnt (length i))))))
        cnt)))

(defun main ()
  (time
   (let ((cnt 0))
     (loop for i from *from* to *to* do
          (let ((cnt_i (nr-of-letters i)))
            (setf cnt (+ cnt cnt_i))))
     (format t "Number of letters used by all the numbers in [~a, ~a] written in words: ~a" *from* *to* cnt))))
