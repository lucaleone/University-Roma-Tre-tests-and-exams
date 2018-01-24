(* verifica_matrice: int -> int list list -> bool *)
(* dato un intero n e una matrice di interi (lista di liste), riporta true  *)
(* se la matrice contiene almeno una riga i cui elementi siano tutti minori di n *)
(* tramite exists scossiamo tutte le righe e controllimo con for_all per ogni riga se ne esiste una che ha tutti gli elementi minori di n*)
(* entrambi i fun hanno tipo 'a -> bool *)
let rec verifica_matrice n lst2 =
	List.exists ( fun hd -> List.for_all(fun hd2 -> hd2 < n) hd) lst2