(* CODICE LEZIONE *)
(* in_labirinto : int -> int * int -> bool *)
let in_labirinto dim (r, c) =
	r >= 0 && c >= 0 && r < dim && c < dim

(*questa versione e tail recursive: dopo la chiamata al metodo recursuvoaux non c'è più alcuna operazione da esegurire*)		
(* filter_vicini : int -> (int * int) list -> (int * int) list *)
(* aux : (int * int) list -> (int * int) list -> (int * int) list *)
(* res è la lista di coppie, grazie a res la funzione non deve eseguire nulla dopo la chiamata recursiva *)
let filter_vicini dim lst =
	let rec aux res lst = 
		match lst with
		| [] -> res
		| casella:: rest ->	if in_labirinto dim casella then aux (casella:: res) rest 
											else aux res rest 
	in aux [] lst 

(* CODICE LEZIONE *)
(* per "raccogliere" tutti gli oggetti contenuti in una casella *)
(*  find_content : ('a * 'b list) list -> 'b -> 'a list *)
let rec find_content contenuti c =
  match contenuti with
    [] -> []
  | (x,caselle)::rest ->
      if List.mem c caselle then x::find_content rest c
      else find_content rest c
			
(*questa versione e tail recursive: dopo la chiamata al metodo recursuvoaux non c'è più alcuna operazione da esegurire*)		
(* raccolti : (’a * ’b list) list -> ’b list -> ’a list *)
(* aux : 'a list -> 'b list -> 'a list *)
(* res è la lista di ritorno *)
let raccolti contenuti lst=
	let rec aux res lst =
		match lst with
		| [] -> res
		| casella:: rest -> aux ((find_content contenuti casella) @res) rest
	in aux [] lst
	
	
	