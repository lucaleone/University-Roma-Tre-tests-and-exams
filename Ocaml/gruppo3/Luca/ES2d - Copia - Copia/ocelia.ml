
let stringa_max () =
	let rec aux max =
		try let newString = read_line()
			in if newString =";;" || newString = "/0" then max
			else if (String.length newString) > (String.length max) then aux newString
			else aux max
		with _ -> max
	in aux (read_line())