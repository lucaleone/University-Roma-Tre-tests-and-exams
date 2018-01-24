type 'a graph = ('a * 'a) list
let cerchio = [(1,2); (1,3); (1,4); (2,3); (2,4); (2,7);
	(3,5); (4,6); (4,7); (5,7); (6,7)]
	
(* fornisce una lista a partire da lst senza un'occorrenza di x, *)
(* se x non esiste in lst restituisce una lista con gli stessi elementi *)
(* remove : 'a -> 'a list -> 'a list *)
(* remove : 'a list -> 'a list -> 'a list *)
let remove x lst =
	let rec aux prev = function
		| [] -> prev
		| hd::tl -> if hd = x then (prev@tl) else aux (hd::prev) tl
	in aux [] lst	

(* codice scritto in classe *)
(* successori di un nodo in un grafo orientato *)
(* successori : 'a -> 'a graph -> 'a list  *)
let rec successori nodo = function 
      [] -> []
    | (x,y)::rest ->
        if x = nodo then y::successori nodo rest
        else successori nodo rest 
				
(* cammino_con_nodi: ’a graph -> ’a -> ’a list -> ’a list *)
(* dato un grafo orientato grafo, un nodo e una lista lst senza ripetizioni, *)
(* restituisca, se esiste, un cammino senza cicli che, partendo da start, *)
(* contenga tutti i nodi di lst(in qualsiasi ordine) ed eventualmente anche altri nodi. *)
(* Se un tale cammino non esiste, il programma solleverà un’eccezione. *)
(* search : ’a list -> ’a list -> ’a list -> ’a list  *)
(*search visited lst lst2 scorre i nodi archiviando quelli visitati in visited per trovare un 
cammino che contiene tutti gli elementi di lst*)
let cammino_con_nodi graph start lst =
		let rec search visited lst = function
		| [] -> if lst = [] then true else failwith "Cammino non trovato"
		| n:: rest -> 
				if lst = [] 
					then true 
				else if List.mem n visited
					then search visited lst rest
				else search (n:: visited) (remove n lst) (rest @ (successori n graph))
	in search [] lst [start] 
	
	
	
	
