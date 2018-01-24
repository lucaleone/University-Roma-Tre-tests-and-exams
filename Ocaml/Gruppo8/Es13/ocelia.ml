(* path_coprente : 'a tree -> 'a list -> 'a list *)
(* dato un albero abr e una lista lst di elementi dello stesso tipo dei nodi di abr, restituisca,  *)
(* se esiste, un ramo dell’albero dalla radice a una foglia che contenga tutti i nodi di lst ed eventualmente anche altri nodi. *)
(* Se un tale cammino non esiste, il programma solleverà un’eccezione.  *)
let rec path_coprente abr lst =
	match lst, abr with
	|	_, Empty -> failwith "Il Cammino non esiste"
	| [], (Tr (a, Empty, Empty)) -> [a]
	| [], (Tr (a, t1, t2)) -> ( try [a]@(path_coprente t1 []) with _ -> [a]@(path_coprente t2 []) )
	| hd::[], (Tr (a, Empty, Empty)) -> if a = hd then [a] else failwith "Il Cammino non esiste"
	| lst, (Tr (a, t1, t2)) -> if List.mem a lst then let lst = List.filter (fun hd -> hd <> a) lst
				in (try [a]@(path_coprente t1 lst) with _ -> [a]@(path_coprente t2 lst))
			else (try [a]@(path_coprente t1 lst) with _ -> [a]@(path_coprente t2 lst))
