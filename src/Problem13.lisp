; Problem13.lisp
; Project Euler
; 
; Created by Denis Meyer on 3/29/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; Work out the first ten digits of the sum of the following one-hundred 50-digit numbers.
; => 5537376230
;

(defparameter *file* "../Data/Problem13_data.txt")
(defparameter *sub-from* 0)
(defparameter *sub-to* 10)

(defun read-str (file)
  (let ((in (open file :if-does-not-exist nil))
        (sum 0))
    (if in
        (progn
          (loop for line = (read-line in nil)
             while line do
               (setf sum (+ sum (parse-integer line :junk-allowed nil))))
          (close in)
          sum)
        (progn
          (format t "Can't read file '~a'." file)
          nil))))

(defun main ()
  (time
   (let* ((sum (or (read-str *file*) 0))
          (sum_str (write-to-string sum)))
     (when (>= (length sum_str) *sub-to*)
         (let ((substr (subseq sum_str *sub-from* *sub-to*)))
           (format t "~a, digits in [~a, ~a]: ~a" sum *sub-from* *sub-to* substr))))))