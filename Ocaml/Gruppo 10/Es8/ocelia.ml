exception Cammino_non_esistente

(* remove_elem : 'a -> 'a list -> 'a list *)
(* remove_elem dato un elemento x e una lista lst riporta la lista
   che si ottirene rimuovendo x dalla lst*)
let rec remove_elem e = function
	| [] -> []
	| x:: rest -> if x = e
			then rest
			else x:: (remove_elem e rest)

(* ramo_da_lista : 'a ntree -> 'a list -> 'a -> 'a list *)
(* aux : 'a ntree list -> 'a list *)
(* aux funzione ausiliaria applicata a una lista di alberi *)
(* ramo_da_lista dato un albero T, una lista L senza ripetizioni e un’etichetta k,           *)
(* riporta, se esiste, un ramo di T dalla radice a una foglia etichettata da k *)
(* che passi per tutti gli elementi di L esattamente una volta e contenga solo *)
(* nodi etichettati da elementi di L       *)
let rec ramo_da_lista (Tr(elem, lst) as tree) lst k =
	print_string "ci sei\n"; if List.mem elem lst then let lst = remove_elem elem lst
		in match tree with
		| Tr(a, []) -> if a = k && lst = [] then [a] else raise Cammino_non_esistente
		| Tr(a, figli) -> let rec aux = function
					| [hd] -> a:: (ramo_da_lista hd lst k)
					| hd:: tl -> try a:: (ramo_da_lista hd lst k) with _ -> aux tl
				in aux figli
	else raise Cammino_non_esistente