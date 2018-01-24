(* partition : 'a list -> 'a -> 'a list * 'a list *)
(* partition lst x ritorna una tupla dove smaller sono gli elementi che soddisfano hd < x, gli altri vanno in larger *)
(* lst è la lista da ordinare *)
(* aux: 'a list * 'a list ->'a list -> 'a list * 'a list *)
(* la tupla smaller, larger viene utilizzata per il risultato *)
let partition lst x =
	let rec aux (smaller, larger) lst =
		match lst with
		| [] -> (smaller, larger)
		| hd:: tl -> if hd < x then aux ((hd:: smaller), larger) tl else aux (smaller, (hd:: larger) ) tl
	in aux ([],[]) lst
	
(* quicksort va a chiamare partition per ottener la lista di elemnti che soddisfano la condizione e quelli che non la soddisfano*)
(* Va quindi a concatenare un quicksort degli elementi minori, con l'elemento corrente in testa aggiunto ad un quicksort dei quelli maggiori *)
(* quicksort : 'a list -> 'a list *)
let rec quicksort = function
		[] -> []
	| x:: xs -> let (smaller, larger) = partition xs x
			in (quicksort smaller) @ (x:: quicksort larger)
