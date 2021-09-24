; Exercise 4.2
; a) 将“过程应用”子句放到“赋值”子句之前，该求值器会将 (define x 3) 识别为“过程应用”。
; b) 
(define application? exp) (tagged-list? exp 'call)
(define (operator exp) (cadr exp))
(define (operands exp) (cddr exp))

; Exercise 4.3
; 

; Exercise 4.4
(define (eval-and exps env)
  cond ((and-empty? exps) true
        (else (let (answer (eval (and-first-exp exps) env)
                (if (true? answer)
                  (eval-and (and-rest-exps exps) env)
                  false))))))
