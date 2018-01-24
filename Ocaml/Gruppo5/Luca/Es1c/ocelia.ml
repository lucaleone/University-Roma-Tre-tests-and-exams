(* split : ('a * 'b) list -> 'a list * 'b list *)
(* divide in due liste left e right gli elementi delle coppie contenuti in lst.*)
(* il primo elemento va in left, il secondo in right *)
(* aux : ('a * 'b) list -> 'a list -> 'b list -> 'a list * 'b list *)
(* l'aux si occupa si scorrere lst e pettere gli elementi in left o right *)
let rec split lst =
	let rec aux lst left right =
		match lst with
		| [] -> (List.rev left, List.rev right)
		| hd:: tl -> aux tl ((fst hd) :: left) ( (snd hd):: right )
	in aux lst [] []