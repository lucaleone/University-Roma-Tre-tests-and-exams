exception Stringa_Vuota

let maxstring s = let rec aux i m = 
	if s="" then raise Stringa_Vuota
  	else if i=String.length s then s.[m] 
  		else if (s.[m]) < (s.[i]) then aux (i+1) i 
  			else aux (i+1) m in aux 0 0