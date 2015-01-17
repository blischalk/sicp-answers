;; Exercise 1.3

(define (square num) (* num num))

(define (sum-two-largest-squares a b c)
  ;;; let* is used to allow variables bound earlier
  ;;; in the binding to be available later in the binding
  (let* ((sorted (sort (list a b c) >))
         (x (first sorted))
         (y (second sorted)))
    (+ (square x) (square y))))
