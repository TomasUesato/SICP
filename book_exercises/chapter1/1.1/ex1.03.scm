#lang simply-scheme

(define (square x)
  (* x x))

(define (sum-of-squares x y)
  (+ (square x) (square y)))

(define (largest-of-two x y)
  (if (> x y)
      x
      y))

(define (sum-of-squares-of-largest-two-numbers x y z)
  (sum-of-squares (largest-of-two x y) (largest-of-two y z)))