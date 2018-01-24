(* exists : 'a -> 'a list -> bool  *)
(* controlla se l'elemento x è presente nella lista passata a parametro *)
let rec exists x = function
	| [] -> false
	| hd:: tl -> if x = hd then true else exists x tl

(* unione : 'a list -> 'a list -> 'a list *)
(* unisce tutti gli elementi di lst1 a quelli di lst2 ( senza duplicati) *)
(* i reverse vengono fatti per mantenere l'ordine originale *)
(* aux : 'a list -> 'a list -> 'a list *)
(* res è la lista di ritorno che conterrà tutti gli elementi di lst1 e lst2 *)
let unione lst1 lst2 =
	let rec aux res lst2 =
		match lst2 with
		| [] -> List.rev res
		| hd:: tl -> if exists hd res then aux res tl
				else aux (hd:: res) tl
	in aux (List.rev lst1) lst2

(* intersezione : 'a list -> 'a list -> ('b list -> 'b) list = <fun> *)
(* restituisce tutti gli elementi presenti in entrambe le liste ,lst1 e lst2, senza duplicati *)
(* il reverse viene fatti per mantenere l'ordine originale *)
(* aux : 'a list -> 'a list -> 'a list -> 'a list *)
(* res è la lista di ritorno che conterrà tutti gli elementi in comune a lst1 e lst2 *)
let intersezione lst1 lst2 =
	let rec aux res lst1 lst2 =
		match lst1 with
		| [] -> List.rev res
		| hd:: tl -> if exists hd lst2 then aux (hd :: res) tl lst2
				else aux res tl lst2
	in aux [] lst1 lst2
	
(* differenza : 'a list -> 'a list -> ('b list -> 'b) list = <fun> *)
(* restiusce gli elementi di lst1 che non fanno parte di lst2 *)
(* il reverse viene fatti per mantenere l'ordine originale *)
(* aux : 'a list -> 'a list -> 'a list -> 'a list *)
(* res è la lista di ritorno che conterrà tutti gli elementi di lst1 che non fanno parte di lst2 *)
let differenza lst1 lst2 =
	let rec aux res lst1 lst2 =
		match lst1 with
		| [] -> List.rev res
		| hd:: tl -> if exists hd lst2 then aux res tl lst2
								 else aux (hd :: res) tl lst2 
	in aux [] lst1 lst2
	
(* subset : 'a list -> 'a list -> bool = <fun> *)
(* restituisce true se tutti gli elementi di lst1 sono in lst2, a quindi lst1 e sottoinsieme di lst2 *)
(* aux : 'a list -> 'a list -> bool *)
(*aux scorre lst1 per controllare che tutti i suoi elemanti siano in lst2 *)
let subset lst1 lst2 =
	let rec aux lst1 lst2 =
		match lst1 with
		| [] -> true
		| hd:: tl -> if exists hd lst2 then aux tl lst2
								 else false 
	in aux lst1 lst2

	