;;; Exercise 1.7

#|
The good-enough? method will not be effective against
very small or very large numbers.  For very small numbers,
since the tolerence is .001 essentially the second "good-enough?"
call will always be good enough.  This is because the first round
uses 1.0 as a seed value and then the next iterative call to
good-enough? will be less than 0.001 making it "good-enough?"
yielding incorrect results and essentially making the
function useless.

E.x
(sqrt 0.0001)        = .03230844833048122
.03230844833048122^2 = 0.001043835834

Actual square root...
.01^2                = 0.0001

(sqrt 0.0002)        = .03335281609280434
.03335281609280434^2 = 0.001112410341

Actual square root...
.0141^2              = 0.00019881

The supposed square root utilizing the current good-enough?
implementation yields square roots larger than the number
we are searching for the square root of !?!?

For very large numbers the function will never return.

(sqrt 10000000000000)

Gets stuck on guess 3162277.6601683795
and repeats for ever........

The problem comes in the averaging function

(/ (+ 3162277.6601683795 (/ 10000000000000 3162277.6601683795)) 2)

continues to yield 3162277.6601683795

The inner division returns: 3162277.660168379

The addition step which expands to:

(+ 3162277.6601683795 3162277.660168379)

returns: 6324555.320336759

Here in lies the issue. The first number in the addition
has 10 decimal places but the return value of the addition
only has 9.  A loss of precision has occurred.

Then the division occurs:

(/ 6324555.320336759 2)

Which returns: 3162277.6601683795

Which is the same guess that we started with.

Since floating point numbers have limited precision the rounding
that occurs with floating point operations squews the accuracy
of calculations.  In our program this is enough to cause the
calculation of the average to return the same guess as was provided
to the improve function to be improved upon.  The limitations
of floating point numbers prevents the guess from being further
improved.  The guess that can't be improved upon is also not
within the tolerence that is set within the good-enough? function
causing the program to never terminate. good-enough? continually
asks that the guess be improved even though it can't be.
|#


(define (square x) (* x x))

(define (average x y)
  (/ (+ x y) 2))

(define (abs x)
  (if (< x 0)
      (- x)
      x))

(define (improve guess x)
  (display "guess \n")
  (display guess)
  (display "\n")
  (let ((out (average guess (/ x guess))))
    (display "improved \n")
    (display (average guess (/ x guess)))
    (display "\n")
    out))

(define (good-enough? guess x)
  (let ((value (abs (- (square guess) x))))
    (< value 0.001)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
          guess
          (sqrt-iter (improve guess x)
                     x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))
