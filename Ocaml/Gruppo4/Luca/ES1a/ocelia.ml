(* Non è "tail recursive" in quanto dopo la chiamata ricorsiva si performa *)
(* lst è la lista di cui vogliamo conoscere la lunghezza length : 'a list  *)
(* -> int = <fun>                                                          *)
let rec length lst =
	match lst with
	| [] -> 0
	| hd :: tl -> 1 + length tl

(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve    *)
(* lst è la lista di cui vogliamo conoscere la lunghezza length_tr : 'a    *)
(* list -> int = <fun>                                                     *)
let length_tr lst =
	(* res = la lunghezza relativa della lista lst aux : int -> 'a list ->   *)
	(* int = <fun>                                                           *)
	let rec aux res lst =
		match lst with
		| [] -> res
		| hd :: tl -> aux (res + 1) tl
	in aux 0 lst
