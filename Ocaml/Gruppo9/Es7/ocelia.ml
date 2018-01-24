exception NotConjunction
(* and2list applicata a una congiunzione di letterali, riporti la lista dei letterali che la compongono *)
(* Se la formula non è una congiunzione di letterali, la funzione solleverà l'eccezione NotConjunction  *)
(* and2list : form -> form list *)
let rec and2list = function
	| Imp _ | Or _ -> raise NotConjunction
	| And(a, b) -> (and2list a)@(and2list b)
	| p -> [p]
	