(* same_structure abr1 abr2 determina se i due alberi hanno la stessa struttura*)
(* same_structure : 'a ntree -> 'b ntree -> bool *)
(* aux cicla fra i figli di entrambi gli alberi, riportando true se hanno uguale strutura *)
(* aux : 'a ntree * 'b ntree -> bool  *)
let rec same_structure abr1 abr2 =
	match abr1, abr2 with
	| Tr(_, []), Tr(_, []) -> true
	| Tr(_, [hd]), Tr(_, [hd2]) -> same_structure hd hd2
	| Tr(_, lst), Tr(_, lst2) -> ( let rec aux = function
					| [hd],[hd2] -> same_structure hd hd2
					| ((hd:: tl), (hd2:: tl2)) -> (same_structure hd hd2) && (aux (tl, tl2))
					| _ -> false
				in aux (lst, lst2) )
