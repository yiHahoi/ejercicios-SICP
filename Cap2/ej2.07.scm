#lang sicp


; constructor de intervalo
(define (make-interval a b) (cons a b))

; lower
(define (lower-bound x)
  (min (car x) (cdr x)))

; upper
(define (upper-bound x)
  (max (car x) (cdr x)))

; suma dos intervalos
(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

; multiplica dos intervalos
(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

; divide dos intervalos
(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))



