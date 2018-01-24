(* satxand_of_lits : form -> bool				*)
(* satxand_of_lits	applicata a congiunzioni di letterali riporta true seè soddisfacibile, *)
(* false altrimenti. *)
(* complementare è la funzione dell'esercizio 4 *)
let satxand_of_lits f =
	let l = and2list f
 	 in let rec aux f =
		match f with
		| [] -> true
		| hd::tl -> (not(List.mem (complementare hd) tl)) && (aux tl) 
		in aux l
