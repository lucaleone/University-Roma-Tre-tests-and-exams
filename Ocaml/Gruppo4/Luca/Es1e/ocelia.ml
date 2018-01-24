(* lst1 ed lst2 sono entrambe liste , la prima verrà aggiunta alla seconda *)
(* facciamo un reverse a lst1 al fine di non aggiungere gli elementi al    *)
(* contrario, e ottenre quondi lo stesso effetto di @ val append : 'a list *)
(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve    *)
(* fare nulla append : 'a list -> 'a list -> 'a list = <fun>               *)
let append lst1 lst2 =
	let lst1 = List.rev lst1
	(* aux : 'a list -> 'a list -> 'a list = <fun> *)
	in let rec aux lst1 lst2 =
		match lst1 with
		| [] -> lst2
		| hd:: tl -> aux tl (hd:: lst2)
	in aux lst1 lst2