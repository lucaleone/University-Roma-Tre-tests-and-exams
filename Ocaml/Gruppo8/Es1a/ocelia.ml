(* subexpr : expr -> expr -> bool *)
(* subexpr e1 e2 determina se e2 è una sottoespressione di e1. *)
let rec subexpr e1 e2 =
	e1 = e2 || match e1 with
	| Sum(a, b) | Diff(a, b) | Mult(a, b) | Div(a, b) -> (subexpr (a) e2) || (subexpr (b) e2)
	| _ -> false