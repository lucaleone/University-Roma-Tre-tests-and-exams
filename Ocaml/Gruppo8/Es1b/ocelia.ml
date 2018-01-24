(* subst_in_expr : expr -> 'a -> expr -> expr *)
(* subst_in_expr e1 var e2 sostituisce in ogni occorrenza di var in e1, e2*)
let rec subst_in_expr expr var expr2 =
	match expr with
	| Var var -> expr2
	| Sum(a, b) ->  Sum((subst_in_expr a var expr2), (subst_in_expr b var expr2))
	| Diff(a, b)-> Diff((subst_in_expr a var expr2), (subst_in_expr b var expr2))
	| Mult(a, b)-> Mult((subst_in_expr a var expr2), (subst_in_expr b var expr2))
	| Div(a, b) ->  Div((subst_in_expr a var expr2), (subst_in_expr b var expr2))
	| _ -> expr