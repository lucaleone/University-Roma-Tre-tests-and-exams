(* insert chiede a parametro un elemento 'elem' di confronto le lo inserisce in ordine crescente nella lista *)
(* insert : 'a -> 'a list -> 'a list *)
let rec insert elem = function
		| [] -> [elem]
		| hd::tl -> if elem < hd then elem::hd::tl else hd::(insert elem tl)


(* insertsort chiama a ripetizione la funzione insert su ogni elemento della lista da ordinare*)
(* insertsort : 'a list -> 'a list	 *)
let rec insertsort = function
	|  [] -> []   
	| hd::tl -> insert hd (insertsort tl)

