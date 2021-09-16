(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x 
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (print-interval x)
  (newline)
  (display "[")
  (display (car x))
  (display ", ")
  (display (cdr x))
  (display "]"))


; Exercise 2.7
(define (make-interval a b) (cons a b))
(define (upper-bound x) (cdr x))
(define (lower-bound x) (car x))

(newline)
(display "Exercise 2.7: ")
(print-interval (make-interval 1 3))
(print-interval (add-interval (make-interval 2 3) (make-interval 1 3)))

; Exercise 2.8
(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(newline)
(display "Exercise 2.8: ")
(print-interval (sub-interval (make-interval 3 5) (make-interval -10 1)))

; Exercise 2.10
(define (div-interval x y)
  (if (and (< (lower-bound y) 0) (> (upper-bound y) 0))
    (error "division has 0" y)
    (mul-interval x 
      (make-interval (/ 1.0 (upper-bound y))
                     (/ 1.0 (lower-bound y))))))

(newline)
(display "Exercise 2.10: ")
; (print-interval (div-interval (make-interval 3 5) (make-interval -10 2)))

(exit)
