#lang simply-scheme

#|

Since we have defined a new procedure, when we call this new-if procedure,
it will evaluate its arguments first, because of the applicative-order
evaluation for procedure arguments.
The interpreter doesn't know that we are replicating a boolean procedure,
in which it doesn't need to evaluate the second (or third) expression unless
the first one is true, it evaluates all the arguments before calling
the new-if, due to the applicative-order evaluation.
So when it evaluates the third argument (which we only know should work
as an else clause) it keeps calling itself, because it enters the sqrt-iter
function and repeats the process. The new-if is actually never called.
It just keeps evaluating its third argument, which is a call to the same
function.

On the other hand, the if special form will first evaluate the predicate,
if its true it will then execute the consequent expression,
if not, it will execute the alternative expression.
This way, our problem with infinite recursion in the alternative expression
of the new-if procedure will only be evaluated when it is actually needed,
that is, the first part of the if will correctly execute when we reach
the base case (when the if predicate is true), and the alternative won't be
called in that case.
|#


(define (sqrt-iter x guess)
  (new-if (good-enough? x guess)
       guess
      (sqrt-iter x (improve-guess x guess))))

(define (good-enough? x guess)
  (< (abs(- (square guess) x)) 0.001))

(define (improve-guess x guess)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter x 1.0))

(define (new-if predicate then-clause else-clause)
  (cond (predicate then-clause)
        (else else-clause)))