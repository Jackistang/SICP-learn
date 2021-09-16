(define (gcd a b)
    (if (= b 0)
        a
        (gcd b (remainder a b))))

; 有理数构造表示
(define (make-rat n d)
    (let ((g (gcd n d)))
      (cons (/ n g) (/ d g))))
(define (number x) (car x))
(define (denom x) (cdr x))
(define (print-rat x)
    (newline)
    (display (number x))
    (display "/")
    (display (denom x)))


; 有理数运算
(define (add-rat x y)
    (make-rat (+ (* (number x) (denom y)) 
                 (* (number y) (denom x)))
              (* (denom x) (denom y))))

(define (sub-rat x y)
    (make-rat (- (* (number x) (denom y)) 
                 (* (number y) (denom x)))
              (* (denom x) (denom y))))

(define (mul-rat x y)
    (make-rat (* (number x) (number y))
              (* (denom x) (denom y))))

(define (div-rat x y)
    (make-rat (* (number x) (denom y))
              (* (number y) (denom x))))

(define (equal-rat? x y)
    (= (* (number x) (denom y))
       (* (number y) (denom x))))


(define one-half (make-rat 1 2))
(print-rat one-half)

(define one-third (make-rat 1 3))
(print-rat (add-rat one-half one-third))

(print-rat (mul-rat one-half one-third))

(print-rat (add-rat one-third one-third))

(define minus-one-minus-half (make-rat -1 -2))
(print-rat minus-one-minus-half)

(define minus-one-half (make-rat -3 2))
(print-rat minus-one-half)

(define one-minus-half (make-rat -2 2))
(print-rat one-minus-half)

(exit)