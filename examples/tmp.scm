; ; 1.2
; (/ (+ 5 4 (- 2 (- 3 (+ 6 (/ 4 5))))) (* 3 (- 6 2) (- 2 7)))

; ; 1.3
; (define (max_sum x y z)
;     (cond ((and (< x y) (< x z)) (+ y z))
;         ((< y z) (+ x z))
;         (else (+ x y))))

; (display (max_sum 1 2 3))

; ; 1.4
; ; 把运算符当作运算对象处理
; (define (a-plus-abs-b a b)
;     ((if (> b 0) + -) a b))

; (display (a-plus-abs-b 2 -1))
; (display (a-plus-abs-b 2 1))


; ; 1.5
; ; 应用序会陷入 (p) 的无限循环，正则序则会返回 0 .
; (define (p) (p))
; (define (test x y)
;     (if (= x 0)
;         0
;         y))
; (display (test 0 (p)))


; ; 牛顿法求平方根
; (define (average x y)
;     (/ (+ x y) 2))

; (define (improve guess x)
;     (average guess (/ x guess)))

; (define (abs x)
;     (if (> x 0) x (- 0 x)))

; (define (square x) (* x x))

; (define (good-enough? guess x)
;     (< (abs (- (square guess) x)) 0.001))


; (define (sqrt-iter guess x)
;     (if (good-enough? guess x)
;         guess
;         (sqrt-iter (improve guess x) x)))

; (define (sqrt x)
;     (sqrt-iter 1.0 x))

; (display (square (sqrt 1000)))


; ; 1.6
; ; cond 的 <ei> 是序列表达式，返回最后一个表达式的值，而 if 里的 <consequent> 只能是单个表达式
; ; new-if 的 <predicate> 条件为 #t 时，两个表达式 <then-caluse> 和 <else-caluse> 都会被执行，
; ;           <predicate> 条件为 #f 时，执行表达式 <else-caluse> 。
; ; 最终会导致死循环
; (define (new-if predicate then-caluse else-caluse)
;     (cond (predicate then-caluse)
;           (else else-caluse)))

; (define (average x y)
;     (/ (+ x y) 2))

; (define (improve guess x)
;     (average guess (/ x guess)))

; (define (abs x)
;     (if (> x 0) x (- 0 x)))

; (define (square x) (* x x))

; (define (good-enough? guess x)
;     (< (abs (- (square guess) x)) 0.001))


; (define (sqrt-iter guess x)
;     (new-if (good-enough? guess x)
;         guess
;         (sqrt-iter (improve guess x) x)))

; (define (sqrt x)
;     (sqrt-iter 1.0 x))

; (display (square (sqrt 1000)))


(exit)