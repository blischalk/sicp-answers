;; Exercise 1.10
;; The following function defines Ackermann's function

(define (A x y)
  (cond ((= y 0) 0)
        ((= x 0) (* 2 y))
        ((= y 1) 2)
        (else (A (- x 1)
                 (A x (- y 1))))))

; (A 0 0) -> 0
; (A 1 0) -> 0
; (A 2 0) -> 0
; (A 0 1) -> 2
; (A 1 1) -> 2
; (A 2 1) -> 2
; (A 0 2) -> 4
; (A 1 2) -> (A 0 (A 1 1)) -> 4 e.g 2 * 2



;; What are the values of the following expressions?

(A 1 10)  ; 1024

(A 2 4)   ; 65536

(A 3 3)   ; 65536


(define (f n) (A 0 n)) ;; 2n
; (f 10) -> 20
; (f 5) -> 10
; (f 4) -> 8
; (f 1) -> 2

(define (g n) (A 1 n)) ;; 2^n
; (g 1) -> 2
; (g 2) -> 4
; (g 3) -> 8
; (g 4) -> 16
; (g 5) -> 32

(define (h n) (A 2 n)) ;; 2|n
;; (h 1) -> 2     2
;; (h 2) -> 4     2^2
;; (h 3) -> 16    2^2^2
;; (h 4) -> 65536 2^2^2^2
;; (h 5) ;Aborting!: maximum recursion depth exceeded

(define (k n) (* 5 n n)) ;; 5n^2

; Give concise mathematical definitions for the
; functions computed by the procedures f, g, and h
; for positive integer values of n.  For example, (k n) computes 5n^2
