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


(define (make-card value suit) 
  (list value suit))

(define (card-value card) 
  (car card))

(define (card-suit card) 
  (cadr card))

(define (deal) 
  (make-card (+ 1 (random 10)) (+ 1 (random 4))))

(define (make-new-hand first-card)
  (make-hand (list first-card) (card-value first-card)))

(define (make-hand up-card total)
  (list total up-card))

(define (hand-up-card hand)
  (caadr hand))

(define (hand-total hand)
  (car hand))

(define (hand-cards hand)
  (cadr hand))

; append new-card
(define (hand-add-card hand new-card)
  (make-hand (append (cadr hand) (list new-card))
             (+ (card-value new-card) (hand-total hand))))

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

