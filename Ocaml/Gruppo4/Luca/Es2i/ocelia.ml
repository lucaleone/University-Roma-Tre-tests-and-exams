(* e' "tail recursive": al ritorno dalla chiamata ricorsiva non si deve fare nulla *)
(* take : int -> 'a list -> 'a list *)
let rec take n = function
		[] -> []
	| x:: xs -> if n <=0 then [] else
				x:: take (n -1) xs
				

(* fa uso di drop, definito precedentemente *)				
(* lst = la lista da dividere *)
(* split : 'a list -> 'a list * 'a list = <fun> *)
let split2 lst =
	let div = (List.length lst /2)
	in (take div lst, drop div lst)