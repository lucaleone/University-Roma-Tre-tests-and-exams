(* applica : ('a * 'a tree) list -> 'a tree -> 'a tree *)
(* applica subst tr riporta l'albero che si ottiene applicando la sostituzione subst a tr*)
let rec applica subst = function
	| Empty -> Empty
	| Tr(a,Empty,Empty)->if(List.mem_assoc a subst) then
				 List.assoc a subst
			else Tr(a, Empty, Empty)
	| Tr(a, t1, t2) -> Tr(a, applica subst t1, applica subst t2)