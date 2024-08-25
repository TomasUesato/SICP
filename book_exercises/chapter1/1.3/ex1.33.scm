#lang simply-scheme

(define (filtered-accumulate combiner null-value term a next b filter)
  (cond ((> a b) null-value)
        ((filter a) (combiner (term a) (filtered-accumulate combiner null-value term (next a) next b filter)))
        (else (filtered-accumulate combiner null-value term (next a) next b filter))))


(define (filtered-accumulate-iterative combiner null-value term a next b filter)
  (define (iter a result)
    (cond ((> a b) result)
          ((filter a) (iter (next a) (combiner (term a) result)))
          (else (iter (next a) result))))
  (iter a null-value))
                            
  
(define (sum-squares-of-primes a b)
  (sum a b square inc prime?))

(define (sum a b term next filter)
  (filtered-accumulate-iterative + 0 term a next b filter))

(define (prime? x)
  (if (= x 1)
      #f
      (= (smallest-divisor x) x)))

(define (smallest-divisor x)
  (cond  ((even? x) 2)
         (else (find-divisor-from x 3))))

(define (find-divisor-from n k)
  (cond ((> (square k) n) n)
        ((divides? k n) k)
        (else (find-divisor-from n (+ k 2)))))

(define (divides? a b)
  (= (modulo b a) 0))


(define (square x) (* x x))
(define (identity x) x)
(define (inc x) (+ x 1))

                              