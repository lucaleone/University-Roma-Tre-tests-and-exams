(* foglia_costo : int tree -> int * int *)
(* aux : int * int -> int tree -> int * int *)
(* Dato un albero binario di interi abr, restuisce l’etichetta e il costo di una delle foglie più costosa dell’albero *)
(* il costo è la somma di tutti i nodi che si trovano sul ramo che va dalla radice di abr a la foglia *)
(* aux  (foglia, sum) abr cerca la foglia con costo maggiore *)
let rec foglia_costo abr =
	let rec aux (foglia, sum) = function
			Empty -> (0,0)
		| Tr (a, Empty, Empty) -> (a, sum + a)
		| Tr (a, t1, t2) -> let left = aux (a, sum + a) t1 in
				let right = aux (a, sum + a) t2 in
				if (snd left) > (snd right) then left else right
	in aux (0,0) abr
	