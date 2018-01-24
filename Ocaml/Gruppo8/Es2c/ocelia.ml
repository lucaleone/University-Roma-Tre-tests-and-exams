(* altezza : 'a tree -> int *)
(* dato un albero restituisce la sua altezza *)
let rec altezza = function
	  Empty -> 0
	| Tr (a, t1, t2) -> 1 + (max (altezza t1) (altezza t2))


(* confrontaAltezze : 'a tree -> 'b tree -> bool *)
(* controlla che la differenza fra le altezze non sia maggiore di 1 *)
let confrontaAltezze t1 t2 =
	(abs ((altezza t1) - (altezza t2))) <= 1
	
(* bilanciato : 'a tree -> bool *)
(* Controlla che un albero sia bilanciato *)
let rec bilanciato = function
	  Empty -> true
	| Tr (_, t1, t2) -> (confrontaAltezze t1 t2) && bilanciato t1 && bilanciato t2