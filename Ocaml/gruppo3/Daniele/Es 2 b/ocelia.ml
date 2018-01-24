let read_max_min () = let rec aux max min = 
	try let num=int_of_string(read_line())
			in if max<num then aux num min
				else if num<min then aux max num
					else aux max min 
						with _ -> (max,min) in aux (int_of_string(read_line())) (int_of_string(read_line()))