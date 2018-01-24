(* funzione definita in classe *)
(* cons : 'a -> 'a list -> 'a list *)
let cons x rest =
	x:: rest

(* interleave: ’a -> ’a list -> ’a list list *)
(* interleave n lst riporta una lista con tutte le liste che si ottengono inserendo n in tutte le possibili posizioni in lst *)
let rec interleave n lst =
	match lst with
	| [] -> [[n]]
	| hd::tl -> (n:: lst) :: List.map (cons hd) (interleave n tl)