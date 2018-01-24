(* takewhile: (’a -> bool) -> ’a list -> ’a list *)
(* takewhile p lst riporta la più lunga parte iniziale di lst *)
(* costituita tutta da elementi che soddisfano il predicato p *)
(* aux : int list -> int list -> int list *)
(* aux res lst: aggiunge a res l'elemento temporaneo in testa di lst che soddisfa il predicato p, *)
(* altrimenti la ricorsione si ferma e restituiamo res (dopo averlo invertito)*)
(* se tutti gli elementi di lst soddifano p si andrà nel caso [] -> List.rev res*)
let takewhile p lst =
	let rec aux res lst =
		match lst with
		| [] -> List.rev res
		| hd::tl -> if p hd then aux (hd::res) tl else List.rev res
	 in aux [] lst
