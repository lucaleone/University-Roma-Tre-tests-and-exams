type 'a graph = ('a * 'a) list
(* codice scritto in classe *)
(* successori di un nodo in un grafo orientato che soddisfano al condizione p*)
(* successori : 'a -> ('b -> bool) -> ('a * 'b) list -> 'b list *)
let rec successori nodo p = function
	| [] -> []
	| (x, y):: rest ->
			if x = nodo && p y then y:: successori nodo p rest
			else successori nodo p rest

(* path_n_p : ('a * 'a) list -> ('a -> bool) -> int -> 'a -> 'a -> 'a list *)
(* path_n_p grafo p n ingresso uscita , restituisce un cammino non ciclico, da ingresso a uscita,*)
(* che soddisfi p ed ha lunghezza n, altrimenti lancia un'eccezione*)
(* cerca_da: 'a list -> 'a -> 'a -> 'a list  *)
(* cerca_da Ricerca da una singola casella *)
(* cerca_da_una_tra: 'a -> 'a list -> 'a list *)
(* cerca_da_una_tra , cerca fra i successori di una casella  *)
let path_n_p grafo p n ingresso uscita =
	let rec cerca_da visited idx casella =
		if List.mem casella visited then raise Not_found
		else if idx > n 
			then failwith "Cammino troppo lungo"
		else if casella = uscita
			then if idx = n 
					 	 then [casella] 
					 else failwith "Cammino in uscita troppo lungo"
		else casella :: cerca_da_una_tra idx (casella:: visited) (successori casella p grafo)
	and cerca_da_una_tra num visited = function
		|	[] -> failwith "Cammino non trovato, opzioni finite"
		| x:: rest ->	try cerca_da visited (num +1) x
									with _ -> cerca_da_una_tra num (x:: visited) rest
	in cerca_da [] 1 ingresso
