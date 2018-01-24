exception Stringa_Vuota

let maxstring s =
	let rec aux index idxMax =
		if s ="" then raise Stringa_Vuota
		else if index = String.length s then s.[idxMax]
		else if (s.[idxMax]) < (s.[index]) then aux (index + 1) index
		else aux (index + 1) idxMax
	in aux 0 0