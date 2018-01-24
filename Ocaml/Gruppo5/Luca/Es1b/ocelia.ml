(* combine : 'a list -> 'b list -> ('a * 'b) list *)
(* combina le liste lst1 e lst2 al fine di creare una lista di coppie *)
(* lancia errore le liste hanno lunghezza diversa *)
(* aux : 'a list -> 'b list -> ('a * 'b) list -> ('a * 'b) list *)
(* lst1 e lst2 sono le liste da combinare *)
(* res è la lista di ritorno. *)
let combine lst1 lst2=
		if List.length lst1 <> List.length lst2
		then failwith "Liste di lunghezza diversa"
		else  let rec aux lst1 lst2 res=
			match lst1 with
			| [] -> res
			| x::rest -> aux rest (List.tl lst2) ((x,List.hd lst2)::res)
			in aux lst1 lst2 []