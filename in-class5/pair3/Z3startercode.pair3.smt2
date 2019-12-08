;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  BEGIN HEADER  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(declare-const a Int)
(declare-const b Int)
(declare-const c Int)

(declare-const trian1 Int)
(declare-const trian2 Int)
(declare-const trian3 Int)
(declare-const trian  Int)

(declare-const initial-condition bool)
(declare-const mutated-condition bool)

(assert (and (> a 0) (> b 0) (> c 0))) ; Line 20

;; A ==> B is the same as (not A) OR B
;; (a = b) ==> (trian1 = 1) is the same as
;;         (a != b) \/ trian1 = 1
(assert (or (not (= a b)) (= trian1 1)))
(assert (or (= a b) (= trian1 0)))

(assert (or (not (= a c)) (= trian2 2)))
(assert (or (= a c) (= trian2 0)))

(assert (or (not (= b c)) (= trian3 3)))
(assert (or (= b c) (= trian3 0)))

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  END HEADER  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; MUTANT 84
;; @@ -35 +35 @@
;; -            if (a + b <= c || a + c <= b || b + c <= a) {
;; +            if (a + b <= c || a + c <= b || b + c < a) {

;;;;;;;;;;;;;;;;; START STUDENT CODE ;;;;;;;;;;;;;;;

; TODO: Issue a constraint that makes trian = trian1 + trian2 + trian3

(assert (= trian (+ trian1 trian2 trian3)))
(assert (= trian 0))
(assert (> (+ a b) c))
(assert (> (+ a c) b))
(assert (= initial-condition (<= (+ b c) a)))
(assert (= mutated-condition (< (+ b c) a))

; TODO: Add constraints to classify Mutant 84 as equivalent or non-equivalent

;;;;;;;;;;;;;;;;; END STUDENT CODE ;;;;;;;;;;;;;;;

(assert (not (= mutated-condition initial-condition)))

(check-sat)
;; If needed, run
;; (echo "-------------------------------- Getting model ---------------------------------")
;; (get-model)

