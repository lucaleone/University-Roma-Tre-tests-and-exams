(* prendi : ('a -> bool) -> 'a list -> 'a * 'a list *)
(* prendi crea una coppia in cui fst è il primo elemento della lista lst  *)
(* che soddisfa il predicato p *)
(* aux : 'a list -> 'a list -> 'a * 'a list *)
(* aux lst prev dove prev contiene tutti gli elementi passati.  *)
(* Scorre lst e quando il predicato p applicato all'elemnto temporaneo in testa a x è vero*)
(* crea la coppia con quell'elemento e lst tranne l'elemento*)
let prendi p lst = 
	let rec aux lst prev =
		 match lst with
		| [] -> failwith "elemento non esiste"
		| x::rest -> if (p x) then (x,(List.rev prev)@rest)
	 						else aux rest (x::prev)
		in aux lst []