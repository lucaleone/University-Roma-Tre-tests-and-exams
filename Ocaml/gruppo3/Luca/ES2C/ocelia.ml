
let tutti_minori n =
	let rec aux res =
		try let newInput = int_of_string(read_line())
			in if newInput > n then aux false
			else aux res
		with _ -> res
	in aux true