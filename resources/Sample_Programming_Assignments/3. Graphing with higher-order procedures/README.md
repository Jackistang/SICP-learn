
Section 1

```scheme
(define (square x) (* x x))

(define (compose f g)
  (lambda (x)
    (f (g x))))

(define (thrice f)
  (compose (compose f f) f))

(define (identity x) x)
```

```scheme
(((thrice thrice) f) 0) -> ((repeated f 27) 0)

> ((thrice 1+) 6)           ; 3
9
> ((thrice (thrice 1+)) 6)  ; 3*3
15
> (((thrice thrice) 1+) 6)  ; 3*3*3
33

>  (((thrice thrice) identity) compose)
#<procedure compose>

> (((thrice thrice) square) 1)
1

> (((thrice thrice) square) 2)
数据太大，导致解释器卡死。

```

Exercise 2


2.1 What is the type of unit-line-at?

unit-line-at: Sch-Num --> Curve(Sch-Num --> Point).

2.2 

```scheme
(define (vertical-line point length)
  (lambda (t) 
    (make-point 
      (x-of point)
      (+ (y-of point) (* t length)))))
```

2.3

vertical-line: (Point, Sch-Num) --> Curve.

Exercise 3

```scheme
(define (reflect-through-y-axis curve)
  (lambda (t)
    (let ((ct (curve t)))
      (make-point 
        (- (x-of ct))
        (y-of ct)))))

; reflect-through-y-axis: Curve --> Curve
```

Exercise 4

```scheme
(define (connect-ends curve1 curve2)
  (connect-rigidly 
    curve1 
    ((translate 
      (- (x-of (curve1 1)) (x-of (curve1 0))) 
      (- (y-of (curve1 1)) (y-of (curve1 0)))) 
        curve2)))
```