let occorre n = let rec aux res = 
	try let num=int_of_string(read_line())
		in aux res||num=n
			with _ -> res	in aux false