let read_max () = let rec aux max = 
	try let num=int_of_string(read_line())
			in if max<num then aux num
				else aux max 
					with _ ->max in aux (int_of_string(read_line()))