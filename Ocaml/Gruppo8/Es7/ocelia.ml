(* foglie_costi : int tree -> (int * int) list *)
(* foglie_costi abr riporta una lista di coppie assocciando ad ogni foglia il suo costo*)
(* aux : (int * int) -> (int * int) list -> (int * int) list *)
(* aux (f,n) lst riporta una lista di coppie, *)
(* ciascuna delle quali ha la forma (f,n), dove f è l’etichetta di una foglia in abr e *)
(* n il costo di tale foglia *)
let rec foglie_costi abr =
	let rec aux (foglia, sum) lst = function
		Empty -> lst
		| Tr (a, Empty, Empty) -> (a, sum + a)::lst
		| Tr (a, t1, t2) -> (aux(a, sum + a ) lst t1) @ (aux(a,sum + a ) lst t2)
		 in aux (0,0) [] abr