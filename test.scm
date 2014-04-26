(load "network.scm")


;Test filter
;(display (filter (list 1 5 6 4 2 5) (lambda (x) (< 4 x))))

;Tests for depth-first-search
(define graph (list (list (position 0 1) (position 1 1))
					(list (position 1 1) (position 0 1) (position 1 5) (position 5 5))
					(list (position 1 5) (position 1 1) (position 5 1) (position 5 5))
					(list (position 5 1) (position 1 5) (position 7 3))
					(list (position 5 5) (position 1 1) (position 1 5))
					(list (position 7 3) (position 5 1) (position 5 5))))

(display (depth-first-search WHITE (position 0 1) graph nil NO-DIRECTION 0))

;Tests for is-valid?
(define blacks (list (position 1 2) (position 3 4) (position 4 4)))
(define whites (list (position 5 4) (position 2 2) (position 6 6)))
(define game1 (game blacks whites))

(newline)
(display (list #f (is-valid? (position 1 2) BLACK game1)))
(display (list #f (is-valid? (position 2 2) BLACK game1)))
(display (list #t (is-valid? (position 6 7) BLACK game1)))
(display (list #t (is-valid? (position 1 1) BLACK game1)))
(display (list #f (is-valid? (position 2 3) BLACK game1)))
(display (list #f (is-valid? (position 7 4) BLACK game1)))
(display (list #f (is-valid? (position 0 3) BLACK game1)))
(newline)
(display (list #f (is-valid? (position 2 7) WHITE game1)))
(display (list #f (is-valid? (position 4 0) WHITE game1)))
(display (list #f (is-valid? (position 6 5) WHITE game1)))
(display (list #t (is-valid? (position 1 3) WHITE game1)))
(display (list #t (is-valid? (position 5 3) WHITE game1)))
(display (list #t (is-valid? (position 2 3) WHITE game1)))
(display (list #t (is-valid? (position 6 3) WHITE game1)))
(newline)
(newline)
(display (print-game game1))
(newline) 
(display (print-game (make-add-move game1 BLACK (position 5 6))))
(newline)
(display (print-game (make-add-move game1 WHITE (position 5 3))))
(newline)
(display (print-game (make-step-move game1 BLACK (position 1 2) (position 1 1))))
(newline)
(display (print-game game1))
(display (get-valid-positions game1 BLACK))
(newline) 
(display "ADD TESTS")
(newline)
(display "----------------------------------------------------------------")
(load "ai.scm")
(newline)

;add move tests
;(map (lambda (move) (begin (newline) (display (print-game (move game1))))) (find-moves game1 BLACK))
(newline)
(display "----------------------------------------------------------------")
(newline)
;(map (lambda (move) (begin (newline) (display (print-game (move game1))))) (find-moves game1 WHITE))

;step move tests
(newline)
(display "STEP TESTS")
(define game2
    (game
    (list (position 2 0) (position 6 0) (position 3 2) (position 1 3) (position 4 3) (position 6 3) (position 6 4) (position 2 5) (position 4 6) (position 3 7))
    (list (position 3 1) (position 5 1) (position 1 2) (position 0 3) (position 3 3) (position 7 3) (position 3 4) (position 5 4) (position 5 5) (position 2 6))))

(newline)
(display "----------------------------------------------------------------")
(newline)
(newline)
(display (print-game game2))
(newline)
(newline)
(map (lambda (move) (begin (newline) (display (print-game (move game2))))) (find-moves game2 BLACK))
(newline)
(display "----------------------------------------------------------------")
(newline)
(map (lambda (move) (begin (newline) (display (print-game (move game2))))) (find-moves game2 WHITE))
