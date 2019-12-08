;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  BEGIN HEADER  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(declare-const x Int)
(declare-const y Int)
(declare-const a1 Int)
(declare-const a2 Int)
(declare-const a3 Int)
(declare-const initial-a2 Int)
(declare-const mutated-a2 Int)
(declare-const orig Int)
(declare-const mut Int)

(declare-const x-lt-zero Bool)
(declare-const y-lt-zero Bool)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  END HEADER  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;; START STUDENT CODE ;;;;;;;;;;;;;;;


(assert(or (< x 0) (= a1 x)))
(assert(or (>= x 0) (= a1 (* -1 x))))

(push)
(assert(or (< y 0) (= a1 y)))
(assert(or (>= y 0) (= a2 (* -1 y))))

; mutant 1
(push)
(assert(= orig (+ a1 a2)))
(assert(= mut (- a1 a2)))
(assert(not(= orig mut)))
(check-sat)
(pop)
; mutant 2
(push)
(assert(= orig (+ a1 a2)))
(assert(= mut (* a1 a2)))
(assert(not(= orig mut)))
(check-sat)
(pop)

(pop)

(declare-const initial-condition bool)
(declare-const mutated-condition bool)
(declare-const initial-output Int)
(declare-const mutated-output Int)
(assert (= initial-condition (< y 0)))
(assert (or (not initial-condition) (= initial-a2 y)))
(assert (or initial-condition (= initial-a2 (* -1 y))))
(assert (= initial-output (+ a1 initial-a2)))

(push)
(assert (= mutated-condition (= y 0)))
(assert (or (not mutated-condition) (= mutated-a2 y)))
(assert (or mutated-condition (= mutated-a2 (* -1 y))))
(assert (= mutated-output (+ a1 mutated-a2)))
(assert (not (= mutated-output initial-output)))
(check-sat)
(pop)

(push)
(assert (= mutated-condition (<= y 0)))
(assert (or (not mutated-condition) (= mutated-a2 y)))
(assert (or mutated-condition (= mutated-a2 (* -1 y))))
(assert (= mutated-output (+ a1 mutated-a2)))
(assert (not (= mutated-output initial-output)))
(check-sat)
(pop)

(pop)

