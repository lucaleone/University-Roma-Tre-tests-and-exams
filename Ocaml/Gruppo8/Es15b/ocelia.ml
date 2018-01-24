type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree

let rec abr_search k = function
	| Empty -> failwith "chiave non esistente"
	| Tr((a,b), sx, dx) -> if k=a then b 
												 else if k < a then abr_search k sx 
												 else abr_search k dx