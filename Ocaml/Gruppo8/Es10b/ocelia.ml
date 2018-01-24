(* esiste_mapping : 'a tree -> 'b tree -> bool *)
(* esiste mapping tr1 tr2 determina se esiste un mapping tra tr1 e tr2*)
(* aux : 'a tree -> 'b tree -> ('a * 'b) list *)
(* aux tr1 tr2 costruisce una lista associando a ogni elemento di tr1 l'elemento corrispondente di t2*)
(* aux2 : ('a * 'b) list -> bool *)
(* aux lst riporta true se e solo se non esistono nella lista lst due valori*)
(* con primo elemento uguale e secondo diverso*)
let esiste_mapping tr1 tr2 =
	 (stessa_struttura tr1 tr2) && let rec aux tr1 tr2 =
		match tr1,tr2 with
		| Tr(a,t1,t2),Tr(b,t3,t4) -> [(a,b)]@(aux t1 t3)@(aux t2 t4)
		| Empty,Empty -> []
	in let rec aux2 = function
		| [] -> true
		| (a,b)::rest -> if(List.mem_assoc a rest) then((List.assoc a rest)=b)&&(aux2 rest)
		                else (aux2 rest)
		in aux2 (aux tr1 tr2) 