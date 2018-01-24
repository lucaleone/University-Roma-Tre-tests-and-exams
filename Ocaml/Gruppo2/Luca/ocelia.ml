(* val ultime_cifre : int -> int * int *)
let ultime_cifre  n = 
	let x = abs n 
		in ((x/10) mod 10,x mod 10)

(*val bello : int -> bool *)
let bello value =
	let (penultima, ultima) = ultime_cifre value in
	(ultima = 0 || ultima = 3 || ultima = 7 ) && ( penultima <> 0 && penultima <> 3 && penultima <> 7)
	
(* val data : int * string -> bool *)
let data (giorno, mese) =
	giorno >0 && match mese with
	| "febbraio" -> giorno <=28
	| "aprile"	| "giugno"	| "settembre"	| "novembre" -> giorno <=30
	| "gennaio" | "marzo" | "maggio" | "luglio" | "agosto" | "ottobre" | "dicembre" -> giorno <=31
	| _ -> false
