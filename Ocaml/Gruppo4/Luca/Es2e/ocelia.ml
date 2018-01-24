(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve  fare nulla  *)
(* lst la lista da numerare *)
(* enumera : 'a list -> (int * 'a) list = <fun> *)
let enumera lst =
	(* res numerata; x il numero corrente *)
	(* aux : ('a * 'b) list -> 'b list -> int -> ('a * 'b) list = <fun>  *)
	let rec aux res lst x =
		match lst with
		| [] -> List.rev res
		| hd:: tl -> aux ((x, hd) :: res) tl (x +1)
	in aux [] lst 0