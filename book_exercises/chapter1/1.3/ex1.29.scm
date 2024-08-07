#lang simply-scheme

(define (sum a b term next)
  (if (> a b)
      0
      (+ (term a) (sum (next a) b term next))))

(define (inc n)
  (+ n 1))

(define (cube x)
  (* x x x))

(define (simpson-coefficient x n)
  (cond ((or (= x 0) (= x n)) 1.0)
        ((even? x) 2.0)
        (else 4.0 )))

(define (simpson-term f a k h)
  (f (+ a (* k h))))


(define (simpsons-integral f a b n)
  (let ((h (/ (- b a) n)))
  (define (combined-term k)
    (* (simpson-coefficient k n) (simpson-term f a k h)))
  (* (/ h 3.0) (sum 0 n combined-term inc))))