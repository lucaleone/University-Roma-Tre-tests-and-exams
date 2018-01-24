(* trips : 'a list -> ('a * 'a * 'a) list *)
(* lst è la lista da usare per creare una lista di triple *)
(* aux : ('a * 'a * 'a) list -> 'a list -> ('a * 'a * 'a) list *)
(* res rappresenta il risultato cioè la lista di triple *)
let trips lst= 
	let rec aux res lst=
		match lst with
  	| [] -> List.rev res
		| hd :: tl -> if(List.length tl)<2 then List.rev res
								else aux ((hd, List.hd tl, List.hd (List.tl tl)) :: res) tl
	in aux [] lst
	