(* num_di_foglie : 'a ntree -> int *)
(* num_di_foglie applicata a un albero n-ario, riporta il numero di foglie dell’albero *)
(* num_di_foglielst : 'a ntree list -> int *)
(* num_di_foglielst funzione ausiliaria che applicata a una lista di alberi *)
(* riporta il numero di foglie dell’albero *)
let rec num_di_foglie = function
	| Tr(_,[]) -> 1
	| Tr(_,tlst) -> num_di_foglielst tlst
	and num_di_foglielst = function
		| [] -> 0
		| hd::tl -> (num_di_foglie hd) + (num_di_foglielst tl) 