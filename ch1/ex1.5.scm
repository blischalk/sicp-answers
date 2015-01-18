;;; With applicative order, the program will execute an infinite
;;; loop.  This would occur because p() is a function that
;;; calls itself with no terminating condition.
;;; Since the expressions in the arguments are evaluated and
;;; padded on into the body of the function in applicative order
;;; the program hangs when the test function is called.

;;; Conversely, in normal order interpretation of the test
;;; function call the P() function call is passed on and is
;;; not evaluated unless the if statement executes the
;;; negative branch scenario.  Since the expression in the
;;; if statement is true the positive branch will execute and
;;; the function will yield 0.


(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

(test 0 (p))
