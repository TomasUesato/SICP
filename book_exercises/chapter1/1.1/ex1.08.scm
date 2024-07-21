#lang simply-scheme

(define (cube-root-iter x guess)
  (if (good-enough? guess (improve-guess x guess))
      (round-if-close x guess)
      (cube-root-iter x (improve-guess x guess))))

(define (improve-guess x guess)
  (/ (+ (/ x (square guess)) (* 2 guess)) 3))

(define (good-enough? guess next-guess)
  (< (percentage-relative-change guess next-guess) 0.0001))

(define (percentage-relative-change x y)
  (abs (* (/ (- y x) x) 100)))

(define (round-if-close x guess)
  (let ((rounded(round guess)))
  (if (= (cube rounded) x)
      rounded
      guess)))

(define (cube x)
  (* x x x))

(define (square x)
  (* x x))

(define (cube-root x)
  (cube-root-iter x 1.0))


; Simple test function
(define (test-cube-root input expected-output)
  (let ((result (cube-root input)))
    (if (< (abs (- result expected-output)) 0.0001)
        (display "Test passed: ")
        (display "Test failed: "))
    (display "cube root of ")
    (display input)
    (display " = ")
    (display result)
    (display " (expected ")
    (display expected-output)
    (display ")")
    (newline)))

; Run tests
(define (run-tests)
  (test-cube-root 8 2)
  (test-cube-root 27 3)
  (test-cube-root -8 -2)
  (test-cube-root 0 0)
  (test-cube-root 1 1)
  (test-cube-root 1000 10)
  (test-cube-root 0.000001 0.01)
  (test-cube-root 1000000000 1000)
  (test-cube-root (expt 10 10) 2154.4346))

; Run the tests
(run-tests)
