(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve fare nulla *)
(* lst è la lista in cui si controlla dove è la prima occorrenza di x  *)
(* position : 'a -> 'a list -> int = <fun> *)
let position x lst =
	(*res= posizione elemento x, viene inizializzato a 0, se non trova nulla si eseque il failwith *)
	(* aux : 'a list -> int -> int = <fun> *)
	let rec aux lst res=
		match lst with
		| [] -> failwith "elemento non esistente."
		| hd:: tl ->	if x = hd then res
									else aux tl (res+1)
	in aux lst 0