# Exercise 1.6

(define (average x y)
  (/ (+ x y) 2))

(define (improve guess x)
  (average guess (/ x guess)))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

;;; Eva Lu Ator's attempt at making a new if
;;; that is not a special form
(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))

(define (sqrt-iter guess x)
  (new-if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))


;;; Will cause maximum recursion to occur
(sqrt 5)

;;; When Alyssa attempts to use the sqrt function
;;; the program will infinitely recur
;;; because the arguments will be evaluated before their
;;; values are used in the function body.  Because of this
;;; the sqrt-iter is not conditional but actually gets
;;; evaluated.  This bug did not arise in the simple test examples
;;; such as (new-if (= 2 3) 0 5) -> 5 and (new-if (= 1 1) 0 5) 0
;;; because the equal expressions get evaluated into true or false
;;; and the true or false value is actually getting passed into
;;; the function, not the un-evaluated expression as would happen
;;; in the normal built-in special form of 'if'.
