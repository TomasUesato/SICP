#lang simply-scheme

(define (accumulate combiner null-value term a next b)
  (if (> a b)
      null-value
      (combiner (term a) (accumulate combiner null-value term (next a) next b))))

(define (accumulate-iterative combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner (term a) result))))
  (iter a null-value))

(define (sum a b term next)
  (accumulate + 0 term a next b))

(define (product a b term next)
  (accumulate * 1 term a next b))

(define (sum-integers a b)
  (sum a b identity inc))

(define (product-integers a b)
  (product a b identity inc))

(define (identity x) x)

(define (inc x) (+ x 1))