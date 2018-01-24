(*Su eclipse la stringa vuota se non viene immesso nessun carattere *)
(* viene comunuqe registrato ";;" *)		
let num_di_stringhe () = let rec aux i = 
	let s = read_line ()
		in if s=";;" then i
			else aux (i+1) in aux 0