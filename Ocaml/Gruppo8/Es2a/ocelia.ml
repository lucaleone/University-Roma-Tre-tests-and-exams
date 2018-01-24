(* reflect : 'a tree -> 'a tree *)
(* reflect abr riflette orizontalmente l'albero abr*)
let rec reflect = function
	| Empty -> Empty
	| Tr (a, t1, t2) -> Tr (a, (reflect t2), (reflect t1))