(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve fare nulla *)
(*lst è la lista da cui prendo gli elementi in modo alternato  *)
(* alternate : 'a list -> 'a list = <fun> *)
let alternate lst =
	(* res= lista di ritorno; pos = la posizione attuale, ogni volta viene incrementata*)
	(* aux : 'a list -> 'a list -> int -> 'a list = <fun> *) 
	let rec aux lst res pos =
		match lst with
		| [] -> List.rev res
		| hd:: tl -> if (pos mod 2)!=0 then aux tl (hd :: res) (pos +1)
				else aux tl res (pos +1)
	in try aux (List.tl lst) [] 1 with _ -> failwith "Lista non valida"