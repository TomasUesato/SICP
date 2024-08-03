#lang simply-scheme


(define (ordered? numbers)
  (define (ordered-helper numbers prev)
    (cond ((null? numbers) #true)
          ((> prev (first numbers)) #false)
          (else (ordered-helper  (bf numbers) (first numbers)))))
  (if (null? numbers)
      #true
      (ordered-helper (bf numbers) (first numbers))))

