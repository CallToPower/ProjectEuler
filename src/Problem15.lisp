; Problem15.lisp
; Project Euler
; 
; Created by Denis Meyer on 4/3/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; Starting in the top left corner of a 2×2 grid, there are 6 routes (without backtracking) to the bottom right corner.
; How many routes are there through a 20×20 grid?
; => 137846528820
;

(load "utils.lisp")

(defparameter *gridX* 20)

; algorithm: http://mathforum.org/advanced/robertd/manhattan.html
(defun paths (gridX)
  (/ (factorial (* 2 gridX)) (expt (factorial gridX) 2)))

(defun main ()
  (time 
   (paths *gridX*)))
