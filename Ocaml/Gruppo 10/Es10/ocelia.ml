(* path_non_pred : ('a -> bool) -> 'a ntree -> 'a list*)
(* aux : 'a ntree list -> 'a list *)
(* applicata a un predicato p: ’a -> bool e a un albero
   t, riporta, se esiste, un cammino dalla radice a una foglia di
   t che non contenga alcun nodo che soddisfa p *)
(* aux funzione ausiliaria applicata a liste di alberi chiama
   path_non_pred per ogni figlio *)
let rec path_non_pred pred (Tr(elem, lst) as abr) =
if pred elem then
		match abr with
		| Tr(a, []) -> [a]
		| Tr(a, lst) -> let rec aux = function
            					| [hd] -> a::(path_non_pred pred hd)
            					| hd::tl -> try a::(path_non_pred pred hd) with _ -> aux tl
            				in aux lst
	else failwith "Non esiste un ramo di non soddisfi il predicato"
