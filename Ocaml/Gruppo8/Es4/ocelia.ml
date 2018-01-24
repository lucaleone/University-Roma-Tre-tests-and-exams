(* num_foglie : 'a tree -> int *)
(* dato un albero resituisce il numero delle sue foglie *)
let rec num_foglie = function
	  Empty -> 0
	| Tr (_, Empty, Empty) -> 1
	| Tr (_, t1, t2) -> (num_foglie t1)+(num_foglie t2)




	let a1 = Tr(0, Tr(10, Tr(2, Empty, Empty), Tr(5, Empty, Empty)),
							 Tr(6, Tr(6, Tr(3, Empty, Empty), Empty),
										 Tr(4, Tr(3, Empty, Empty), Tr(4, Empty, Empty))))
	