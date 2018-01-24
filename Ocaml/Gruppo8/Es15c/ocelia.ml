(* abr_update : ('a * 'b) tree -> 'a * 'b -> ('a * 'b) tree *)
(* abr_update abr (k,v) riporta l'albero che si ottiene da abr aggiungendo (k,v)*)
(* se abr contiene ià un elemento con chiave k, questo viene sostituito con (k,v)*)
let rec abr_update abr (k,v)=
	match abr with
	| Empty -> Tr((k,v),Empty,Empty)
	| Tr((a,b),t1,t2) -> if(a=k) then Tr((a,v),t1,t2)
	                     else if (k<a) then Tr((a,b), abr_update t1 (k,v), t2)
											else Tr((a,b),t1,abr_update t2 (k,v))