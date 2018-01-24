(* stessa_struttura : 'a tree -> 'b tree -> bool *)
(* stessa_struttura e1 e2 Determina se gli alberi binari e1 e e2 hanno la stessa struttura (ignorando quindi le etichette) *)
let rec stessa_struttura e1 e2 =
	match e1,e2 with
	| Empty,Empty -> true
	| (Tr (_, a, b)),( Tr (_, c, d)) -> stessa_struttura a c && stessa_struttura b d
	| _,_ ->false