let copy n x =
	let rec aux index lst =
		match index with
		| 0 -> lst
		| _ -> aux (index-1) (x::lst)
		in aux n []

let nondec lst =
	let rec aux res lst =
		match lst with
		| [] -> res
		| hd::tl -> if tl!= [] then 
			aux (res&&(hd<=(List.hd tl))) tl else
				res
		in aux true lst
		
let pairwith y xs = 
	let rec aux xs res =
		match xs with
		| [] -> res
		| hd::tl -> aux tl ((y,hd)::res)
		in aux (List.rev xs) [] 
		
let duplica lst = 
	let rec aux lst res =
		match lst with 
		| [] -> res
		| hd::tl -> aux tl (hd::(hd::res))
		in aux (List.rev lst) []
		
let enumera lst = 
	let rec aux n lst2 res =
		match n with
		| -1 -> res
		| _ -> aux (n-1) (List.tl lst2) ((n,List.hd lst2)::res)
		in aux (List.length lst -1) (List.rev lst) []
		
let position x lst =
	let rec aux lst res = 
		match lst with
		| [] -> failwith "Non c'è nessuna occorrenza"
		| hd::tl -> if hd = x then res
		 else aux tl (res+1)
		in aux lst 0