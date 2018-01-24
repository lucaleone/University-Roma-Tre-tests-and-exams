(* combina  num1 con tutti i numeri fra 1, compreso, e max*)
(* num2 scorre da 1 a max*)
(* pairaux : ('a * int) list -> 'a -> int -> 'b -> ('a * int) list *)
let rec pairaux list num1 num2 max =
	if(num2 <= max) then pairaux ((num1, num2):: list) num1 (num2 +1) max
	else  list


(* intpairs : int -> (int * int) list *)
(* fa scorrere num da 1 a n e lo da a parametro a pairaux per creare tutte le combinazione con num *)
(* aux : (int * int) list -> int -> (int * int) list *)
(* lst è la lista di ritorno; num scorre da 1 a n*)
let intpairs n =
	let rec aux lst num =
		if num <= n then aux ((pairaux lst num 1 n)) (num +1)
		else List.rev lst
	in aux [] 1
