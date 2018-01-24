type multi_expr =
| MultiInt of int
| MultiVar of string
| MultiDiff of multi_expr * multi_expr
| MultiDiv of multi_expr * multi_expr
| MultiSum of multi_expr list
| MultiMult of multi_expr list

(* subexpr e1 e2 date due espressioni determina se e2 è sottoespressione di e1 *)
(* subexpr : multi_expr -> multi_expr -> bool *)
let rec subexpr e1 e2 =
	e1 = e2 	
	|| match e1 with
  	| MultiDiff (a, b) | MultiDiv(a, b) -> (subexpr (a) e2) || (subexpr (b) e2)
  	| MultiSum a | MultiMult a -> List.mem e1 a
  	| _ -> false

(* subst e1 s e2 , date due espressioni e1 e2 e una stringa, *)
(* costruisce un espressione a partire da e1 sostituendo ogni occorrenza della stringa con e2*)
(* subst : multi_expr -> string -> multi_expr -> multi_expr *)
let rec subst e1 s e2 =
	match e1 with	
	| MultiDiff (a, b) -> MultiDiff((subst (a) s e2),(subst (b) s e2))
	| MultiDiv(a, b) -> MultiDiv((subst (a) s e2),(subst (b) s e2))
	| MultiSum a | MultiMult a -> MultiSum( List.map (fun hd -> subst hd s e2) a)
 	| MultiVar a -> if a = s then (e2:multi_expr) else (MultiVar a)
	| MultiInt a -> MultiInt a
