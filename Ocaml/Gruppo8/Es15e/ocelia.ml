(* maxAbr : 'a tree -> 'a tree *)
(* riporta il sottoalbero con etichetta di valore massimo dell'albero binario di ricerca passato a parametro *)
let rec maxAbr = function
	| Empty -> failwith "chiave non esistente"
    | Tr(_, _, Empty) as node->  node
	| Tr(_, _, dx) -> maxAbr dx
		
(* abr_delete : ('a * 'b) tree -> 'a -> ('a * 'b) tree *)
(* implementa l’algoritmo di cancellazione di un elemento da un albero binario di ricerca Abr *)
let rec abr_delete abr k =
	match abr with
	| Empty -> Empty
	| Tr((a,b),t1,t2) as nodo -> if a = k then 
				(	match nodo with
  				|  Tr(_, Empty, Empty)->Empty
					|  Tr(_, figlio, Empty)	|  Tr(_, Empty, figlio)->figlio
					| Tr(_, sx, dx)	-> let Tr ((a,b), _, _) = maxAbr sx in
        Tr ((a,b), abr_delete sx a, Empty) )
	                     else if (k<a) then Tr((a,b), abr_delete t1 k, t2)
											else Tr((a,b),t1,abr_delete t2 k)
