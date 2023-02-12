; utils.lisp
; Project Euler
; 
; Created by Denis Meyer on 3/31/11.
; Copyright 2011 CallToPower Software. All rights reserved.
; 

(defun char-digit (c)
  (- (char-int c) (char-int #\0)))

(defun split-by (string char)
  "Returns a list of substrings of string divided by char each."
  (if string
      (loop for i = 0 then (1+ j)
         as j = (position char string :start i)
         collect (subseq string i j)
         while j)
      nil))

; http://en.wikipedia.org/wiki/Multiplicative_order
(defun multiplicative-order (a n &rest rs)
  "Gives the multiplicative order of A modulo N or the smallest
   integer M such that (= (mod (expt A M) N) R) for some R."
  (let ((rs (or rs '(1)))) ; no Rs are provided => use 1 instead
    (loop for k from 1
       when (member (mod (expt a k) n) rs :test #'=)
       do (return k))))

(defun fac (n)
  (if (= n 1)
      1
      (* n (fac (- n 1)))))

(defun factorial (n)
  (do ((i n (1- i)) (f 1 (* i f))) ((= i 0) f)))
 
(defun permute (n p)
  (let ((f (factorial (length p))))
    (cond ((= n 0) p)
          ((= n f) (reverse p))
          ((> n f) (permute (mod n (* f (1+ (length p)))) p))
          (t (multiple-value-bind (d r) (floor n (/ f (length p)))
               (cons (nth d p) (permute r (remove (nth d p) p))))))))

(defun unit-fraction-floats (lower upper &optional (factor 1))
  "Returns a list of float numbers from factor/lower to factor/upper."
  (when (= lower 0)
    (setf lower 1))
  (loop for i from lower to upper collect (float (/ factor i))))

(defun sieve-of-erathostenes (&optional (upper 10000))
  "Returns a sieve of erathostenes."
  (let ((sieve-of-erathostenes (make-array (1+ upper) :element-type 'bit :initial-element 1)))
    (setf (aref sieve-of-erathostenes 0) 0)
    (setf (aref sieve-of-erathostenes 1) 0)
    (loop for i from 2 to upper do
         (let ((curr (aref sieve-of-erathostenes i)))
         (if (and (/= i 2) (= 0 (mod i 2)))
             (setf (aref sieve-of-erathostenes i) 0)
             (when (= curr 1)
               (loop for j = (+ i i) then (+ j i) do
                    (when (> j upper)
                      (return))
                    (setf (aref sieve-of-erathostenes j) 0))))))
    sieve-of-erathostenes))

(defun prime-factorization (nr &optional (arr-len 10))
  "Returns a list with the prime factors of nr."
  (let ((f nr) ; remaining product to factor
        (arr (make-array arr-len :fill-pointer 0))
        (i 3))
    ; 2 == only even prime => increase the counter i with 2 every step (see 'else')
    (loop while (= (mod f 2) 0) do
         (vector-push 2 arr)
         (setf f (/ f 2)))
    ; - every number n can at most have one prime factor f greater than sqrt(f) (=> upper limit)
    ; - if factor exceeds this square root => remaining number is prime
    (loop while (<= i (1+ (sqrt f))) do
         (if (= (mod f i) 0)
             (progn
               (vector-push i arr)
               (setf f (/ f i)))
             (setf i (+ i 2))))
    (when (> f 1)
      (vector-push f arr))
    (coerce arr 'list)))

(defun divisors (x)
  "Returns a list of proper divisors."
  (let ((divs nil))
    (loop for i from 1 to (sqrt x) 
       do (when (zerop (mod x i)) 
	    (push i divs)
	    (let ((d (/ x i))) ; for every match you find two factors (i and num/i)
	      (unless (or (= i 1) (= i d))
		(push d divs)))))
    divs))

(defun permutations (bag)
  "Return a list of all the permutations of the input."
  (if (null bag) '(())
      ;; take an element e, generate all permutations of the remaining elements r,
      ;; for all possible e: add e to the front of each of r
      (mapcan #'(lambda (e)
                  (mapcar #'(lambda (p)
                              (cons e p))
                          (permutations
                           (remove e bag :count 1))))
              bag)))

(defun string-to-list (str)
  "Converts a string to a list of characters."
  (loop for s across str
       collect s))

(defun char-list-to-ascii (lst)
  "Converts a list of hars to list of ascii values."
  (loop for i in lst
       collect (char-int i)))

(defun str-to-alph-pos (str)
  "Returns a list with the position of the characters in the alphabet."
  (mapcar (lambda (i) (1+ (- i (char-int #\A)))) (char-list-to-ascii (string-to-list str))))

;; checks

(defun real-period-p (nr)
  "Real period == not only prime factors of 2 or 5."
  (let ((rp nil))
    (loop for i in (remove-duplicates (coerce (prime-factorization nr) 'list)) do
         (when (and (/= i 2) (/= i 5))
           (setf rp t)
           (return)))
    rp))

(defun palindrom-p (nr)
  (let* ((nr-str (string-to-list (write-to-string nr)))
         (nr-str-rev (reverse nr-str)))
    (equal nr-str nr-str-rev)))

(defun abundant-p (x)
  "A number n is called abundant if the sum of its proper divisors exceed n."
  (> (reduce #'+ (divisors x)) x))

(defun prime-p (nr)
  "Returns if nr is a prime (t) ot not (nil)."
  (let ((sieve (sieve-of-erathostenes (1+ nr))))
    (if (= (aref sieve nr) 1)
        t
        nil)))
