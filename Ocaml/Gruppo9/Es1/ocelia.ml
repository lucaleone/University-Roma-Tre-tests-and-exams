(* complessita prende a parametro una formula e calcola la sua complessità *)
(* complessita : form -> int *)
let rec complessita = function
	| And(a, b) | Or(a, b) | Imp(a, b) -> 1 + (complessita a) + (complessita b)
	| Not a -> 1 + (complessita a)
	| _ -> 0