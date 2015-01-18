;;; Because if statements are special forms result of the
;;; if statement will determine the function that will be
;;; evaluated e.g., + or -


(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

(a-plus-abs-b 3 (- 2))
