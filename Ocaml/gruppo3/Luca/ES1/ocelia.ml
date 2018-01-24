exception NotValidData
(* val checkValidity : int * int -> bool *)
let checkValidity (h, m) =
	(h >=0 && h <=23) && (m >=0 && m <=59)

let somma_ore (h1, m1) (h2, m2) =
	if checkValidity (h1, m1) && checkValidity(h2, m2) then
		let sommaMinuti = m1 + m2
		in let minuti = sommaMinuti mod 60
		in let ore = h1 + h2 + (sommaMinuti /60)
		in if ore >23 then (ore mod 24, minuti)
		else (ore, minuti)
	else raise NotValidData
