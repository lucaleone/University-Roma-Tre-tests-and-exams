(* max_common_subtree : string tree -> string tree -> string tree		*)
(* max_common_subtree tr1 tr2 riporta l'albero massimo comune tra tr1 e tr2 *)
let rec max_common_subtree tr1 tr2 =
	match tr1, tr2 with
	| Empty, Empty -> Empty
	| Tr (a, t1, t2), Tr (b, t3, t4) -> if a = b then
				Tr(a, max_common_subtree t1 t3, max_common_subtree t2 t4)
			else
				Tr("@", max_common_subtree Empty Empty, max_common_subtree Empty Empty)
	| Empty, Tr(_, t1, t2) 
	| Tr(_, t1, t2), Empty -> Tr("@", max_common_subtree Empty t1, max_common_subtree Empty t2)
