
let occorre n =
	let rec aux res =
		try let newInput = int_of_string(read_line())
			in if newInput = n then aux (res +1)
			else aux res
		with _ -> res
	in aux 0