(* pattern_matching : expr -> expr -> bool *)
(* data un' espressione expr e un modello di espressione model,*)
(* determini se expr e model si confrontano positivamente  tramite l'analisi di model e dei suoi evenuali jolly *)
let rec pattern_matching expr model =
	expr = model ||
		match expr,model with
		| e,Jolly -> true
		| Sum(e1, e2),Sum(m1, m2)   | Diff(e1, e2),Diff(m1, m2) |
		  Mult(e1, e2),Mult(m1, m2) | Div(e1, e2),Div(m1, m2) -> (pattern_matching e1 m1) && (pattern_matching e2 m2)
		| _ -> false
