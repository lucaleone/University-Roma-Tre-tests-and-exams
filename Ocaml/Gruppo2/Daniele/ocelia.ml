let ultime_cifre  n = 
	let x = abs n 
		in ((x/10) mod 10,x mod 10)

let bello n =
	if n = 0 || n = 3 ||n = 7 then true else
		let (penultima,ultima) = ultime_cifre n in 
			if (ultima = 0 || ultima = 3 ||ultima = 7) && (penultima != 0 && penultima != 3 && penultima != 7) then true
				else false
				
	let data (d,m) = 
		match (d,m) with 
  		| ("Gennaio",m) | ("Marzo",m) | ("Maggio",m) | ("Luglio",m) 
  		| ("Agosto",m) | ("Ottobre",m) | ("Dicembre",m) -> m<=31
  		| ("Aprile",m) | ("Giugno",m) | ("Settembre",m) | ("Novembre",m) -> m<=30
  		| ("Febbraio",m) -> m<=28
  		| (_,_) -> false