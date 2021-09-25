;;; Scheme code for Twenty-One Simulator [PS2 Fall '90]

(define (twenty-one player-strategy house-strategy)
  (let ((house-initial-hand (make-new-hand (deal))))
    (let ((player-hand
           (play-hand player-strategy
                      (make-new-hand (deal))
                      (hand-up-card house-initial-hand))))
      (if (> (hand-total player-hand) 21)
          0                                ; ``bust'': player loses
          (let ((house-hand 
                 (play-hand house-strategy
                            house-initial-hand
                            (hand-up-card player-hand))))
            (cond ((> (hand-total house-hand) 21)
                   1)                      ; ``bust'': house loses
                  ((> (hand-total player-hand)
                      (hand-total house-hand))
                   1)                      ; house loses
                  (else 0)))))))           ; player loses

(define (play-hand strategy my-hand opponent-up-card)
  (cond ((> (hand-total my-hand) 21) my-hand) ; I lose... give up
        ((strategy my-hand opponent-up-card) ; hit?
         (play-hand strategy
                    (hand-add-card my-hand (deal))
                    opponent-up-card))
        (else my-hand)))                ; stay


(define (deal) (+ 1 (random 10)))

(define (make-new-hand first-card)
  (make-hand first-card first-card))

(define (make-hand up-card total)
  (cons up-card total))

(define (hand-up-card hand)
  (car hand))

(define (hand-total hand)
  (cdr hand))

(define (hand-add-card hand new-card)
  (make-hand (hand-up-card hand)
             (+ new-card (hand-total hand))))

(define (hit? your-hand opponent-up-card)
  (newline)
  (princ "Opponent up card ")
  (princ opponent-up-card)
  (newline)
  (princ "Your Total: ")
  (princ (hand-total your-hand))
  (newline)
  (princ "Hit? ")
  (user-says-y?))


(define (user-says-y?) (eq? (read-from-keyboard) 'y))


(define princ display)
(define read-from-keyboard read)
(define false #f)
(define true #t)

; Problem 2
(define (stop-at number)
  (lambda (my-hand opponent-up-card)
    (if (< (hand-total my-hand) number)
        true
        false)))

; Problem 3
(define (test-strategy player-strategy house-strategy number-of-games)
  (define (iter player-win house-win)
    (cond ((>= (+ player-win house-win) number-of-games) player-win) 
          ((= 1 (twenty-one player-strategy house-strategy)) 
            (iter (+ 1 player-win) house-win))
          (else
            (iter player-win (+ 1 house-win)))))
  (iter 0 0))

; Problem 4
(define (watch-player strategy)
  (lambda (my-hand opponent-up-card)
    (newline)
    (princ "Your Total: ")
    (princ (hand-total my-hand))
    (princ ",  Opponent up card ")
    (princ opponent-up-card)
    (newline)

    (cond ((strategy my-hand opponent-up-card)
            (princ "Hit ")
            true)
          (else 
            (princ "Stay ")
            false))))

; Problem 5

; total-hand < 12, hit
; total-hand > 16, stay
; total-hand == 12 and opponent-up-hand < 4, hit
; total-hand == 16 and opponent-up-hand == 10, stay
; else, hit
(define (louis my-hand opponent-up-card)
  (cond ((< (hand-total my-hand) 12) true)
        ((> (hand-total my-hand) 16) false)
        ((and (= (hand-total my-hand) 12) (< opponent-up-card 4)) true)
        ((and (= (hand-total my-hand) 16) (= opponent-up-card 10)) false)
        ((> opponent-up-card 6) true)
        (else   false)))

; Problem 6
(define (both first-strategy second-strategy)
  (lambda (my-hand opponent-up-card)
    (if (and (first-strategy my-hand opponent-up-card)
             (second-strategy my-hand opponent-up-card))
        true
        false)))

