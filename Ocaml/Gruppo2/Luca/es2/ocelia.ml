
(* il metodo seguente fa uso della funzione ultime_cifre che è nel primo file,
qui la uso come se fossero nello stesso modulo *)

(*val bello : int -> bool *)
let bello value =
	let (penultima, ultima) = ultime_cifre value in
	(ultima = 0 || ultima = 3 || ultima = 7 ) && ( penultima <> 0 && penultima <> 3 && penultima <> 7)
