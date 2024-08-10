#lang simply-scheme

(define (product a b term next)
  (if (> a b)
      1
      (* (term a) (product (next a) b term next))))

(define (product-iterative a b term next)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* a result))))
  (iter a 1))

(define (factorial n)
  (product-iterative 1 n identity inc))

(define (wallis-pi n)
  (define (term x)
    (* (/ (* 2 x) (- (* 2 x) 1)) (/ (* 2 x) (+ (* 2 x) 1))))
  (* 2.0 (product 1 n term inc)))

(define (leibniz-pi n)
  (define (coefficient k)
    (if (even? k)
        -1.0
        1.0))
  (define (term x)
    (/ (coefficient x) (+ 1 (* 2 (- x 1)))))
  (* 4 (sum 1 n term inc)))

(define (compare-pi-methods n)
  (display "n\tWallis\t\t\tLeibniz\t\t\tActual Pi\n")
  (do ((i 1 (+ i 1)))
    ((> i n))
    (display i)
    (display "\t")
    (display (wallis-pi i))
    (display "\t")
    (display (leibniz-pi i))
    (display "\t")
    (display 3.141592653589793)
    (newline)))

(define (sum a b term next)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ (term a) result))))
  (iter a 0))
      
(define (identity x) x)

(define (inc x) (+ x 1))