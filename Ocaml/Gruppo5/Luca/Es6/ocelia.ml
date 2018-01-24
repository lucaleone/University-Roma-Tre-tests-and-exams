(* metodo preso da i file della lezione *)
(* take : int -> 'a list -> 'a list *)
let rec take n = function
		[] -> []
	| x:: rest ->
			if n <=0 then []
			else x:: take (n -1) rest

(* choose : int -> 'a list -> 'a list list *)
(* choose prende un int a parametro e una lista lst*)
(* crea sottoliste di lunghezza n degli elementi consecutivi di lst, dove possibile (cioè List.length (hd:: tl) >= n) *)
(* aux : 'a list list -> 'a list -> 'a list list *)
(* fallisce se n è negativo *)
let choose n lst =
	let rec aux res lst =
		match lst with
		| [] -> List.rev res
		| hd :: tl -> if (List.length (hd:: tl) >= n) then aux ((take n (hd:: tl) ):: res) tl
				else List.rev res
	in if n >=0 then aux [] lst
	else failwith "errore: numero negativo!  inserire un numero maggiore o uguale a 0"