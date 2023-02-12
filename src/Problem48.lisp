; Problem48.lisp
; Project Euler
; 
; Created by Denis Meyer on 3/30/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; The series, 1^1 + 2^2 + 3^3 + ... + 10^10 = 10405071317.
; Find the last ten digits of the series, 1^1 + 2^2 + 3^3 + ... + 1000^1000.
; => 9110846700
;

(defparameter *from* 1)
(defparameter *to* 1000)
(defparameter *num-digits* 10)

(defun get-num-digits (lower upper digits)
  (let* ((nbr
         (reduce #'+
                 (loop for i from lower to upper
                    collect (expt i i))))
         (nbr-str (write-to-string nbr))
         (last-digits (subseq nbr-str (- (length nbr-str) digits))))
    last-digits))

(defun main ()
  (princ (get-num-digits *from* *to* *num-digits*)))
