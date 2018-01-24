(* find: ’a -> ’a list -> ’a list * ’a list *)
(* find elem lst crea una coppia di liste tramite la divisione della lista lst nel primo punto in cui c'è un elemento uguale a elem*)
(* aux: ’a list -> ’a list -> ’a list * ’a list *)
(* aux scorre lst, ad ogni iterazione mette l'emento temporaneo in testa, in left. quando trova un elemento uguale a elem *)
(* restituisce una coppia con first= tutti gli elementi precedenti all'elemento uguale a elem (sono memorizzati in left) *)
(* e snd= a tutti gli elementi dopo l'elemento uguale a elem*)
let find elem lst =
	let rec aux left = function
		| [] -> failwith "la lista non contiene l'elemento cercato"
		| hd:: tl -> if hd = elem then (List.rev left, tl)
				else aux (hd:: left) tl
	in aux [] lst
