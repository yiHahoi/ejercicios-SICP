#lang sicp

; constante de tolerancia
(define tolerance 0.00001)

; fixed-point SIN average damping
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; fixed-point CON average damping
(define (fixed-point-avgDamp f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (avg a b) (/ (+ a b) 2.0))
  (define (try guess)
    (display guess)
    (newline)
    (let ((next (avg guess (f guess))))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

; TESTS!
; sin avg damp
(fixed-point (lambda (x) (/ (log 1000) (log x))) 2.0)
(newline)
(newline)
; con avg damp
(fixed-point-avgDamp (lambda (x) (/ (log 1000) (log x))) 2.0)

; como se puede ver, con average damping se logra una aproximacion 
; similar mucho mas rapido (10 pasos contra 35).

