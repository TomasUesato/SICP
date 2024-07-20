#lang simply-scheme

#|
The good-enough? test will not be very effective for finding the
square roots of very small numbers because when we perform the test,
specifically the substraction between the square of the guess and the
guess, the difference will be in fact a smaller number than the
predetermined tolerance (0.001)

For example, if we want to know the square root of 1e-7 (0.0000001),
which is approximately 0.0003162, and we start with a guess of 0.001,
we get:
(square 0.001) - 0.0000001 = 0.000001 - 0.0000001 = 0.0000009

This is less than our tolerance of 0.001, so the algorithm would stop here,
even though 0.001 is more than 3 times larger than the actual square root.

On the other hand, for very large numbers, we could have a good guess in
relative terms, that is, where the difference between two nearly equal large
numbers could be small in absolute terms, but it would still be larger than
the predetermined tolerance. This could lead to excessive iterations, in order
to achieve a difference smaller than the tolerance, or even failure or
impossibility to finish the program, due to the representation nature
of floating point numbers, that is, the difference smaller than the
tolerance could not be achieved with the 15-17 significant decimal digits
of precision for double-precision numbers (IEEE 754).

For example, if we're trying to find the square root of 10^20,
the actual square root is 10^10. If we start with a guess that off
by just 0.0001%: 10^10 * 1.000001 = 10,000,010,000
If we apply our test:
(square 10,000,010,000) - 10^20 =
 100,000,200,000,100,000,000
-
 100,000,000,000,000,000,000
         200,000,100,000,000

We started with a good guess, off by 0.0001%, but the difference is much
larger in absolute terms than our tolerance, even though is was extremely
close in relative terms, so the algorithm will continue iterating, trying
to get this absolute difference below 0.001, which may be impossible due to
floating-point precision limitations.


good-enough? with fixed tolerance:
(sqrt (expt 10 20))
1.0

(sqrt (expt 10 -20))
0.003906250000000001

New version:
(sqrt (expt 10 20))
10000000000.023079

(sqrt (expt 10 -20))
1.000000000002308e-10

|#

(define (sqrt-iter x guess)
  (if (relative-change-good-enough? guess (improve-guess x guess))
       guess
      (sqrt-iter x (improve-guess x guess))))

;previous good-enough? procedure, with fixed tolerance
(define (fixed-tolerance-good-enough? x guess)
  (< (abs(/ (square guess) x)) 0.001))

;new good-enough? procedure, with relative change
(define (relative-change-good-enough? guess next-guess)
   (< (percentage-relative-change guess next-guess) 0.0001))

(define (percentage-relative-change x y)
  (abs (* (/ (- y x) x) 100)))

(define (improve-guess x guess)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (sqrt x)
  (sqrt-iter x 1.0))

