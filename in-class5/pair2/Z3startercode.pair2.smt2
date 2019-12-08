;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  BEGIN HEADER  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define-sort MyInt () (_ BitVec 8))
;; These represent the parameters to our method
(declare-const a MyInt)
(declare-const b MyInt)
(declare-const c MyInt)

;; Some bit-vector constants for convenience
(declare-const bv0 MyInt) ; 0000
(declare-const bv1 MyInt) ; 0001
(declare-const bv2 MyInt) ; 0010
(declare-const bv3 MyInt) ; 0011

;; Some more convenience constants representing relations of a, b, and c
(declare-const a-eq-b bool)
(declare-const a-eq-c bool)
(declare-const b-eq-c bool)

;; Here we do some SSA style assignments to get the final value of trian
(declare-const trian1 Int)
(declare-const trian2 Int)
(declare-const trian3 Int)
(declare-const trian  Int)

; Conditionals in if statements given by their line numbers in the initial
; source code. Thus line-20-cond corresponds to 
; 
;       if (a <= 0 || b <= 0 || c <= 0) { ...
;
; This is provided for convenience

(declare-const line-20-cond bool) ; if (a <= 0 || b <= 0 || c <= 0)
(declare-const line-24-cond bool) ; if (a == b)
(declare-const line-27-cond bool) ; if (a == c)
(declare-const line-30-cond bool) ; if (b == c)
(declare-const line-33-cond bool) ; if (trian == 0)
(declare-const line-34-cond bool) ; if (a + b <= c || a + c <= b || b + c <= a)

; Assign the values of the conditionals
(assert (=  line-20-cond (or  (bvslt a bv0) 
                              (bvslt b bv0)
                              (bvslt c bv0))))
(assert (= line-24-cond a-eq-b))
(assert (= line-27-cond a-eq-c))
(assert (= line-30-cond b-eq-c))
(assert (= line-33-cond (= trian 0)))

;; Here we use the __definition__ of logical implication:
;;
;;      X ==> Y := !X \/ Y
;;
;; to set up our values for trian1, trian2, and trian3. Notice that we have to
;; write two implications:
;;
;;    cond-is-true  ==> trian1 = 1
;;    cond-not-true ==> trian1 = 0
;;
;; Justify to yourself why BOTH contstraints are needed!

(assert (or (not line-24-cond) (= trian1 1)))
(assert (or      line-24-cond  (= trian1 0)))

(assert (or (not line-27-cond) (= trian2 2)))
(assert (or      line-27-cond  (= trian2 0)))

(assert (or (not line-30-cond) (= trian3 3)))
(assert (or      line-30-cond  (= trian3 0)))

(assert (= trian (+ trian1 trian2 trian3)))

(declare-const initial-condition bool)
(declare-const mutated-condition bool)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  END HEADER  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; # MUTANT 59
;; @@ -34 +34 @@
;; -        if (trian == 0) {
;; +        if (trian <= 0) {

(echo "=================================== MUTANT 59 ==================================")

;;;;;;;;;;;;;;;;; START STUDENT CODE ;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;; END STUDENT CODE ;;;;;;;;;;;;;;;

(assert (not (= mutated-condition initial-condition)))

(check-sat)
;; If needed, run
;; (echo "-------------------------------- Getting model ---------------------------------")
;; (get-model)
