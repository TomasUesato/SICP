#lang simply-scheme
#|Exercise 1.4.  Observe that our model of evaluation allows for combinations whose operators are compound expressions.
Use this observation to describe the behavior of the following procedure:

(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

This procedure demonstrates the use of a compound expression as an operator. The operator is determined
by the result of the conditional expression (if (> b 0) + -), which selects addition (+) if b is greater than zero
or substraction (-) if b is less or equal to zero). This evaluates as a plus the absolute value of b.
|#