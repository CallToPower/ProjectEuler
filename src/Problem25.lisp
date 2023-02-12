; Problem25.lisp
; Project Euler
; 
; Created by Denis Meyer on 3/30/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; The Fibonacci sequence is defined by the recurrence relation:
; Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
; Hence the first 12 terms will be:
; F1 = 1
; F2 = 1
; F3 = 2
; F4 = 3
; F5 = 5
; F6 = 8
; F7 = 13
; F8 = 21
; F9 = 34
; F10 = 55
; F11 = 89
; F12 = 144
; The 12th term, F12, is the first term to contain three digits.
; What is the first term in the Fibonacci sequence to contain 1000 digits?
; => 4782
;

(defparameter *limit* 5000)
(defparameter *digits* 1000)

(defun list-fibs2 (lim dig)
  (let* ((a 1)
         (b 1)
         (sum 2)
         (tmp 0))
    (loop for i from 0 to lim do
         (setf tmp sum)
         (setf sum (+ sum b))
         (setf a b)
         (setf b tmp)
         (when (>= (length (write-to-string sum)) dig)
           (return i)))))

(defun main2 ()
  (time
   (list-fibs2 *limit* *digits*)))


;; faster version ;;


(defun list-fibs (limit)
  (let ((fibs '(2 1)))
    (do ((nextfib (+ (car fibs) (cadr fibs))
                  (+ (car fibs) (cadr fibs))))
        ((> nextfib limit))
      (setq fibs (cons nextfib fibs)))
    fibs))

(defun main ()
  (time
   (+ 2 (length (list-fibs (expt 10 999))))))
