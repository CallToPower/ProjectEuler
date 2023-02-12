; Problem_22.lisp
; Project Euler
; 
; Created by Denis Meyer on 3/4/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

; 
; Problem
; Using names.txt (right click and 'Save Link/Target As...'), a 46K text file containing over five-thousand first names, begin by sorting it into alphabetical order.
; Then working out the alphabetical value for each name, multiply this value by its alphabetical position in the list to obtain a name score.
; For example, when the list is sorted into alphabetical order, COLIN, which is worth
; 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN would obtain a score of 938 × 53 = 49714.
; What is the total of all the name scores in the file?
; 
; => 871198282
;

(load "utils.lisp")

(defparameter *file* "../Data/Problem22_data.txt")
(defparameter *lst* nil)

(defun str-val (str)
  (reduce #'+ (str-to-alph-pos str)))

(defun read-str (file lst)
  (with-open-file (in file :direction :input :if-does-not-exist nil)
    (let* ((content (read-line in nil))
           (tmp 1)
           (sum
            (reduce #'+ (loop for str in 
                             (stable-sort 
                              (loop for str in (split-by content #\,) collect
                                   (subseq str 1 (1- (length str))))
                              #'string-lessp)
                           collect (* tmp (str-val str)) do (setf tmp (1+ tmp))))))
      (format t "Total of all the name scores in the file = ~a" sum))))

(defun main ()
  (time (read-str *file* *lst*)))
