#lang simply-scheme
(define (sqrt-iter x guess)
  (if (good-enough? x guess)
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