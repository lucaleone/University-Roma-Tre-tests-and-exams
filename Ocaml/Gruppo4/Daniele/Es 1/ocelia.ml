(*versione recursive*)
let rec length lista = 
	match lista with [] -> 0
	|x::rest -> 1+ (length rest)

(*versione iterativa*)
let length lista = let rec aux i lista =
	match lista with [] -> i
	|x::rest -> aux (i+1) rest
	 in aux 0 lista

(*versione recursive*)	
let rec sumof lista =
	match lista with [] -> 0
	|x::rest -> x + (sumof rest)

(*versione iterativa*)
let sumof lista = let rec aux i lista =
	match lista with [] -> i
	|x::rest -> aux (i+x) rest
	 in aux 0 lista
	
let maxlist lista = 
	if lista = [] then failwith "Lista Vuota" 
	else let rec aux i lista = 
	match lista with [] -> i 
	|x::rest -> aux (max x i) rest
	in aux (List.hd lista) lista
	
let drop n lst = if (List.length lst) <= n then []
 else let rec aux n lst = 
	match n with 0 -> lst 
 |_ -> aux (n-1) (List.tl lst)
 in aux n lst

let rec append lst1 lst2 = 
	match lst2 with [] -> lst1 
	|x::rest -> append (x::lst1) rest
 
let reverse lst = let rec aux lst rev =
	match lst with [] -> rev
	|x::rest -> aux rest (x::rev)
	in aux lst []
	
let nth n lst = 
	if n<0 || n>(List.length lst) then failwith "Lista troppo corta"
	else let rec aux n lst = 
		match n with 0 -> List.hd lst
		|_ -> aux (n-1) (List.tl lst)
		in aux n lst
		
let remove x lst = let rec aux lst res = 
	match lst with [] -> res
	|hd::rest -> if hd=x then aux rest res
	 else aux rest (hd::res)
	in aux lst []