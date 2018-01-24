
let num_di_stringhe () =
	let rec aux (stringa, res) =
		if stringa =";;" || stringa = "/0" then res
		else aux (read_line(), (res +1))
	in aux (read_line(), 0)
