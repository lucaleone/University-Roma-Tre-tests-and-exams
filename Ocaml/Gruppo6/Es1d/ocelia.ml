(* partition: (’a -> ’bool) -> ’a list -> (’a list * ’a list) *)
(* yes contiene tutti gli elementi di lst che soddisfano il predicato p, e *)
(* no quelli che non lo soddisfano *)
(* aux : (’a list * ’a list) -> ’a list -> (’a list * ’a list) *)
(* aux (yes,no) lst: aggiunge a yes l'elemento temporaneo in testa di lst che soddisfa il predicato p, *)
(* in 'no' se non lo soddisfa *)
(* lst viene fatto scorrere con tl*)
let partition p lst = 
	let rec aux (yes,no) lst =
		match lst with
		| [] -> (yes,no)
		| hd::tl -> if p hd then aux (hd::yes,no) tl 
									else aux (yes,hd::no) tl 
	in aux ([],[]) lst