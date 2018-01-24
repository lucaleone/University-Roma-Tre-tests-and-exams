(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve  fare nulla  *)
(* lst da duplicare *)
(*  duplica : 'a -> 'b list -> ('a * 'b) list = <fun>    *)
let duplica lst =
	(* res = la lista duplicata; prev= eleento precedente *)
	(* aux : 'a list -> 'b list -> 'c list = <fun>         *)
	let rec aux res prev lst =
		match lst with
		| [] -> List.rev (prev :: prev :: res)
		| hd:: tl -> aux (prev :: prev :: res) hd tl
	in try aux [] (List.hd lst) (List.tl lst) with _ -> failwith "Lista non valida"