#lang simply-scheme

(define (switch snt)
  (define (switch-helper snt index result)
    (define (replace word index)
      (cond ((member? word '(I me)) 'you)
            ((member? word '(You you))
             (if (= index 0) 'I 'me))
            (else word)))
  (if (null? snt)
      result
      (switch-helper (bf snt) (+ 1 index) (sentence result (replace (first snt) index)))))
  (switch-helper snt 0 '()))

(define (member? word snt)
  (cond ((null? snt) #false)
        ((equal? word (first snt)) #true)
        (else (member? word (bf snt)))))

