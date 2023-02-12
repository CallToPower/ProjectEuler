; Problem67.lisp
; Project Euler
; 
; Created by Denis Meyer on 3/29/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
;    3
;   7 4
;  2 4 6
; 8 5 9 3
; That is, 3 + 7 + 4 + 9 = 23.
; Find the maximum total from top to bottom in triangle.txt (right click and 'Save Link/Target As...'),
; a 15K text file containing a triangle with one-hundred rows.
; NOTE: This is a much more difficult version of Problem 18.
; It is not possible to try every route to solve this problem, as there are 299 altogether!
; If you could check one trillion (1012) routes every second it would take over twenty billion years to check them all.
; There is an efficient algorithm to solve it. ;o)
; => 7273
;

(load "utils.lisp")

(defparameter *file* "../Data/Problem67_data.txt")
(defparameter *last* nil)

(defun read-str (file)
  (let ((in (open file :if-does-not-exist nil)))
    (if in
        (progn
          (loop for line = (read-line in nil)
             while line do
               (let* ((lst (mapcar #'parse-integer (split-by-one-space line)))
                      (len (length lst))
                      (arr (make-array len :initial-contents lst)))
                 (if *last*
                     (progn
                       (loop for i from 0 to (- len 1) do
                            (let ((m 
                                   (cond ((and (>= (- i 1) 0) (< i (- len 1)))
                                          (max (aref *last* (- i 1)) (aref *last* i)))
                                         ((>= (- i 1) 0)
                                          (aref *last* (- i 1)))
                                         (t
                                          (aref *last* i))))
                                  (elem (aref arr i)))
                              (setf (aref arr i) (+ elem m))))
                       (setf *last* arr))
                     (setf *last* arr))))
          (when *last*
            (let ((max 0))
              (loop for i from 0 to (- (length *last*) 1) do
                   (if (> (aref *last* i) max)
                       (setf max (aref *last* i))))
              (format t "Max: ~a " max)))
          (close in))
        (format t "Can't read file '~a'." file))))
      
(defun main ()
  (time
   (read-str *file*)))
