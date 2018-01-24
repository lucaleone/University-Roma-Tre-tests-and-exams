(* max_list : 'a * 'b -> ('a * 'b) list -> 'a * 'b *)
(* max_list applicata a una lista  di coppie riporta la coppia con secondo elemento maggiore*)
(* di tutta la lista*)
let rec max_list (f,c) = function
| [] -> (f,c)
| (x,y) :: rest ->  if y > c
	                  then max_list (x,y) rest
										else max_list (f,c) rest

(* foglia_costo : int ntree -> int * int *)
(* dato un albero n-ario di interi, restuisca l’etichetta e il costo della foglia più costosa   *)
(* dell’albero. L’albero può anche avere diversi nodi con la stessa etichetta                   *)
let rec foglia_costo = function
	| Tr(x,[]) -> (x,x)
	| Tr(x,tlist) -> let listacoppie = List.map (function l -> let (f,c) = foglia_costo l
	                                                           in (f,c+x) ) tlist
							     in max_list (List.nth listacoppie 0) listacoppie