(* prodotto : nat -> nat -> nat *)
(* prodotto n m fa la moltiplicazione fra due elementi di tipo nat *)
(* riportando a sua volta un nat *)
(* aux : nat -> nat -> nat *)
(* aux res n somma m a se stesso n volte conservando il risultato in res*)
(* aux usa la funzione somma definita a lezione*)
let prodotto n m =
	let rec aux res n =
		match n with
		| Succ k -> aux (somma res m) k
		| Zero -> res
	in aux Zero n