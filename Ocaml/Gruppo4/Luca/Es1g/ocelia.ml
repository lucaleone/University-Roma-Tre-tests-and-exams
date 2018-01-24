(* n= l'index dell'elemento che cerchiamo; lst= la lista in qui stiamo     *)
(* cercando nth : int -> 'a list -> 'a = <fun>                             *)
let nth n lst =
	if n <0 || n > (List.length lst) then failwith "Lista troppo corta"
	(* aux scorre a ritroso la n fino a 0, quando ci arriva restituisce        *)
	(* l'elemento in testa di lst e' "tail recursive": al ritorno dalla        *)
	(* chiamata ricorsiva non si deve fare nulla aux : int -> 'a list -> 'a =  *)
	(* <fun>                                                                   *)
	else let rec aux n lst =
			match n with 0 -> List.hd lst
			| _ -> aux (n -1) (List.tl lst)
		in aux n lst