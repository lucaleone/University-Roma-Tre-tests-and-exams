(* explode : string -> char list *)
(* explode prende come parametro una stringa str e riporta una lista contenente i caratteri di str *)
(* aux : char list -> int -> char list *)
(* res è la lista di ritorno e idx è la posizione corrente  *)
let explode str =
	let rec aux res idx =
		if idx < String.length str then
			aux ((String.get str idx):: res) (idx +1)
		else List.rev res
	in aux [] 0

(* implode : char list -> string *)
(* implode prende a parametro una lista lstStr di caratteri e la prasforma in un a stringa*)
(* aux : string -> char list -> string *)
(* aux scorre la lista lstStr e aggiunge in coda ogni suo elemento, convertendolo prima in char; alla fine restituisce res cioè la lista*)
let implode lstStr =
	let rec aux res lstStr =
		match lstStr with
		| [] -> res
		| hd::tl -> aux ( res^(String.make 1 hd)) tl
	in aux "" lstStr
	