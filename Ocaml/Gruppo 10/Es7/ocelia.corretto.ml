(* dato una albero n-ario abr ritorna una lista di coppie (f,n),  *)
(* dove f è l'etichetta della foglia e n il suo costo *)
(* tutte_foglie_costi : 'a ntree -> ('a * int) list *)
(* aux scorre l'albero tenendo conto del costo *)
(* aux : int -> 'a ntree -> ('a * int) list *)
let rec tutte_foglie_costi abr =
	let rec aux costo = function
		| Tr(a, []) -> [(a, costo)]
		| Tr(_, [hd]) -> aux (costo +1) hd
		| Tr(_, hd::tl) -> (aux (costo +1) hd) @ List.concat (List.map (fun hd2 -> aux (costo +1) hd2) tl)
	in aux 0 abr
	