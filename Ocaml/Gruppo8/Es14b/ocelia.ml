type col = Rosso | Giallo | Verde | Blu
type 'a col_assoc = (col * 'a list)list
type 'a tree = Empty | Tr of 'a * 'a tree * 'a tree

let rec colore x = function
	| [] -> failwith "oggetto non presente"
	| (a,lst)::rest -> if (List.mem x lst) then a
										 else colore x rest
 
let equals a lst = function
	| Empty -> true
	| Tr(b, sx, dx) -> (colore a lst) == (colore b lst) 

let rec path_to elem lst = function
	| Empty -> failwith "Elemento non esistente"
	| Tr(a, sx, dx) -> if elem = a then [a] 
										 else if not (equals a lst sx)  then (a::(path_to elem lst sx))
										 else if not (equals a lst dx) then (a::(path_to elem lst dx))
										 else failwith "Percorso non esistente"

