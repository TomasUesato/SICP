#lang simply-scheme

#|
Both of this procedures are safe to execute without the risk of crashing the program because of
dividing by zero.
In the first one, the procedure is implemented using the OR special form, in the second one, the AND
special form. If the Y value is 0 in either case, the program never executes the division and returns
the result of the logic evaluation.
These tests let us see that the OR and the AND operation are specials forms, not ordinary procedures.
If they were an ordinary procedure they would have to evaluate every argument before actually using
the operator. If that were the case, when the Y input is 0, it would divide by zero and crash the program,
but instead, the execution stops at the evaluation of the first argument, where it catches the case in which
the divisor is 0, short-circuiting the program and not performing the division.
|#

(define (division_or x y)
  (or (= y 0) (/ x y)))


(define (division_and x y)
  (and (not (= y 0)) (/ x y)))