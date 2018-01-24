(* find : (’a -> bool) -> ’a list -> ’a 																   *)
(* find p lst riporta il primo elemento di lst che soddisfa il predicato p *)
let rec find p lst =
	match lst with
	|  [] -> failwith "Nessun elemento della lista soddisfa il predicato."
	| hd::tl -> if p hd then hd else find p tl

(* find_applicata : int list ->int *)
(* richama la funzione find sopra definita con predicato int -> bool*)
(* che moltiplica per se stesso x e lo confronta a 30 se minore restitusce true*)
let find_applicata lst =
	find (fun x-> (x*x) < 30) lst