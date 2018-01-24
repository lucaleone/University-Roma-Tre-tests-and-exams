(* isAtomo torna true se l'argomento passato a parametro è un atomo, quindi True, False o Prop *)
(* isAtomo : form -> bool *)
let isAtomo = function
	| True | False | Prop _ -> true
	| _ -> false

(* test_nnf applicata ad una form controlla che essa sia in forma normale negativa, ovvero contanga solamente *)
(* ovvero che contenga solo ¬,∧ e ∨ e che ¬ sia applicato solo ad atomi *)
(* test_nnf : form -> bool *)
let rec test_nnf = function
	| Imp _ -> false
	| Not a -> isAtomo a
	| And(a, b) | Or(a, b) -> (test_nnf a) && (test_nnf b)
	| _ -> true
	