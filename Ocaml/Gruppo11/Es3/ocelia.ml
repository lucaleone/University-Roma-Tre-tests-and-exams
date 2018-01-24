type 'a graph = ('a * 'a) list

(* codice scritto in classe *)
(* successori di un nodo in un grafo orientato *)
(* successori : 'a -> 'a graph -> 'a list  *)
let rec successori nodo = function
	|	[] -> []
	| (x, y):: rest ->
			if x = nodo then y:: successori nodo rest
			else successori nodo rest

(* ciclo : ('a * 'a) list -> 'a -> 'a list *)
(* ciclo grafo ingresso , dato un grafo orientato e un nodo ingresso, riporti, se esiste, un ciclo su ingresso,*)
(*  altrimenti sollevi un’eccezione  *)
(* cerca_da Ricerca da una singola casella *)
(* cerca_da: 'a list -> 'a -> 'a list  *)
(* cerca_da_una_tra , cerca fra i successori di una casella  *)
(* cerca_da_una_tra: 'a list -> 'a list *)
let ciclo grafo ingresso =	
	let rec cerca_da visited casella =
			if (List.mem ingresso visited) && casella = ingresso
				then [casella]
			else
				casella :: cerca_da_una_tra (casella:: visited) (successori casella grafo)
	and cerca_da_una_tra visited = function
		|	[] -> raise Not_found
		| x:: rest ->
				try cerca_da visited x
				with Not_found -> cerca_da_una_tra (x:: visited) rest
	in cerca_da [] ingresso
	
	