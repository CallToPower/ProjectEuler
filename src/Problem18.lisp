; Problem18.lisp
; Project Euler
; 
; Created by Denis Meyer on 3/29/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; By starting at the top of the triangle below and moving to adjacent numbers on the row below, the maximum total from top to bottom is 23.
;    3     |         3
;   7 4    |      10  7
;  2 4 6   |    12  14  13
; 8 5 9 3  |  20  17  23  16
; That is, 3 + 7 + 4 + 9 = 23.
; Find the maximum total from top to bottom of the triangle below:
;
;               75
;              95 64
;             17 47 82
;            18 35 87 10
;           20 04 82 47 65
;          19 01 23 75 03 34
;         88 02 77 73 07 63 67
;        99 65 04 28 06 16 70 92
;       41 41 26 56 83 40 80 70 33
;      41 48 72 33 47 32 37 16 94 29
;     53 71 44 65 25 43 91 52 97 51 14
;    70 11 33 28 77 73 17 78 39 68 17 57
;   91 71 52 38 17 14 91 43 58 50 27 29 48
;  63 66 04 68 89 53 67 30 73 16 69 87 40 31
; 04 62 98 27 23 09 70 98 73 93 38 53 60 04 23
;
; NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route.
; However, Problem 67, is the same challenge with a triangle containing one-hundred rows; 
; it cannot be solved by brute force, and requires a clever method! ;o)
; => 1074 
;

(load "utils.lisp")

(defparameter *file* "../Data/Problem18_data.txt")
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
