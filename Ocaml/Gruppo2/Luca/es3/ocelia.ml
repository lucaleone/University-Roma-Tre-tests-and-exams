(* val data : int * string -> bool *)
let data (giorno, mese) =
	giorno >0 && match mese with
	| "febbraio" -> giorno <=28
	| "aprile"	| "giugno"	| "settembre"	| "novembre" -> giorno <=30
	| "gennaio" | "marzo" | "maggio" | "luglio" | "agosto" | "ottobre" | "dicembre" -> giorno <=31
	| _ -> false
