(* Non è "tail recursive" in quanto dopo la chiamata ricorsiva si performa *)
(* lst = e la lista i cui elementi vanno sommati sumof : int list -> int = *)
(* <fun>                                                                   *)
let rec sumof lst =
	match lst with
	| [] -> 0
	| hd:: tl -> hd + sumof tl

(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve    *)
(* lst = e la lista i cui elementi vanno sommati sumof_tr : int list ->    *)
(* int = <fun>                                                             *)
let sumof_tr lst =
	(* sum = la somma relativa delgi elementi di lst aux : int -> int list   *)
	(* -> int = <fun>                                                        *)
	let rec aux sum lst =
		match lst with [] -> sum
		| hd:: tl -> aux (sum + hd) tl
	in aux 0 lst