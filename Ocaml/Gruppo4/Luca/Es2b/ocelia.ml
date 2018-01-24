(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve  fare nulla  *)
(* lst è la lista da controllare la non decrescenza *)
(* nondec : 'a list -> bool = <fun>                 *)
let nondec lst =
	(* prev contiene l'elemento precedente alla hd *)
	(* aux : 'a -> 'a list -> bool = <fun>         *)
	let rec aux prev lst =
		match lst with
		| [] -> true
		| hd:: tl -> if hd >= prev then aux hd tl else false
	in try aux (List.hd lst) (List.tl lst) with _ -> failwith "Lista non valida"