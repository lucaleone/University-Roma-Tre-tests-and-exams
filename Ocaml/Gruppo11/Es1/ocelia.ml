type 'a graph = ('a * 'a) list
let grafo = [(1,2); (1,3); (1,4); (2,3); (2,4); (2,7);
	(3,5); (4,6); (4,7); (5,7); (6,7)]
	

(* codice scritto in classe *)
(* successori di un nodo in un grafo orientato *)
(* successori : 'a -> 'a graph -> 'a list  *)
let rec successori nodo = function 
      [] -> []
    | (x,y)::rest ->
        if x = nodo then y::successori nodo rest
        else successori nodo rest 

(* test_connessi graph start dest , verifica se il nodo start nel grafo graph può raggiungere il nodo dest*)
(* con una visita in profondita *)
(* test_connessi : ('a * 'a) list -> 'a -> 'a -> bool *)
(* search cerca nei successori il nodo di destinazione*)
(* search : 'a list -> 'a list -> bool *)
let test_connessi graph start dest =
		let rec search visited = function
		| [] -> raise Not_found
		| n:: rest ->
				if List.mem n visited
				then search visited rest
				else if n=dest then true
				else search (n:: visited) (rest @ (successori n graph))
	in search [] [start]
	