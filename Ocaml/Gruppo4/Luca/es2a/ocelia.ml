(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve fare nulla *)
(* len = lunghezza della lista; elem= l'elemento da inserire    *)
(* nella lista *)
(* copy : int -> 'a -> 'a list = <fun>                         *)
let copy len elem =
	if len <0 then failwith "la lunghezza non può essere nagativa"
	(* res è la lista di ritorno aux : int -> 'a list -> 'a list = <fun> *)
	else let rec aux len res =
			match len with
			| 0 -> res
			| _ -> aux (len -1) (elem :: res)
		in aux len []