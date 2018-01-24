(* abr_check : ('a * 'b) tree -> bool *)
(* abr_check abr riporta true se esolo se abr è un albero binario di ricerca, false altrimenti*)
let rec abr_check = function
	| Empty -> true
	| Tr(_, Empty, Empty) -> true
	| Tr((a, _), (Tr((b,_), _, _) as sx), (Tr((d, _), _, _) as dx)) -> b < a && d > a && abr_check(sx) && abr_check(dx)
	| Tr((a, _), (Tr((b, _), _, _) as sx), Empty) -> b < a && abr_check(sx)
	| Tr((a, _), Empty, (Tr((d, _), _, _) as dx)) -> d > a && abr_check(dx)