
let read_max_min () =
	let rec aux (max, min) =
		try let newInput = int_of_string(read_line())
			in if newInput > max then aux (newInput, min)
			else if newInput < min then aux (max, newInput)
			else aux (max, min)
		with _ -> (max, min)
	in aux (int_of_string(read_line()), int_of_string(read_line()))
