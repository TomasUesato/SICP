#lang simply-scheme

#|
iterate over the sentence
check last letter
append to result
|#

(define (ends-e snt)
  (define (ends-e-helper words result)
    (cond ((empty? words) result)
          ((ends-e-word (first words)) (ends-e-helper (bf words) (sentence result (first words))))
          (else (ends-e-helper (bf words) result))))
  (ends-e-helper snt '()))

(define (ends-e-word word)
  (equal? (last word) 'e))


