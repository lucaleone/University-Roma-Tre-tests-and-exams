(* remove : 'a -> 'a list -> 'a list = <fun> *)
let remove x lst =
	(* res = la lista di ritorno, cioè la lista lst senza gli elemnti uguali *)
	(* al momento del ritorno del valore facciamo List.rev res per ottenere  *)
	(* la stassa lista senza gli elementi x, altrimenti avrebbe avuto ordine *)
	(* opposto. avremmo potuto anche usare il metodo prima definito reverse  *)
	(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve  *)
	(* fare nulla a x aux : 'a list -> 'a list -> 'a list = <fun>            *)
	let rec aux res lst =
		match lst with
		| [] -> List.rev res
		| hd:: tl ->	if x != hd then aux (hd:: res) tl
				else aux res tl
	in aux [] lst
