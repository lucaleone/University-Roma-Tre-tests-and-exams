(*Su eclipse la stringa vuota se non viene immesso nessun carattere *)
(* viene comunuqe registrato ";;" *)	
let stringa_max () = let rec aux max = 
	let s = read_line ()
		in if s=";;" then max
			else if (String.length s) > (String.length max) then aux s
				else aux max in aux (read_line ())