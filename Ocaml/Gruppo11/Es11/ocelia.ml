type 'a graph = ('a * 'a) list

(* verifica che il numero n sia primo *)
(* is_prime : int -> bool *)
let is_prime n =
	let n = abs n 
	 in let rec is_not_divisor d = d * d > n || (n mod d <> 0 && is_not_divisor (d +1)) 
	  in n <> 1 && is_not_divisor 2

(* successori nodo grafo , restituisce i nodi primi successivi a nodo in grafo *)
(* successori : 'a -> ('a * int) list -> int list *)
let rec successori nodo = function
	| [] -> []
	| (x, y):: rest ->
			if x = nodo && is_prime y then y:: successori nodo rest
			else successori nodo rest

(* cammino_di_primi : (int * int) list -> int -> int -> int list *)
(* cammino_di_primi restituisce, se esiste, il cammino che va da ingresso a uscita *)
(* in cui tutti i passi sono primi, altrimenti solleva un'eccezione *)
(* cerca_da Ricerca da una singola casella *)
(* cerca_da: 'a list -> 'a -> 'a list  *)
(* cerca_da_una_tra , cerca fra i successori di una casella  *)
(* cerca_da_una_tra: 'a list -> 'a list *)
let cammino_di_primi grafo ingresso uscita =
	let rec cerca_da visited casella =
		if List.mem casella visited
			then raise Not_found
		else if casella = uscita
			then [casella]
		else casella :: cerca_da_una_tra (casella:: visited) (successori casella grafo)
	and cerca_da_una_tra visited = function
		|	[] -> raise Not_found
		| x:: rest ->	try cerca_da visited x
									with Not_found -> cerca_da_una_tra (x:: visited) rest
	in cerca_da [] ingresso
