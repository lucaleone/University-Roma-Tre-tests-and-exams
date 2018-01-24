(*cancella l'elemento dalla lista associata lst che ha ciave uguale a del *)
(* cancella : 'a -> ('a * 'b) list -> ('a * 'b) list 											*)
(* aux : ('a * 'b) list -> ('a * 'b) list -> ('a * 'b) list              	*)
(* prev è la lista di tutti gli elementi precedenti al corrente 					*)
let cancella del lst =
	let rec aux prev lst=
		match lst with 
		| [] -> lst
		| hd::tl -> if (fst hd) = del then (List.rev prev) @ tl
		 else aux (hd::prev) tl
		in aux [] lst