#lang simply-scheme
(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

#|
Applicative-order evaluation first evaluates the arguments, before the procedure is applied.
So it will evaluate the arguments 0 and (p) before entering the body of 'test'.
0 evaluates to itself, but when trying to evaluate (p), it will enter
an infinite loop, as p is defined to call itself repeteadly.

Normal order evaluation will first expand the argument and then reduce them.
This means that the interpreter would first substitute the arguments into the body of 'test'
without evaluating them: (if (= 0 0) 0 (p))
Then it would evaluate the predicate (= 0 0), which is true. And since the predicate is true
it would then return 0, and (p) is never evaluated because it's not needed.

|#