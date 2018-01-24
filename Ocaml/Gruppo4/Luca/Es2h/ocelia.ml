(* fa utilizzo di maxlist definito precedentemente *)
(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve fare nulla *)
(*lst è la lista di liste di interi da controllare *)
(* min_dei_max : int list list -> int = <fun> *)
let min_dei_max lst =
	(* min è in minimo relativo *)
	(* aux : int list list -> int -> int = <fun> *)
	let rec aux lst min =
		match lst with
		| [] -> min
		| hd:: tl -> if min> maxlist hd then aux tl (maxlist hd )
		 else aux tl min 			
	in aux (List.tl lst) ( maxlist (List.hd lst) )