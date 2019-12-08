;; This differentiates the following two programs:
;;
;;
;;        public int sum(int x, int y, int z){
;;            int a1 = x + y;
;;            int a2 = a1 + z;
;;            return a2;
;;        }
;;
;; and 
;;
;;        public int sum(int x, int y, int z){
;;            int a1 = x + y;
;;            int a2 = a1 - z;
;;            return a2;
;;        }

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  BEGIN HEADER  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(declare-const x Int)
(declare-const y Int)
(declare-const z Int)
(declare-const a1 Int)
(declare-const a2 Int)
(declare-const mutated_a2 Int)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;  END HEADER  ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;;;;;;;;;;;;;;;;; START STUDENT CODE ;;;;;;;;;;;;;;;


(declare-const rOrig Int)
(declare-const rMut Int)

(assert (= a1 (+ x y)))
(assert (= rOrig (+ a1 z)))
(assert (= rMut (- a1 z)))

(assert (not (= rOrig rMut)))

;;;;;;;;;;;;;;;;; END STUDENT CODE ;;;;;;;;;;;;;;;

(check-sat)
;; If needed, run
;; (echo "-------------------------------- Getting model ---------------------------------")
;; (get-model)

