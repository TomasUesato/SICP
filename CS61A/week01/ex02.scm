#lang simply-scheme

(define (squares numbers)
  (if (empty? numbers) '()
      (sentence (square (first numbers)) (squares (bf numbers)))))

(define (square x)
  (* x x))