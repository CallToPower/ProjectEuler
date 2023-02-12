; Problem24.lisp
; Project Euler
; 
; Created by Denis Meyer on 3/30/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; A permutation is an ordered arrangement of objects.
; For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
; If all of the permutations are listed numerically or alphabetically, we call it lexicographic order.
; The lexicographic permutations of 0, 1 and 2 are:
; 012   021   102   120   201   210
; What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
;
; => (2 7 8 3 9 1 5 4 6 0) => 2783915460
;

(load "utils.lisp")

(defparameter *nth-perm* 1000000)
(defparameter *lst* '(0 1 2 3 4 5 6 7 8 9))

(defun main2 ()
  (time
   (nth (- *nth-perm* 1) (permutations *lst*))))


;; faster solution: ;;


(defun main (&optional (n (- *nth-perm* 1)) (p *lst*))
  (time 
   (permute n p)))
