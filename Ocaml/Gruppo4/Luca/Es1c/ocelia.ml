(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve    *)
(* lst = la lista in cui cercare il max e' "tail recursive": al ritorno    *)
(* dalla chiamata ricorsiva non si deve fare nulla maxlist : 'a list -> 'a *)
(* = <fun>                                                                 *)
let maxlist lst =
	(* res = elemento massimo relativo aux : 'a -> 'a list -> 'a = <fun> *)
	let rec aux res lst =
		match lst with
		| [] -> res
		| hd :: tl -> aux ( max res hd ) tl
	in try aux (List.hd lst) (List.tl lst)
	with _ -> failwith "Lista non valida"