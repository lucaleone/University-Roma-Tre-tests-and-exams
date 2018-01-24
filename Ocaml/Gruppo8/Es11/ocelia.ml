(* path : ('a -> bool) -> 'a tree -> 'a list *)
(* applicata a un predicato p: 'a -> bool e a un albero abr, riporti,se esiste,  *)
(* un cammino dalla radice a una foglia di abr che non contenga alcun nodo che soddisfa p. *)
(* se il cammino non esiste si lancia un'eccezione  *)
let rec path p abr =
	match abr with
		Empty -> failwith "Il Cammino non esiste"
	| (Tr (a, Empty, Empty)) -> if p a then failwith "Il Cammino non esiste" else [a]
	| (Tr (a, t1, t2)) -> if p a then failwith "Il Cammino non esiste"
			else try ([a]@(path p t1)) with _ -> ([a]@(path p t2))
